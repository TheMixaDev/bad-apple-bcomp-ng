import os

input_dir = 'res_converted'
output_dir = 'bng'
res_up = ["ORG 0x000"]
res_down = ["ORG 0x000"]
command_count = 0
i = 1
file_index = 1

def to_cool_hex(binary):
    hex_num = hex(int(binary, 2))[2:].upper()
    hex_num = "0"+hex_num if len(hex_num) == 1 else hex_num
    return '0x'+hex_num

def save():
    global file_index, res_up, res_down, command_count
    res_up.append("HLT")
    res_down.append("HLT")
    output_file_path = os.path.join(output_dir, f'Script{file_index}_up.asm')
    with open(output_file_path, 'w') as output_file:
        output_file.write('\n'.join(res_up))
    output_file_path = os.path.join(output_dir, f'Script{file_index}_down.asm')
    with open(output_file_path, 'w') as output_file:
        output_file.write('\n'.join(res_down))
    command_count = 0
    res_up = ["ORG 0x000"]
    res_down = ["ORG 0x000"]
    print(f"Completed file #{file_index}, covered files: {i - 1}")
    file_index += 1


while i < 3284 + 1:
    if command_count + 62 < 2047:
        input_file_path = os.path.join(input_dir, f'BA{i}.txt')
        with open(input_file_path, 'r') as input_file:
            data = [list(row) for row in input_file.readlines()]
            for column_index in range(len(data[0])-1):
                column = [row[column_index] for row in data]
                num_up = to_cool_hex(''.join(map(str, column[:8])))
                num_down = to_cool_hex(''.join(map(str, column[8:])))
                res_up.append("LD #" + num_up)
                res_up.append("OUT 0x10")
                res_down.append("LD #" + num_down)
                res_down.append("OUT 0x10")
        command_count += 62
        i += 1
    else:
        save()
save()
print("Done")
