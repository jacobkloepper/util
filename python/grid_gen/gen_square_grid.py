from PIL import Image
import numpy as np

# Create an image of configurable resolution of random (or configurable) colours in a square grid of configurable size.

def main():
    NUM_COLS = 8
    NUM_ROWS = 8
    GRID_SIZE = 8

    pixels = []

    # generate pixel array
    checker_col = []
    for i in range(GRID_SIZE**2):
        # For random colours, use this (comment rest of this loop)
        #checker_col.append(list(np.random.choice(range(256), size=3))) 

        # If even-sized grid, need to offset every other row. even_offset = 0 if odd row, else 1. 
        # (rows meaning grid rows, not pixel rows)
        if (GRID_SIZE % 2 == 0):
            even_offset = (i//GRID_SIZE)%2
        else:
            even_offset = 0

        # alternate black-white checkers
        if ( (i + even_offset) % 2):
            checker_col.append([0,0,0])
        else:
            checker_col.append([255,255,255])
    
    grid_rows = NUM_ROWS//GRID_SIZE
    grid_cols = NUM_COLS//GRID_SIZE

    for row_num in range(NUM_ROWS):
        pixels.append([])
        for cell_num in range(NUM_COLS):
            grid_row_num = row_num//grid_rows
            grid_cell_num = cell_num//grid_cols
            grid_cell = grid_row_num*GRID_SIZE + grid_cell_num

            pixels[row_num].append(checker_col[grid_cell])

            cell_num += 1

    arr = np.array(pixels, dtype=np.uint8)

    img = Image.fromarray(arr)
    img.save("8x8_checker_pat.png")

if __name__ == "__main__":
    main()