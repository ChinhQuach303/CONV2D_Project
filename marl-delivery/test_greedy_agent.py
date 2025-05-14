import numpy as np
from greedyagent import GreedyAgents

def create_test_environment():
    """Create a test environment with a simple map, robots, and packages."""
    
    # Create a 10x10 grid map (0 = free space, 1 = obstacle)
    # Add some obstacles to make it interesting
    map_grid = np.zeros((10, 10), dtype=int)
    map_grid[2, 3:7] = 1  # Horizontal wall
    map_grid[5, 2:8] = 1  # Another wall
    map_grid[7, 4] = 1    # Single obstacle
    
    # Create robots at starting positions (using 1-indexed as in the environment)
    # Format: [row, col, carrying_package_id]
    robots = [
        [2, 2, 0],  # Robot 0 at (2,2), not carrying anything
        [8, 8, 0]   # Robot 1 at (8,8), not carrying anything
    ]
    
    # Create packages 
    # Format: [id, start_row, start_col, target_row, target_col, start_time, deadline]
    packages = [
        [1, 3, 3, 7, 7, 0, 50],  # Package 1: from (3,3) to (7,7)
        [2, 7, 2, 2, 8, 0, 50],  # Package 2: from (7,2) to (2,8)
        [3, 9, 9, 1, 1, 0, 50]   # Package 3: from (9,9) to (1,1)
    ]
    
    # Create the full state dictionary
    state = {
        'map': map_grid.tolist(),
        'robots': robots,
        'packages': packages,
        'time_step': 0
    }
    
    return state

def print_map_with_agents(state, agents):
    """Visualize the current state on the map."""
    map_grid = np.array(state['map'])
    height, width = map_grid.shape
    
    # Create a visualization grid
    vis_grid = np.zeros((height, width), dtype=object)
    for i in range(height):
        for j in range(width):
            if map_grid[i, j] == 1:
                vis_grid[i, j] = '█'  # Wall
            else:
                vis_grid[i, j] = '·'  # Empty space
    
    # Add package pickup locations (P)
    for pkg in state['packages']:
        r, c = pkg[1]-1, pkg[2]-1  # Convert to 0-indexed
        vis_grid[r, c] = f'P{pkg[0]}'
    
    # Add package delivery locations (D)
    for pkg in state['packages']:
        r, c = pkg[3]-1, pkg[4]-1  # Convert to 0-indexed
        vis_grid[r, c] = f'D{pkg[0]}'
    
    # Add robots (R0, R1, etc.)
    for i, robot in enumerate(state['robots']):
        r, c = robot[0]-1, robot[1]-1  # Convert to 0-indexed
        carrying = robot[2]
        if carrying > 0:
            vis_grid[r, c] = f'R{i}({carrying})'
        else:
            vis_grid[r, c] = f'R{i}'
    
    # Print the grid
    print("\nCurrent Map:")
    print("  " + "".join([f" {j} " for j in range(width)]))
    for i in range(height):
        row = f"{i} "
        for j in range(width):
            cell = str(vis_grid[i, j])
            row += f"{cell:^4}"
        print(row)
    print()

def update_state_with_actions(state, actions):
    """
    Update the state based on the actions taken by robots.
    This is a simplified version of the environment's step function.
    """
    new_state = {
        'map': state['map'],
        'robots': [],
        'packages': state['packages'].copy(),
        'time_step': state.get('time_step', 0) + 1
    }
    
    # Calculate new positions for all robots first (without actually moving them)
    new_positions = []
    map_grid = state['map']
    height, width = len(map_grid), len(map_grid[0])
    
    for i, (robot, (move, _)) in enumerate(zip(state['robots'], actions)):
        r, c, carrying = robot
        
        # Process movement - note that map is 0-indexed but robot coords are 1-indexed
        new_r, new_c = r, c
        
        if move == 'U' and r > 1 and map_grid[r-2][c-1] == 0:
            new_r = r - 1
        elif move == 'D' and r < height and map_grid[r][c-1] == 0:
            new_r = r + 1
        elif move == 'L' and c > 1 and map_grid[r-1][c-2] == 0:
            new_c = c - 1
        elif move == 'R' and c < width and map_grid[r-1][c] == 0:
            new_c = c + 1
        
        new_positions.append((new_r, new_c, carrying, i))  # Include robot index
    
    # Resolve conflicts (two robots trying to move to the same position)
    # Sort by robot index to give priority to lower-indexed robots
    new_positions.sort(key=lambda x: x[3])
    occupied = {}
    
    for new_r, new_c, carrying, idx in new_positions:
        pos_key = (new_r, new_c)
        
        # If position already occupied by a lower-index robot, stay in place
        if pos_key in occupied:
            r, c, _ = state['robots'][idx]
            new_state['robots'].append([r, c, carrying])
            print(f"Conflict: Robot {idx} cannot move to {pos_key} (occupied by Robot {occupied[pos_key]})")
        else:
            occupied[pos_key] = idx
            new_state['robots'].append([new_r, new_c, carrying])
    
    # Now process package actions after all movements
    for i, (robot, (_, pkg_action)) in enumerate(zip(new_state['robots'], actions)):
        r, c, carrying = robot
        
        # Process package action
        if pkg_action == '1' and carrying == 0:  # Pickup
            # Check if robot is at a package location
            for pkg_idx, pkg in enumerate(new_state['packages']):
                pkg_id, pkg_r, pkg_c = pkg[0], pkg[1], pkg[2]
                if r == pkg_r and c == pkg_c:
                    # Pick up the lowest ID package at this position
                    if carrying == 0:  # Still not carrying anything
                        carrying = pkg_id
                        print(f"Robot {i} picked up package {pkg_id}")
                        break
        
        elif pkg_action == '2' and carrying > 0:  # Dropoff
            # Check if robot is at the correct package destination
            for pkg_idx, pkg in enumerate(new_state['packages']):
                pkg_id, tgt_r, tgt_c = pkg[0], pkg[3], pkg[4]
                if pkg_id == carrying and r == tgt_r and c == tgt_c:
                    # Successfully delivered
                    print(f"Robot {i} delivered package {carrying}")
                    carrying = 0
                    break
        
        # Update robot state with new carrying status
        new_state['robots'][i][2] = carrying
    
    return new_state

def run_test(num_steps=30, debug=True):
    """Run the test for a number of steps."""
    # Create the initial environment
    state = create_test_environment()
    
    # Initialize the greedy agents
    agents = GreedyAgents()
    
    print("=== Testing GreedyAgents Implementation ===")
    print(f"Initial state with {len(state['robots'])} robots and {len(state['packages'])} packages")
    
    # Print package info
    print("\nPackage Information:")
    for pkg in state['packages']:
        print(f"Package {pkg[0]}: From ({pkg[1]},{pkg[2]}) to ({pkg[3]},{pkg[4]})")
    
    # Track deliveries
    deliveries = []
    
    # Run for specified number of steps
    for step in range(num_steps):
        print(f"\n==== Step {step} ====")
        
        # Visualize current state
        print_map_with_agents(state, agents)
        
        # Get actions from agents
        actions = agents.get_actions(state)
        
        print(f"Actions: {actions}")
        
        # Update state based on actions
        state = update_state_with_actions(state, actions)
        
        # Check for deliveries
        for robot in state['robots']:
            if robot[2] == 0:  # Not carrying a package
                for pkg in deliveries:
                    if pkg[0] == robot[0] and pkg[1] == robot[1]:
                        deliveries.remove(pkg)
            else:
                pkg_id = robot[2]
                for pkg in state['packages']:
                    if pkg[0] == pkg_id:
                        target_r, target_c = pkg[3], pkg[4]
                        if robot[0] == target_r and robot[1] == target_c:
                            delivery = (robot[0], robot[1])
                            if delivery not in deliveries:
                                deliveries.append(delivery)
        
        # Check if all packages delivered
        packages_in_transit = sum(1 for robot in state['robots'] if robot[2] > 0)
        if len(deliveries) == len(state['packages']) and packages_in_transit == 0:
            print("\nAll packages have been delivered!")
            break
    
    print("\n=== Test Complete ===")
    print_map_with_agents(state, agents)
    
    # Print final status
    print("\nFinal Robot Status:")
    for i, robot in enumerate(state['robots']):
        carrying = "None" if robot[2] == 0 else f"Package {robot[2]}"
        print(f"Robot {i}: Position ({robot[0]},{robot[1]}), Carrying: {carrying}")
    
    # Count delivered packages
    delivered = 0
    for pkg in state['packages']:
        pkg_id = pkg[0]
        for robot in state['robots']:
            if robot[2] == pkg_id:  # Package is being carried
                delivered -= 1
                break
        delivered += 1
    
    print(f"\nDelivered {delivered} out of {len(state['packages'])} packages in {step+1} steps")

if __name__ == "__main__":
    run_test(30)  # Run test for 30 steps