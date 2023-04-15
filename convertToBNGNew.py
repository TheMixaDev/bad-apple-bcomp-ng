import os

input_dir = 'res_converted'
output_dir = 'bng_new'
prefab_up = ["org 32","curr_frame: WORD 0","decoding:   WORD 0xFF","remain:     WORD 0","endmark:    WORD 0x7F1","exitflag:   WORD 0","prep_render:LD #0","            ST curr_frame","            JUMP render","render:     LD (curr_frame)+","            OUT 0x10","            LD curr_frame","            CMP #32","            BNE render","            LD exitflag","            BNE force_exit","            CALL cleaner","            LD remain","            BEQ render_exit","            DEC","            ST remain","render_exit:JUMP RLE","cleaner:    CLA","            ST curr_frame","cleaner_sub:CLA","            ST (curr_frame)+","            LD curr_frame","            CMP #32","            BNE cleaner_sub","            LD #0","            ST curr_frame","            RET","RLE:        LD remain","            BNE RLE_passer","            LD (decoding)+ ; инкремент значения ячейки","            LD decoding","            CMP endmark","            BEQ exit","            LD (decoding)","            SWAB","            SXTB","            ST remain","            JUMP RLE_passer","RLE_passer: LD (decoding)","            SXTB","            ST (curr_frame)+","            LD curr_frame","            CMP #32","            BEQ prep_render","            LOOP remain","            JUMP RLE_passer","            JUMP RLE","exit:       LD #1","            ST exitflag","            LD curr_frame","            BNE prep_render","force_exit: HLT","start:      JUMP RLE", "ORG 0x100"]
prefab_down = ["org 32","curr_frame: WORD 0","decoding:   WORD 0xFF","remain:     WORD 0","endmark:    WORD 0x7F1","exitflag:   WORD 0","prep_render:LD #0","            ST curr_frame","            JUMP render","render:     LD (curr_frame)+","            OUT 0x10","            LD curr_frame","            CMP #32","            BNE render","            LD exitflag","            BNE force_exit","            CALL cleaner","            LD remain","            BEQ render_exit","            DEC","            ST remain","render_exit:JUMP RLE","cleaner:    CLA","            ST curr_frame","cleaner_sub:CLA","            ST (curr_frame)+","            LD curr_frame","            CMP #32","            BNE cleaner_sub","            LD #0","            ST curr_frame","            RET","RLE:        LD remain","            BNE RLE_passer","            LD (decoding)+ ; инкремент значения ячейки","            LD decoding","            CMP endmark","            BEQ exit","            LD (decoding)","            SWAB","            SXTB","            ST remain","            JUMP RLE_passer","RLE_passer: LD (decoding)","            SXTB","            ST (curr_frame)+","            LD curr_frame","            CMP #32","            BEQ prep_render","            LOOP remain","            JUMP RLE_passer","            JUMP RLE","exit:       LD #1","            ST exitflag","            LD curr_frame","            BNE prep_render","force_exit: HLT","start:      JUMP RLE", "ORG 0x100"]
res_up = prefab_up+[]
res_down = prefab_down+[]
command_count_up = 255
command_count_down = 255
i = 1
file_index = 1
last_converted_files = 0
def save():
    global file_index, res_up, res_down, command_count_up, command_count_down, last_converted_files
    output_file_path = os.path.join(output_dir, f'Script{file_index}_up.asm')
    with open(output_file_path, 'w') as output_file:
        output_file.write('\n'.join(res_up))
    output_file_path = os.path.join(output_dir, f'Script{file_index}_down.asm')
    with open(output_file_path, 'w') as output_file:
        output_file.write('\n'.join(res_down))
    command_count_up = 255
    command_count_down = 255
    res_up = prefab_up+[]
    res_down = prefab_down+[]
    print(f"Completed file #{file_index}, covered files: {i - 1} (diff: {i - last_converted_files})")
    last_converted_files = i - 1
    file_index += 1

def to_cool_hex(binary):
    hex_num = hex(int(binary, 2))[2:].upper()
    hex_num = "0"+hex_num if len(hex_num) == 1 else hex_num
    return hex_num
def parse_hex(h):
    hex_num = h[2:].upper()
    hex_num = "0" + hex_num if len(hex_num) == 1 else hex_num
    return hex_num

while i < 3284 + 1:
    frame_data_up = []
    frame_data_down = []
    current_up = ""
    current_down = ""
    streak_up = 0
    streak_down = 0
    input_file_path = os.path.join(input_dir, f'BA{i}.txt')
    with open(input_file_path, 'r') as input_file:
        data = [list(row) for row in input_file.readlines()]
        for column_index in range(len(data[0]) - 1):
            column = [row[column_index] for row in data]
            num_up = to_cool_hex(''.join(map(str, column[:8])))
            num_down = to_cool_hex(''.join(map(str, column[8:])))
            if streak_up == 0:
                streak_up = 1
                current_up = num_up
                streak_down = 1
                current_down = num_down
            else:
                if current_up == num_up:
                    streak_up += 1
                else:
                    frame_data_up.append("WORD 0x"+parse_hex(hex(streak_up))+current_up)
                    streak_up = 1
                    current_up = num_up
                if current_down == num_down:
                    streak_down += 1
                else:
                    frame_data_down.append("WORD 0x" + parse_hex(hex(streak_down)) + current_down)
                    streak_down = 1
                    current_down = num_down
    frame_data_up.append("WORD 0x" + parse_hex(hex(streak_up)) + current_up)
    frame_data_down.append("WORD 0x" + parse_hex(hex(streak_down)) + current_down)
    if command_count_up + len(frame_data_up) > 2032 or command_count_down + len(frame_data_down) > 2032:
        save()
    command_count_up += len(frame_data_up)
    command_count_down += len(frame_data_down)
    res_up += frame_data_up
    res_down += frame_data_down
    i += 1