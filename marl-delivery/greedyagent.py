import numpy as np
# Run a BFS to find the path from start to goal
def run_bfs(map, start, goal):
    n_rows = len(map)
    n_cols = len(map[0])

    queue = []
    visited = set()
    queue.append((goal, []))
    visited.add(goal)
    d = {}
    d[goal] = 0

    while queue:
        current, path = queue.pop(0)

        for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
            next_pos = (current[0] + dx, current[1] + dy)
            if next_pos[0] < 0 or next_pos[0] >= n_rows or next_pos[1] < 0 or next_pos[1] >= n_cols:
                continue
            if next_pos not in visited and map[next_pos[0]][next_pos[1]] == 0:
                visited.add(next_pos)
                d[next_pos] = d[current] + 1
                queue.append((next_pos, path + [next_pos]))

    if start not in d:
        return 'S', 100000
    
    # Direction mapping to match environment (S=Stay, L=Left, R=Right, U=Up, D=Down)
    actions = ['S', 'L', 'R', 'U', 'D']
    directions = [(0, 0), (0, -1), (0, 1), (-1, 0), (1, 0)]  # S, L, R, U, D
    
    current = start
    for i, (dx, dy) in enumerate(directions):
        next_pos = (current[0] + dx, current[1] + dy)
        # Check if this move leads to a shorter path
        if next_pos in d and d[next_pos] == d[current] - 1:
            return actions[i], d[next_pos]
    
    return 'S', d[start]

class GreedyAgents:
    """
    A greedy agent implementation for multi-robot package delivery.
    Each robot will be assigned to the closest available package.
    """
    
    # Robot states
    IDLE = 'idle'             # Robot is idle, looking for a package
    MOVING_TO_PICKUP = 'to_pickup'    # Robot is moving to pick up a package
    MOVING_TO_DELIVER = 'to_deliver'  # Robot is moving to deliver a package
    
    def __init__(self):
        self.robots = []          # List of robot positions and states
        self.robot_states = []    # Current state of each robot (IDLE, MOVING_TO_PICKUP, MOVING_TO_DELIVER)
        self.robot_targets = []   # Package ID assigned to each robot (-1 if none)
        self.packages = []        # List of package information
        self.package_assigned = [] # Whether each package is assigned to a robot
        self.n_robots = 0
        self.map = None
        self.is_initialized = False
    
    def init_agents(self, state):
        """Initialize agents from environment state."""
        self.n_robots = len(state['robots'])
        self.map = state['map']
        
        # Initialize robots (convert 1-indexed to 0-indexed)
        self.robots = [(r[0]-1, r[1]-1, r[2]) for r in state['robots']]
        
        # Initialize robot states and targets
        self.robot_states = [self.IDLE] * self.n_robots
        self.robot_targets = [-1] * self.n_robots
        
        # Initialize packages (convert 1-indexed to 0-indexed coordinates)
        self.packages = []
        for p in state['packages']:
            # Package format: [id, start_x, start_y, target_x, target_y, start_time, deadline]
            self.packages.append((p[0], p[1]-1, p[2]-1, p[3]-1, p[4]-1, p[5], p[6]))
        
        # Initialize package assignment status
        self.package_assigned = [False] * len(self.packages)
        
        self.is_initialized = True
        print(f"Initialized {self.n_robots} robots and {len(self.packages)} packages")
    
    def update_state(self, state):
        """Update agent state from environment state."""
        if not self.is_initialized:
            self.init_agents(state)
            return
        
        # Update robot positions
        for i, robot in enumerate(state['robots']):
            carrying_pkg_id = robot[2]
            old_pos = (self.robots[i][0], self.robots[i][1])
            new_pos = (robot[0]-1, robot[1]-1)
            
            # Update robot position
            self.robots[i] = (new_pos[0], new_pos[1], carrying_pkg_id)
            
            # Update robot state based on carrying status
            if carrying_pkg_id == 0:  # Not carrying a package
                if self.robot_states[i] == self.MOVING_TO_DELIVER:
                    # Just delivered a package
                    print(f"Robot {i} delivered package {self.robot_targets[i]}")
                    self.robot_states[i] = self.IDLE
                    self.robot_targets[i] = -1
            else:  # Carrying a package
                if self.robot_states[i] == self.MOVING_TO_PICKUP:
                    # Just picked up a package
                    print(f"Robot {i} picked up package {carrying_pkg_id}")
                    self.robot_states[i] = self.MOVING_TO_DELIVER
                    self.robot_targets[i] = carrying_pkg_id - 1  # Convert to 0-indexed
        
        # Update package information
        self.packages = []
        for p in state['packages']:
            self.packages.append((p[0], p[1]-1, p[2]-1, p[3]-1, p[4]-1, p[5], p[6]))
        
        # Reset package assignment for IDLE robots
        self.package_assigned = [False] * len(self.packages)
        for i in range(self.n_robots):
            if self.robot_states[i] != self.IDLE and self.robot_targets[i] >= 0:
                # Mark packages that are already assigned to robots
                pkg_idx = self.robot_targets[i]
                if 0 <= pkg_idx < len(self.package_assigned):
                    self.package_assigned[pkg_idx] = True
    
    def get_next_action(self, robot_id):
        """Get the next action for a robot based on its current state."""
        robot = self.robots[robot_id]
        robot_pos = (robot[0], robot[1])
        state = self.robot_states[robot_id]
        
        # If the robot is idle, find a new package
        if state == self.IDLE:
            # Find the closest unassigned package
            closest_pkg_idx = self.find_closest_package(robot_id, robot_pos)
            
            if closest_pkg_idx is not None:
                # Assign the package to this robot
                pkg_id = closest_pkg_idx
                self.robot_targets[robot_id] = pkg_id
                self.robot_states[robot_id] = self.MOVING_TO_PICKUP
                self.package_assigned[pkg_id] = True
                print(f"Robot {robot_id} assigned to package {pkg_id} (ID:{self.packages[pkg_id][0]})")
                
                # Decide the next move toward pickup location
                pkg = self.packages[pkg_id]
                target_pos = (pkg[1], pkg[2])  # Package start position
                
                # Check if already at pickup location
                if robot_pos == target_pos:
                    print(f"Robot {robot_id} already at pickup location, picking up package {pkg_id}")
                    return 'S', '1'  # Stay and pick up
                else:
                    # Use BFS to find path to pickup location
                    move, _ = run_bfs(self.map, robot_pos, target_pos)
                    return move, '0'  # Move toward package
            else:
                # No available packages, stay in place
                return 'S', '0'
        
        # If the robot is moving to pick up a package
        elif state == self.MOVING_TO_PICKUP:
            pkg_id = self.robot_targets[robot_id]
            
            # Verify package still exists and is valid
            if pkg_id < 0 or pkg_id >= len(self.packages):
                print(f"Invalid package ID {pkg_id} for robot {robot_id}, setting to IDLE")
                self.robot_states[robot_id] = self.IDLE
                self.robot_targets[robot_id] = -1
                return 'S', '0'
            
            pkg = self.packages[pkg_id]
            target_pos = (pkg[1], pkg[2])  # Package start position
            
            # Check if at pickup location
            if robot_pos == target_pos:
                print(f"Robot {robot_id} at pickup location, picking up package {pkg_id}")
                return 'S', '1'  # Stay and pick up
            else:
                # Move toward pickup location
                move, _ = run_bfs(self.map, robot_pos, target_pos)
                return move, '0'
        
        # If the robot is moving to deliver a package
        elif state == self.MOVING_TO_DELIVER:
            pkg_id = self.robot_targets[robot_id]
            
            # Verify package still exists and is valid
            if pkg_id < 0 or pkg_id >= len(self.packages):
                print(f"Invalid package ID {pkg_id} for robot {robot_id}, setting to IDLE")
                self.robot_states[robot_id] = self.IDLE
                self.robot_targets[robot_id] = -1
                return 'S', '0'
            
            pkg = self.packages[pkg_id]
            target_pos = (pkg[3], pkg[4])  # Package delivery position
            
            # Check if at delivery location
            if robot_pos == target_pos:
                print(f"Robot {robot_id} at delivery location, dropping package {pkg_id}")
                return 'S', '2'  # Stay and drop off
            else:
                # Move toward delivery location
                move, _ = run_bfs(self.map, robot_pos, target_pos)
                return move, '0'
        
        # Default action if something unexpected happens
        return 'S', '0'
    
    def find_closest_package(self, robot_id, robot_pos):
        """Find the closest unassigned package to the robot."""
        available_packages = []
        
        # First collect all available packages with their distances
        for i, pkg in enumerate(self.packages):
            # Skip assigned packages
            if self.package_assigned[i]:
                continue
            
            # Calculate Manhattan distance to package pickup location
            pkg_pos = (pkg[1], pkg[2])
            dist = abs(pkg_pos[0] - robot_pos[0]) + abs(pkg_pos[1] - robot_pos[1])
            available_packages.append((i, dist))
        
        # No available packages
        if not available_packages:
            return None
        
        # Sort packages by distance
        available_packages.sort(key=lambda x: x[1])
        
        # Check if any other robot is closer to this package
        for pkg_idx, pkg_dist in available_packages:
            is_best_robot = True
            
            for other_robot_id in range(self.n_robots):
                # Skip self
                if other_robot_id == robot_id:
                    continue
                
                # Skip robots already assigned to packages
                if self.robot_states[other_robot_id] != self.IDLE:
                    continue
                
                other_robot_pos = (self.robots[other_robot_id][0], self.robots[other_robot_id][1])
                pkg = self.packages[pkg_idx]
                pkg_pos = (pkg[1], pkg[2])
                other_dist = abs(pkg_pos[0] - other_robot_pos[0]) + abs(pkg_pos[1] - other_robot_pos[1])
                
                # If another robot is closer to this package
                if other_dist < pkg_dist:
                    # And that robot has lower ID (higher priority)
                    if other_robot_id < robot_id:
                        is_best_robot = False
                        break
            
            # This robot is the best candidate for this package
            if is_best_robot:
                return pkg_idx
        
        # If we get here, there are no available packages for which this robot is the best candidate
        # Just return the closest package
        if available_packages:
            return available_packages[0][0]
        return None
    
    def get_actions(self, state):
        """Get actions for all robots."""
        # Update state from environment
        self.update_state(state)
        
        # Get actions for each robot
        actions = []
        for i in range(self.n_robots):
            move, pkg_action = self.get_next_action(i)
            actions.append((move, pkg_action))
        
        # Debug output
        print("\nRobot States:")
        for i in range(self.n_robots):
            robot = self.robots[i]
            print(f"Robot {i}: pos={robot[0:2]}, carrying={robot[2]}, " +
                  f"state={self.robot_states[i]}, target={self.robot_targets[i]}")
        
        print("\nPackage Assignments:")
        for i, pkg in enumerate(self.packages):
            status = "Assigned" if self.package_assigned[i] else "Available"
            print(f"Package {i} (ID:{pkg[0]}): {status}")
        
        print("\nActions:", actions)
        return actions
