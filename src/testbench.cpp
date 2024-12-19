#include "core.h"
#include <iostream>
#include <cstdlib>  // Để sử dụng hàm abs() cho so sánh sự khác biệt giữa các giá trị

// Khai báo ma trận đầu vào và đầu ra
unsigned char input_image[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS];
unsigned char output_image_sw[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS]; // Đầu ra từ phần mềm
unsigned char output_image_hw[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS]; // Đầu ra từ phần cứng

// Kernel mẫu
char kernel[KERNEL_DIM * KERNEL_DIM] = {1, 0, -1,
                                        1, 0, -1,
                                        1, 0, -1};

// Hàm in ma trận đầu ra để kiểm tra
void printImage(unsigned char image[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS])
{
    for (int i = 0; i < IMG_HEIGHT_OR_ROWS; i++)
    {
        for (int j = 0; j < IMG_WIDTH_OR_COLS; j++)
        {
            std::cout << (int)image[i][j] << " ";
        }
        std::cout << std::endl;
    }
}

// Hàm so sánh kết quả phần mềm với phần cứng
bool compareResults(unsigned char output_sw[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS], 
                    unsigned char output_hw[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS])
{
    bool match = true;

    // So sánh từng pixel
    for (int i = 0; i < IMG_HEIGHT_OR_ROWS; i++)
    {
        for (int j = 0; j < IMG_WIDTH_OR_COLS; j++)
        {
            // Nếu sự khác biệt tuyệt đối giữa hai giá trị lớn hơn một ngưỡng, coi là không khớp
            if (abs(output_sw[i][j] - output_hw[i][j]) > 1)
            {
                std::cout << "Mismatch at (" << i << ", " << j << "): "
                          << (int)output_sw[i][j] << " (SW) vs "
                          << (int)output_hw[i][j] << " (HW)" << std::endl;
                match = false;
            }
        }
    }

    return match;
}

int main()
{
    // Khởi tạo ma trận đầu vào với giá trị giả định (có thể thay đổi theo yêu cầu)
    for (int i = 0; i < IMG_HEIGHT_OR_ROWS; i++)
    {
        for (int j = 0; j < IMG_WIDTH_OR_COLS; j++)
        {
            input_image[i][j] = (i + j) % 256;  // Giá trị pixel mẫu
        }
    }

    // Gọi hàm thực hiện phép toán chập (phần mềm)
    doConv(input_image, output_image_sw, kernel);


    // Gọi hàm thực hiện phép toán chập (phần cứng mô phỏng, có thể dùng HLS để mô phỏng)
    doConv(input_image, output_image_hw, kernel);

    // So sánh kết quả từ phần mềm và phần cứng
    bool match = compareResults(output_image_sw, output_image_hw);

    if (match)
    {
        std::cout << "Test passed: Results match!" << std::endl;
    }
    else
    {
        std::cout << "Test failed: Results do not match!" << std::endl;
    }

    return 0;
}
