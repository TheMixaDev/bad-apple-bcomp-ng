# fixed chatgpt code btw
import os
input_dir = 'res_orig'
output_dir = 'res_converted'
if not os.path.exists(output_dir):
    os.makedirs(output_dir)
for i in range(1, 6569, 2):
    input_file_path_1 = os.path.join(input_dir, f'BA{i}.txt')
    input_file_path_2 = os.path.join(input_dir, f'BA{i + 1}.txt')
    with open(input_file_path_1, 'r') as input_file_1, open(input_file_path_2, 'r') as input_file_2:
        contents_1 = [list(row) for row in input_file_1.readlines()]
        contents_2 = [list(row) for row in input_file_2.readlines()]
    symbols = []
    for row in range(0, 31, 2):
        col = 0
        step = 2
        subsymbols = []
        while col < 77:
            try:
                block_1 = [contents_1[row + i][col:col + step] for i in range(2)]
                block_2 = [contents_2[row + i][col:col + step] for i in range(2)]
            except:
                block_1 = [contents_1[row][col:col + step]]
                block_2 = [contents_2[row][col:col + step]]
            combined_block = [char for sublist in block_1 + block_2 for char in sublist]
            num_symbols = sum(1 for char in combined_block if char != ' ')
            num_whitespace = sum(1 for char in combined_block if char == ' ')
            symbol = 0 if num_symbols > num_whitespace else 1
            subsymbols.append(str(symbol))
            col += step
            step = 3 if step == 2 else 2
        symbols.append(subsymbols)
    output_file_path = os.path.join(output_dir, f'BA{i // 2 + 1}.txt')
    with open(output_file_path, 'w') as output_file:
        for row in symbols:
            output_file.write(''.join(row) + '\n')