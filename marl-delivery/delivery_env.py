import numpy as np
from gym import Env
from gym.spaces import MultiDiscrete
import random

class Package:
    def __init__(self, package_id, start, target, start_time, deadline):
        self.package_id = package_id
        self.start = start
        self.target = target
        self.start_time = start_time
        self.deadline = deadline
        self.status = 'waiting'  # 'waiting', 'in_transit', 'delivered'

class Robot:
    def __init__(self, position):
        self.position = position
        self.carrying = 0  # 0: not carrying, >0: package_id

class DeliveryEnv(Env):
    def __init__(self, map_file, n_robots=3, n_packages=10, max_time_steps=50,
                 move_cost=-0.01, delivery_reward=10.0, delay_reward=1.0, seed=2025):
        super(DeliveryEnv, self).__init__()
        self.map_file = map_file
        self.grid = self.load_map()
        self.n_rows = len(self.grid)
        self.n_cols = len(self.grid[0]) if self.grid else 0
        self.n_robots = n_robots
        self.n_packages = n_packages
        self.max_time_steps = max_time_steps
        self.move_cost = move_cost
        self.delivery_reward = delivery_reward
        self.delay_reward = delay_reward
        self.seed = seed
        self.rng = np.random.RandomState(seed)
        self.action_space = MultiDiscrete([5, 3] * self.n_robots)  # 5 moves, 3 package actions per robot
        self.reset()

    def load_map(self):
        try:
            with open(self.map_file, 'r') as f:
                lines = f.readlines()
            grid = [[int(x) for x in line.split()] for line in lines]
            if not grid or not all(len(row) == len(grid[0]) for row in grid):
                raise ValueError("Invalid map: All rows must have the same length")
            return grid
        except Exception as e:
            print(f"Error loading map: {str(e)}")
            return []

    def reset(self):
        self.t = 0
        self.robots = []
        self.packages = []
        self.total_distance = 0
        self.total_empty_distance = 0
        self.total_deliveries = 0
        self.done = False
        # Place robots at random free positions
        free_positions = [(i, j) for i in range(self.n_rows) for j in range(self.n_cols) if self.grid[i][j] == 0]
        robot_positions = self.rng.choice(len(free_positions), self.n_robots, replace=False)
        for idx in robot_positions:
            self.robots.append(Robot(list(free_positions[idx])))
        # Place packages with random start/target and start_time
        for i in range(self.n_packages):
            while True:
                start = random.choice(free_positions)
                target = random.choice(free_positions)
                if start != target:
                    break
            start_time = self.rng.randint(0, self.max_time_steps // 2)
            deadline = start_time + self.rng.randint(5, self.max_time_steps - start_time)
            self.packages.append(Package(i+1, start, target, start_time, deadline))
        return self.get_state()

    def get_state(self):
        # Only show packages that are available (start_time <= t and not delivered)
        package_data = np.zeros((self.n_packages, 7), dtype=np.int32)
        for i, package in enumerate(self.packages):
            if package.status != 'delivered' and package.start_time <= self.t:
                package_data[i] = [package.package_id, package.start[0], package.start[1],
                                   package.target[0], package.target[1], package.start_time, package.deadline]
        state = {
            'grid': np.array(self.grid, dtype=np.int8),
            'robots': np.array([(robot.position[0], robot.position[1], robot.carrying) for robot in self.robots], dtype=np.int32),
            'packages': package_data
        }
        return state

    def step(self, actions):
        if len(actions) != self.n_robots * 2:
            raise ValueError(f"Invalid number of actions: expected {self.n_robots * 2}, got {len(actions)}")
        reward = 0
        deliveries = 0
        step_distance = 0
        step_empty_distance = 0
        moves = [(0, 0), (0, -1), (0, 1), (-1, 0), (1, 0)]  # S, L, R, U, D
        # 1. Tính vị trí mới đề xuất cho từng robot
        proposed_positions = []
        for i, robot in enumerate(self.robots):
            move_action = actions[i * 2]
            dx, dy = moves[move_action]
            new_x, new_y = robot.position[0] + dx, robot.position[1] + dy
            # Không cho ra ngoài map hoặc vào vật cản
            if (0 <= new_x < self.n_rows and 0 <= new_y < self.n_cols and self.grid[new_x][new_y] == 0):
                proposed_positions.append([new_x, new_y])
            else:
                proposed_positions.append(robot.position[:])
        # 2. Xử lý va chạm: robot chỉ số nhỏ hơn được ưu tiên
        final_positions = [None] * self.n_robots
        occupied = {}
        for i in range(self.n_robots):
            pos = tuple(proposed_positions[i])
            if pos not in occupied:
                final_positions[i] = list(pos)
                occupied[pos] = i
            else:
                # Robot này bị kẹt, đứng yên
                final_positions[i] = self.robots[i].position[:]
        # 3. Cập nhật vị trí robot, tính chi phí di chuyển và reward shaping di chuyển
        for i, robot in enumerate(self.robots):
            old_pos = robot.position[:]
            robot.position = final_positions[i]
            if robot.position != old_pos:
                reward += -0.01
                step_distance += 1
                if robot.carrying == 0:
                    step_empty_distance += 1
            # Reward shaping: thưởng nhỏ khi tiến gần package/target
            shaping = 0
            if robot.carrying == 0:
                # Tiến gần package khả dụng nhất
                min_pkg_dist = float('inf')
                min_pkg = None
                for package in self.packages:
                    if package.status == 'waiting' and package.start_time <= self.t:
                        pkg_dist = abs(old_pos[0] - package.start[0]) + abs(old_pos[1] - package.start[1])
                        if pkg_dist < min_pkg_dist:
                            min_pkg_dist = pkg_dist
                            min_pkg = package
                if min_pkg is not None:
                    new_dist = abs(robot.position[0] - min_pkg.start[0]) + abs(robot.position[1] - min_pkg.start[1])
                    if new_dist < min_pkg_dist:
                        shaping += 0.2  # thưởng nhỏ khi tiến gần hơn
                    elif new_dist > min_pkg_dist:
                        shaping -= 0.05  # phạt nhẹ nếu đi xa hơn
            else:
                carried = next((p for p in self.packages if p.package_id == robot.carrying), None)
                if carried:
                    old_dist = abs(old_pos[0] - carried.target[0]) + abs(old_pos[1] - carried.target[1])
                    new_dist = abs(robot.position[0] - carried.target[0]) + abs(robot.position[1] - carried.target[1])
                    if new_dist < old_dist:
                        shaping += 0.2  # thưởng nhỏ khi tiến gần hơn target
                    elif new_dist > old_dist:
                        shaping -= 0.05  # phạt nhẹ nếu đi xa hơn target
            reward += shaping
        # 4. Xử lý nhặt và trả hàng (sau khi di chuyển)
        # 4.1 Trả hàng
        for i, robot in enumerate(self.robots):
            pkg_action = actions[i * 2 + 1]
            if pkg_action == 2 and robot.carrying != 0:
                package = next((p for p in self.packages if p.package_id == robot.carrying), None)
                if package and package.status == 'in_transit':
                    if robot.position == package.target:
                        if self.t <= package.deadline:
                            reward += 10.0
                        else:
                            reward += 1.0
                        package.status = 'delivered'
                        robot.carrying = 0
                        deliveries += 1
                        reward += 1.0  # thưởng nhỏ cho hành động thả đúng vị trí
                    else:
                        # Thả sai vị trí, phạt nhẹ
                        reward -= 0.2
        # 4.2 Nhặt hàng (ưu tiên gói có chỉ số nhỏ nhất)
        for i, robot in enumerate(self.robots):
            pkg_action = actions[i * 2 + 1]
            if pkg_action == 1 and robot.carrying == 0:
                # Tìm gói hàng có chỉ số nhỏ nhất tại vị trí này
                candidates = [p for p in self.packages if p.status == 'waiting' and p.start_time <= self.t and p.start == robot.position]
                if candidates:
                    package = min(candidates, key=lambda p: p.package_id)
                    robot.carrying = package.package_id
                    package.status = 'in_transit'
                    reward += 1.0  # thưởng nhỏ khi nhặt được hàng
        # 5. Phạt các gói hàng quá hạn chưa giao (nếu muốn, có thể thêm penalty nhẹ)
        for package in self.packages:
            if package.status != 'delivered' and self.t > package.deadline:
                reward -= 0.05  # phạt nhẹ nếu quá hạn
        self.t += 1
        self.total_distance += step_distance
        self.total_empty_distance += step_empty_distance
        self.total_deliveries += deliveries
        done = self.t >= self.max_time_steps or all(p.status == 'delivered' for p in self.packages)
        info = {
            'delivery_rate': self.total_deliveries / max(1, self.n_packages),
            'total_distance': self.total_distance,
            'total_empty_distance': self.total_empty_distance
        }
        return self.get_state(), reward, done, info

    def render(self):
        grid = np.array(self.grid, dtype=str)
        for robot in self.robots:
            grid[robot.position[0]][robot.position[1]] = 'R' if robot.carrying == 0 else 'C'
        for package in self.packages:
            if package.status == 'waiting' and package.start_time <= self.t:
                grid[package.start[0]][package.start[1]] = 'P'
            elif package.status == 'delivered':
                grid[package.target[0]][package.target[1]] = 'D'
        print("\nRender:")
        for row in grid:
            print(' '.join(row))

    def is_free_cell(self, position):
        r, c = position
        if r < 0 or r >= self.n_rows or c < 0 or c >= self.n_cols:
            return False
        return self.grid[r][c] == 0

    def add_robot(self, position):
        if self.is_free_cell(position):
            robot = Robot(position)
            self.robots.append(robot)
        else:
            raise ValueError("Invalid robot position: must be on a free cell not occupied by an obstacle or another robot.")

    def get_random_free_cell_p(self):
        free_cells = [(i, j) for i in range(self.n_rows) for j in range(self.n_cols) if self.grid[i][j] == 0]
        i = self.rng.randint(0, len(free_cells))
        return free_cells[i]

    def get_random_free_cell(self, new_grid):
        free_cells = [(i, j) for i in range(self.n_rows) for j in range(self.n_cols) if new_grid[i][j] == 0]
        i = self.rng.randint(0, len(free_cells))
        new_grid[free_cells[i][0]][free_cells[i][1]] = 1
        return free_cells[i], new_grid

    def compute_new_position(self, position, move):
        r, c = position
        if move == 0:  # S
            return (r, c)
        elif move == 1:  # L
            return (r, c - 1)
        elif move == 2:  # R
            return (r, c + 1)
        elif move == 3:  # U
            return (r - 1, c)
        elif move == 4:  # D
            return (r + 1, c)
        else:
            return (r, c)

    def valid_position(self, pos):
        r, c = pos
        if r < 0 or r >= self.n_rows or c < 0 or c >= self.n_cols:
            return False
        if self.grid[r][c] == 1:
            return False
        return True

    def check_terminate(self):
        if self.t == self.max_time_steps:
            return True
        for p in self.packages:
            if p.status != 'delivered':
                return False
        return True