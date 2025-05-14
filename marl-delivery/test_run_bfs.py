import numpy as np
from bfs_utils import run_bfs

def test_bfs():
    """Test the BFS algorithm with a simple map."""
    
    # Create a simple 10x10 grid (0 = empty, 1 = obstacle)
    map_grid = np.zeros((10, 10), dtype=int)
    
    # Add some obstacles
    map_grid[2, 3:7] = 1  # Horizontal wall
    map_grid[5, 2:8] = 1  # Another wall
    map_grid[7, 4] = 1    # Single obstacle
    
    # Print the map
    print("Test Map:")
    for row in map_grid:
        print(''.join(['█' if cell == 1 else '·' for cell in row]))
    print()
    
    # Test cases - start point, goal point
    test_cases = [
        ((1, 1), (8, 8)),  # Diagonal move across map
        ((2, 2), (3, 7)),  # Around horizontal wall
        ((4, 4), (6, 6)),  # Around vertical wall
        ((9, 1), (9, 9)),  # Straight line
        ((0, 0), (7, 4)),  # To an obstacle (should find path around)
    ]
    
    # Run BFS for each test case
    for i, (start, goal) in enumerate(test_cases):
        print(f"Test Case {i+1}: From {start} to {goal}")
        
        # Run BFS
        action, distance = run_bfs(map_grid, start, goal)
        
        print(f"Next action: {action}")
        print(f"Total distance: {distance}")
        
        # Visualize the path
        path_map = np.array(map_grid, copy=True)
        
        # Mark start and goal
        s_r, s_c = start
        g_r, g_c = goal
        
        # Use BFS to construct the full path
        current = start
        path = [current]
        
        # Direction mapping
        directions = {'S': (0, 0), 'U': (-1, 0), 'D': (1, 0), 'L': (0, -1), 'R': (0, 1)}
        
        # Trace 10 steps of the path (or until reaching goal)
        for _ in range(10):
            if current == goal:
                break
                
            # Get next action from current position
            next_action, _ = run_bfs(map_grid, current, goal)
            dr, dc = directions[next_action]
            
            # Move to next position
            current = (current[0] + dr, current[1] + dc)
            path.append(current)
        
        # Visualize the path
        path_vis = np.zeros((10, 10), dtype=object)
        for r in range(10):
            for c in range(10):
                if map_grid[r, c] == 1:
                    path_vis[r, c] = '█'  # Wall
                else:
                    path_vis[r, c] = '·'  # Empty
        
        # Mark start and goal
        path_vis[s_r, s_c] = 'S'
        path_vis[g_r, g_c] = 'G'
        
        # Mark path
        for step, (r, c) in enumerate(path[1:-1], 1):
            path_vis[r, c] = str(step % 10)  # Use step number (modulo 10 to keep single digit)
        
        # Print the path map
        print("\nPath visualization:")
        for row in path_vis:
            print(' '.join([str(cell) for cell in row]))
        print("\n" + "-"*40)

if __name__ == "__main__":
    test_bfs() 