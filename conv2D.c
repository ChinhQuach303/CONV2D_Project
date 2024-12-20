#include "conv2D.h"

void conv2d(image_t input[IMAGE_ROWS][IMAGE_COLS],
            kernel_t kernel[KERNEL_ROWS][KERNEL_COLS],
            result_t output[IMAGE_ROWS - KERNEL_ROWS + 1][IMAGE_COLS - KERNEL_COLS + 1]) {

    #pragma HLS ARRAY_PARTITION variable=input complete dim=2
	#pragma HLS ARRAY_PARTITION variable=kernel complete dim=2
    #pragma HLS ARRAY_PARTITION variable=output complete dim=2

    for (int x = 0; x < IMAGE_ROWS - KERNEL_ROWS + 1; x++) {

        #pragma HLS PIPELINE II=1

        for (int y = 0; y < IMAGE_COLS - KERNEL_COLS + 1; y++) {
            int sum = 0;

            #pragma HLS UNROLL factor=4

            for (int i = 0; i < KERNEL_ROWS; i++) {
                for (int j = 0; j < KERNEL_COLS; j++) {
                    sum += input[x + i][y + j] * kernel[i][j];
                }
            }

            output[x][y] = sum;
        }
    }
}
