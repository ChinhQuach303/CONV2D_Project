#ifndef CORE_H
#define CORE_H
#include "hls_video.h"

// �?ịnh nghĩa kích thước kernel và kích thước ảnh
#define KERNEL_DIM 3  // Kích thước kernel (ví dụ: 3x3)
#define IMG_WIDTH_OR_COLS 128  // Số cột của ảnh
#define IMG_HEIGHT_OR_ROWS 128  // Số hàng của ảnh

// Khai báo các cấu trúc cần thiết
typedef struct {
    unsigned char data;
    unsigned char keep;
    unsigned char strb;
    unsigned char user;
    unsigned char last;
    unsigned char id;
    unsigned char dest;
} uint8_sidechannel;

typedef struct {
    short data;
    unsigned char keep;
    unsigned char strb;
    unsigned char user;
    unsigned char last;
    unsigned char id;
    unsigned char dest;
} int8_sidechannel;

// Khai báo hàm doConv
void doConv(unsigned char input_image[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS], 
             unsigned char output_image[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS], 
             char kernel[KERNEL_DIM * KERNEL_DIM]);

// Khai báo hàm sumWindow
short sumWindow(hls::Window<KERNEL_DIM, KERNEL_DIM, short> *window);

#endif // CORE_H
