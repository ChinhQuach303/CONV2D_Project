#include "core.h"

// Hàm thực hiện phép toán chập giữa ma trận đầu vào và ma trận kernel
void doConv(unsigned char input_image[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS], 
             unsigned char output_image[IMG_HEIGHT_OR_ROWS][IMG_WIDTH_OR_COLS], 
             char kernel[KERNEL_DIM * KERNEL_DIM])
{
    #pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS
    // #pragma HLS INTERFACE s_axilite port=operation bundle=CTRL_BUS
    #pragma HLS INTERFACE s_axilite port=kernel bundle=KERNEL_BUS

    // Khai báo bộ đệm dòng (line buffer) và cửa sổ (window)
    hls::LineBuffer<KERNEL_DIM, IMG_WIDTH_OR_COLS, unsigned char> lineBuff;
    hls::Window<KERNEL_DIM, KERNEL_DIM, short> window;

    int idxCol = 0;
    int idxRow = 0;
    int pixConvolved = 0;

    // Tính toán độ trễ để đi�?u chỉnh offset bộ đệm dòng
    int waitTicks = (IMG_WIDTH_OR_COLS * (KERNEL_DIM - 1) + KERNEL_DIM) / 2;
    int countWait = 0;
    
    // Biến để lưu giá trị pixel sau phép chập
    short valOutput = 0;

    // Lặp qua từng pixel của ảnh đầu vào
    for (int idxpixel = 0; idxpixel < (IMG_WIDTH_OR_COLS * IMG_HEIGHT_OR_ROWS); idxpixel++)
    {
        #pragma HLS PIPELINE
        // Lấy pixel từ ảnh đầu vào
        unsigned char pixelin = input_image[idxRow][idxCol];

        // �?ưa pixel vào bộ đệm dòng (line buffer)
        lineBuff.shift_up(idxCol);
        lineBuff.insert_top(pixelin, idxCol);

        // Khi đã đủ kích thước cửa sổ (window), thực hiện phép toán chập
        if ((idxRow >= KERNEL_DIM - 1) && (idxCol >= KERNEL_DIM - 1) &&
            idxCol < IMG_WIDTH_OR_COLS - 2 && idxRow < IMG_HEIGHT_OR_ROWS - 2)
        {
            // �?ưa dữ liệu vào cửa sổ và thực hiện phép nhân với kernel
            for (int idxWinRow = 0; idxWinRow < KERNEL_DIM; idxWinRow++)
            {
                for (int idxWinCol = 0; idxWinCol < KERNEL_DIM; idxWinCol++)
                {
                    short pix_val = (short)lineBuff.getval(idxWinRow, idxWinCol + pixConvolved);

                    // Nhân kernel với giá trị pixel
                    short val = (short)kernel[(idxWinRow * KERNEL_DIM) + idxWinCol] * pix_val;
                    window.insert(val, idxWinRow, idxWinCol);
                }
            }
        }

        // Tính toán kết quả chập
        if ((idxRow >= KERNEL_DIM - 1) && (idxCol >= KERNEL_DIM - 1) && 
            idxCol < IMG_WIDTH_OR_COLS - 2 && idxRow < IMG_HEIGHT_OR_ROWS - 2)
        {
            valOutput = sumWindow(&window);
            if (valOutput < 0)
                valOutput = 0;  // �?ảm bảo giá trị không âm
        }

        // Cập nhật chỉ số hàng và cột
        pixConvolved++;
        if (idxCol < IMG_WIDTH_OR_COLS - 1)
        {
            idxCol++;
        }
        else
        {
            idxCol = 0;
            idxRow++;
            pixConvolved = 0;
        }
        countWait++;
    }

    // Sau khi hoàn thành, đưa kết quả vào ảnh đầu ra
    for (int row = 0; row < IMG_HEIGHT_OR_ROWS; row++)
    {
        for (int col = 0; col < IMG_WIDTH_OR_COLS; col++)
        {
            output_image[row][col] = valOutput;
        }
    }
}

// Hàm tính tổng của cửa sổ (window)
short sumWindow(hls::Window<KERNEL_DIM, KERNEL_DIM, short> *window)
{
    short accumulator = 0;
    for (int idxsRow = 0; idxsRow < KERNEL_DIM; idxsRow++)
    {
        for (int idxsCol = 0; idxsCol < KERNEL_DIM; idxsCol++)
        {
            accumulator = accumulator + (short)window->getval(idxsRow, idxsCol);
        }
    }
    return accumulator;
}
