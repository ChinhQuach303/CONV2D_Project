import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from collections import namedtuple, deque
import random
from dqn_agent import DQN, ReplayMemory, Transition

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
    
    t = 0
    actions = ['U', 'D', 'L', 'R']
    current = start
    for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
        next_pos = (current[0] + dx, current[1] + dy)
        if next_pos in d:
            if d[next_pos] == d[current] - 1:
                return actions[t], d[next_pos]
        t += 1
    return 'S', d[start]

class BFSDQNAgent:
    def __init__(self, state_size, action_size, gamma=0.99, epsilon=1.0, epsilon_min=0.01, 
                 epsilon_decay=500, learning_rate=1e-3, batch_size=64, memory_capacity=10000, 
                 device=None):
        self.state_size = state_size
        self.action_size = action_size
        self.gamma = gamma
        self.epsilon = epsilon
        self.epsilon_min = epsilon_min
        self.epsilon_decay = epsilon_decay
        self.learning_rate = learning_rate
        self.batch_size = batch_size
        self.device = device or torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.steps_done = 0

        # DQN networks
        self.policy_net = DQN(state_size, action_size).to(self.device)
        self.target_net = DQN(state_size, action_size).to(self.device)
        self.target_net.load_state_dict(self.policy_net.state_dict())
        self.target_net.eval()

        self.optimizer = optim.Adam(self.policy_net.parameters(), lr=self.learning_rate)
        self.memory = ReplayMemory(memory_capacity)

        # BFS related variables
        self.robots_target = ['free'] * 5  # Assuming max 5 robots
        self.packages_free = []
        self.map = None
        self.robots = []

    def get_state_representation(self, state):
        # Flatten the state into a 1D array
        grid_flat = state['grid'].flatten()
        robots_flat = state['robots'].flatten()
        packages_flat = state['packages'].flatten()
        
        # Pad packages array if needed
        if len(packages_flat) < self.n_packages * 7:
            packages_flat = np.pad(packages_flat, (0, self.n_packages * 7 - len(packages_flat)))
        
        return np.concatenate([grid_flat, robots_flat, packages_flat])

    def select_action(self, state):
        self.steps_done += 1
        eps_threshold = self.epsilon_min + (self.epsilon - self.epsilon_min) * \
                       np.exp(-1. * self.steps_done / self.epsilon_decay)

        if random.random() < eps_threshold:
            # Random action
            return random.randrange(self.action_size)
        else:
            # DQN action
            state_tensor = torch.FloatTensor(self.get_state_representation(state)).unsqueeze(0).to(self.device)
            with torch.no_grad():
                return self.policy_net(state_tensor).argmax(dim=1).item()

    def get_bfs_action(self, robot_id, target_package_id, phase='start'):
        if phase == 'start':
            distance = abs(self.packages[target_package_id][1]-self.robots[robot_id][0]) + \
                      abs(self.packages[target_package_id][2]-self.robots[robot_id][1])
        else:
            distance = abs(self.packages[target_package_id][3]-self.robots[robot_id][0]) + \
                      abs(self.packages[target_package_id][4]-self.robots[robot_id][1])

        pkg_act = 0
        move = 'S'
        
        if distance >= 1:
            pkg = self.packages[target_package_id]
            target_p = (pkg[1], pkg[2]) if phase == 'start' else (pkg[3], pkg[4])
            move, distance = run_bfs(self.map, (self.robots[robot_id][0], self.robots[robot_id][1]), target_p)

            if distance == 0:
                pkg_act = 1 if phase == 'start' else 2
        else:
            move = 'S'
            pkg_act = 1 if phase == 'start' else 2

        return move, str(pkg_act)

    def get_actions(self, state):
        # Update internal state
        self.map = state['grid']
        self.robots = [(robot[0], robot[1], robot[2]) for robot in state['robots']]
        self.packages = [(p[0], p[1], p[2], p[3], p[4], p[5], p[6]) for p in state['packages']]
        self.packages_free = [True] * len(self.packages)

        actions = []
        for i in range(len(self.robots)):
            if self.robots_target[i] != 'free':
                # Robot is assigned to a package
                closest_package_id = self.robots_target[i]
                if self.robots[i][2] != 0:
                    # Robot is carrying a package
                    move, action = self.get_bfs_action(i, closest_package_id-1, 'target')
                else:
                    # Robot is moving to pick up package
                    move, action = self.get_bfs_action(i, closest_package_id-1)
                actions.append((move, action))
            else:
                # Find closest package using DQN
                state_representation = self.get_state_representation(state)
                action = self.select_action(state)
                
                # Convert DQN action to movement and package action
                move_action = action // 3  # 0-4 for movement
                pkg_action = action % 3   # 0-2 for package action
                
                move = ['S', 'L', 'R', 'U', 'D'][move_action]
                actions.append((move, str(pkg_action)))

                # Update robot target if picking up a package
                if pkg_action == 1 and self.robots[i][2] == 0:
                    for j, pkg in enumerate(self.packages):
                        if pkg[1] == self.robots[i][0] and pkg[2] == self.robots[i][1]:
                            self.robots_target[i] = pkg[0]
                            self.packages_free[j] = False
                            break

        return actions

    def optimize_model(self):
        if len(self.memory) < self.batch_size:
            return

        transitions = self.memory.sample(self.batch_size)
        batch = Transition(*zip(*transitions))

        state_batch = torch.FloatTensor(batch.state).to(self.device)
        action_batch = torch.LongTensor(batch.action).unsqueeze(1).to(self.device)
        reward_batch = torch.FloatTensor(batch.reward).unsqueeze(1).to(self.device)
        next_state_batch = torch.FloatTensor(batch.next_state).to(self.device)
        done_batch = torch.FloatTensor(batch.done).unsqueeze(1).to(self.device)

        current_q_values = self.policy_net(state_batch).gather(1, action_batch)
        next_actions = self.policy_net(next_state_batch).max(1)[1].unsqueeze(1)
        next_q_values = self.target_net(next_state_batch).gather(1, next_actions)
        expected_q_values = reward_batch + (1 - done_batch) * self.gamma * next_q_values

        loss = nn.MSELoss()(current_q_values, expected_q_values.detach())

        self.optimizer.zero_grad()
        loss.backward()
        self.optimizer.step()

    def update_target_network(self):
        self.target_net.load_state_dict(self.policy_net.state_dict()) 