#include <stdio.h>
#include "conv2D.h"

void print_output(result_t output[][IMAGE_COLS - KERNEL_COLS + 1], int rows, int cols) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%4d ", output[i][j]);
        }
        printf("\n");
    }
}

/*
Thuật toán được sử dụng để cài đặt trong bài báo cáo nhằm tính khối nhân chập 2D với đầu vào là 1 ảnh và sử dụng ma trận kernel. Công thức như sau:

output[i][j] = \sum_{m=0}^{KERNEL_ROWS-1} \sum_{n=0}^{KERNEL_COLS-1} input[i+m][j+n] * kernel[m][n]

Trong đó:
- input[i+m][j+n] là giá trị pixel tại vị trí (i+m, j+n) trên ảnh đầu vào.
- kernel[m][n] là giá trị tại vị trí (m, n) trong kernel.
- output[i][j] là giá trị tại vị trí (i, j) trong ảnh đầu ra sau khi thực hiện phép nhân chập.
*/

int main() {
    // Testbench 1: Basic Test
    printf("Testbench 1: Basic Test\n");
    image_t input1[IMAGE_ROWS][IMAGE_COLS] = {
        {1, 2, 3, 4, 5},
        {6, 7, 8, 9, 10},
        {11, 12, 13, 14, 15},
        {16, 17, 18, 19, 20},
        {21, 22, 23, 24, 25}
    };

    kernel_t kernel1[KERNEL_ROWS][KERNEL_COLS] = {
        {1, 0, -1},
        {1, 0, -1},
        {1, 0, -1}
    };

    result_t output1[IMAGE_ROWS - KERNEL_ROWS + 1][IMAGE_COLS - KERNEL_COLS + 1] = {0};
    conv2d(input1, kernel1, output1);
    print_output(output1, IMAGE_ROWS - KERNEL_ROWS + 1, IMAGE_COLS - KERNEL_COLS + 1);

    // Testbench 2: Identity Kernel
    printf("\nTestbench 2: Identity Kernel\n");
    image_t input2[IMAGE_ROWS][IMAGE_COLS] = {
        {1, 2, 3, 4, 5},
        {6, 7, 8, 9, 10},
        {11, 12, 13, 14, 15},
        {16, 17, 18, 19, 20},
        {21, 22, 23, 24, 25}
    };

    kernel_t kernel2[KERNEL_ROWS][KERNEL_COLS] = {
        {0, 0, 0},
        {0, 1, 0},
        {0, 0, 0}
    };

    result_t output2[IMAGE_ROWS - KERNEL_ROWS + 1][IMAGE_COLS - KERNEL_COLS + 1] = {0};
    conv2d(input2, kernel2, output2);
    print_output(output2, IMAGE_ROWS - KERNEL_ROWS + 1, IMAGE_COLS - KERNEL_COLS + 1);

    // Testbench 3: All Ones Kernel
    printf("\nTestbench 3: All Ones Kernel\n");
    image_t input3[IMAGE_ROWS][IMAGE_COLS] = {
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1}
    };

    kernel_t kernel3[KERNEL_ROWS][KERNEL_COLS] = {
        {1, 1, 1},
        {1, 1, 1},
        {1, 1, 1}
    };

    result_t output3[IMAGE_ROWS - KERNEL_ROWS + 1][IMAGE_COLS - KERNEL_COLS + 1] = {0};
    conv2d(input3, kernel3, output3);
    print_output(output3, IMAGE_ROWS - KERNEL_ROWS + 1, IMAGE_COLS - KERNEL_COLS + 1);

    // Testbench 4: Random Values
    printf("\nTestbench 4: Random Values\n");
    image_t input4[IMAGE_ROWS][IMAGE_COLS] = {
        {3, 1, 4, 1, 5},
        {9, 2, 6, 5, 3},
        {5, 8, 9, 7, 9},
        {3, 2, 3, 8, 4},
        {6, 2, 7, 1, 8}
    };

    kernel_t kernel4[KERNEL_ROWS][KERNEL_COLS] = {
        {2, -1, 0},
        {-1, 2, -1},
        {0, -1, 2}
    };

    result_t output4[IMAGE_ROWS - KERNEL_ROWS + 1][IMAGE_COLS - KERNEL_COLS + 1] = {0};
    conv2d(input4, kernel4, output4);
    print_output(output4, IMAGE_ROWS - KERNEL_ROWS + 1, IMAGE_COLS - KERNEL_COLS + 1);

    return 0;
}
