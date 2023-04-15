org 32
curr_frame: WORD 0
decoding:   WORD 0xFF
remain:     WORD 0
endmark:    WORD 0x7F1
exitflag:   WORD 0
prep_render:LD #0
            ST curr_frame
            JUMP render
render:     LD (curr_frame)+
            OUT 0x10
            LD curr_frame
            CMP #32
            BNE render
            LD exitflag
            BNE force_exit
            CALL cleaner
            LD remain
            BEQ render_exit
            DEC
            ST remain
render_exit:JUMP RLE
cleaner:    CLA
            ST curr_frame
cleaner_sub:CLA
            ST (curr_frame)+
            LD curr_frame
            CMP #32
            BNE cleaner_sub
            LD #0
            ST curr_frame
            RET
RLE:        LD remain
            BNE RLE_passer
            LD (decoding)+ ; ��������� �������� ������
            LD decoding
            CMP endmark
            BEQ exit
            LD (decoding)
            SWAB
            SXTB
            ST remain
            JUMP RLE_passer
RLE_passer: LD (decoding)
            SXTB
            ST (curr_frame)+
            LD curr_frame
            CMP #32
            BEQ prep_render
            LOOP remain
            JUMP RLE_passer
            JUMP RLE
exit:       LD #1
            ST exitflag
            LD curr_frame
            BNE prep_render
force_exit: HLT
start:      JUMP RLE
ORG 0x100
WORD 0x05FF
WORD 0x01FB
WORD 0x01F1
WORD 0x04C0
WORD 0x0180
WORD 0x0100
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01FC
WORD 0x0DFF
WORD 0x04FF
WORD 0x02FB
WORD 0x02C0
WORD 0x0480
WORD 0x0100
WORD 0x0180
WORD 0x02C0
WORD 0x01F8
WORD 0x0EFF
WORD 0x04FF
WORD 0x01F3
WORD 0x01C2
WORD 0x0580
WORD 0x0200
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x017F
WORD 0x0EFF
WORD 0x01FF
WORD 0x01DF
WORD 0x01FF
WORD 0x01F7
WORD 0x01F2
WORD 0x01C0
WORD 0x0580
WORD 0x0200
WORD 0x0180
WORD 0x01C0
WORD 0x01FB
WORD 0x0CFF
WORD 0x01FB
WORD 0x02FF
WORD 0x03FF
WORD 0x01F3
WORD 0x01F0
WORD 0x02C0
WORD 0x0480
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x10FF
WORD 0x03FF
WORD 0x01FA
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x02C0
WORD 0x01E1
WORD 0x10FF
WORD 0x02FF
WORD 0x01FB
WORD 0x01F8
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F9
WORD 0x10FF
WORD 0x02FF
WORD 0x01FB
WORD 0x01F0
WORD 0x05C0
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x01FD
WORD 0x03FF
WORD 0x01BF
WORD 0x0CFF
WORD 0x01FF
WORD 0x02FB
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x02FF
WORD 0x01EF
WORD 0x0DFF
WORD 0x01FD
WORD 0x01FF
WORD 0x01F3
WORD 0x01E0
WORD 0x01C0
WORD 0x0680
WORD 0x02C0
WORD 0x01E0
WORD 0x11FF
WORD 0x01FD
WORD 0x01F3
WORD 0x01F2
WORD 0x01C0
WORD 0x0780
WORD 0x02C0
WORD 0x01E0
WORD 0x02FF
WORD 0x01F7
WORD 0x0FFF
WORD 0x01F3
WORD 0x01E0
WORD 0x01C0
WORD 0x0580
WORD 0x0100
WORD 0x02C0
WORD 0x01E0
WORD 0x02FF
WORD 0x01FD
WORD 0x02F7
WORD 0x0EFF
WORD 0x01FB
WORD 0x01E0
WORD 0x04C0
WORD 0x0380
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x04FF
WORD 0x01F5
WORD 0x09FF
WORD 0x017F
WORD 0x04FF
WORD 0x01FB
WORD 0x01F0
WORD 0x04C0
WORD 0x0180
WORD 0x0100
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x05FF
WORD 0x01FB
WORD 0x01FD
WORD 0x0CFF
WORD 0x01FB
WORD 0x01FA
WORD 0x01E0
WORD 0x01C0
WORD 0x0180
WORD 0x01C0
WORD 0x0180
WORD 0x0100
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x04FF
WORD 0x02FB
WORD 0x01FF
WORD 0x01FD
WORD 0x0AFF
WORD 0x01FF
WORD 0x01FB
WORD 0x01F2
WORD 0x02C0
WORD 0x0280
WORD 0x0200
WORD 0x0180
WORD 0x03C0
WORD 0x01FA
WORD 0x04FF
WORD 0x01FB
WORD 0x03FF
WORD 0x01FD
WORD 0x08FF
WORD 0x01FF
WORD 0x01FB
WORD 0x01F3
WORD 0x01E0
WORD 0x01C0
WORD 0x0380
WORD 0x0100
WORD 0x0180
WORD 0x03C0
WORD 0x01E0
WORD 0x11FF
WORD 0x01FF
WORD 0x02FB
WORD 0x01E1
WORD 0x03C0
WORD 0x0180
WORD 0x0100
WORD 0x0180
WORD 0x03C0
WORD 0x01E0
WORD 0x01FE
WORD 0x10FF
WORD 0x02FF
WORD 0x01FB
WORD 0x01F9
WORD 0x01E0
WORD 0x02C0
WORD 0x0380
WORD 0x03C0
WORD 0x01E0
WORD 0x01FC
WORD 0x05FF
WORD 0x01FD
WORD 0x0AFF
WORD 0x02FF
WORD 0x01FD
WORD 0x01F9
WORD 0x01F0
WORD 0x03C0
WORD 0x0280
WORD 0x03C0
WORD 0x01E0
WORD 0x01F0
WORD 0x06FF
WORD 0x01FD
WORD 0x09FF
WORD 0x03FF
WORD 0x02F9
WORD 0x03C0
WORD 0x0280
WORD 0x04C0
WORD 0x01E0
WORD 0x06FF
WORD 0x01FD
WORD 0x09FF
WORD 0x03FF
WORD 0x02FB
WORD 0x01E0
WORD 0x03C0
WORD 0x0280
WORD 0x03C0
WORD 0x01E0
WORD 0x01F8
WORD 0x05FF
WORD 0x01FD
WORD 0x09FF
WORD 0x03FF
WORD 0x02FB
WORD 0x01E0
WORD 0x01C0
WORD 0x0380
WORD 0x0100
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x06FF
WORD 0x01FD
WORD 0x08FF
WORD 0x04FF
WORD 0x01FB
WORD 0x01F3
WORD 0x01C0
WORD 0x0480
WORD 0x0100
WORD 0x0380
WORD 0x01C0
WORD 0x01E0
WORD 0x0EFF
WORD 0x04FF
WORD 0x02FB
WORD 0x01E0
WORD 0x01C0
WORD 0x0380
WORD 0x0200
WORD 0x0280
WORD 0x02C0
WORD 0x01FA
WORD 0x03FF
WORD 0x01FB
WORD 0x09FF
WORD 0x05FF
WORD 0x02F9
WORD 0x01E0
WORD 0x03C0
WORD 0x0380
WORD 0x02C0
WORD 0x01E0
WORD 0x01F0
WORD 0x03FF
WORD 0x01FB
WORD 0x09FF
WORD 0x05FF
WORD 0x01FD
WORD 0x01E1
WORD 0x04C0
WORD 0x0380
WORD 0x02C0
WORD 0x01E0
WORD 0x01FE
WORD 0x02FF
WORD 0x017F
WORD 0x0AFF
WORD 0x04FF
WORD 0x01FD
WORD 0x01E1
WORD 0x05C0
WORD 0x0180
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01FA
WORD 0x0EFF
WORD 0x04FF
WORD 0x01E1
WORD 0x02C0
WORD 0x0480
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01FA
WORD 0x04FF
WORD 0x01FD
WORD 0x0AFF
WORD 0x03FF
WORD 0x01F9
WORD 0x02C0
WORD 0x0580
WORD 0x0100
WORD 0x02C0
WORD 0x01F0
WORD 0x09FF
WORD 0x01F7
WORD 0x05FF
WORD 0x01F7
WORD 0x02FF
WORD 0x01FD
WORD 0x01E0
WORD 0x03C0
WORD 0x0180
WORD 0x01C0
WORD 0x0180
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F3
WORD 0x10FF
WORD 0x03FF
WORD 0x02E0
WORD 0x04C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01FB
WORD 0x06FF
WORD 0x01FE
WORD 0x09FF
WORD 0x03FF
WORD 0x02E0
WORD 0x04C0
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FB
WORD 0x07FF
WORD 0x01FE
WORD 0x08FF
WORD 0x02FF
WORD 0x01F3
WORD 0x01E0
WORD 0x04C0
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x01F9
WORD 0x08FF
WORD 0x01FE
WORD 0x08FF
WORD 0x02FF
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x02C0
WORD 0x01F1
WORD 0x01FB
WORD 0x08FF
WORD 0x01FE
WORD 0x01BF
WORD 0x07FF
WORD 0x01FF
WORD 0x01E7
WORD 0x03C0
WORD 0x0180
WORD 0x01C0
WORD 0x0380
WORD 0x01C0
WORD 0x01E1
WORD 0x01F9
WORD 0x08FF
WORD 0x03FE
WORD 0x07FF
WORD 0x01FF
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x02C0
WORD 0x01F1
WORD 0x01FB
WORD 0x09FF
WORD 0x02FE
WORD 0x07FF
WORD 0x01E0
WORD 0x06C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E1
WORD 0x01F1
WORD 0x13FF
WORD 0x01E2
WORD 0x01E0
WORD 0x06C0
WORD 0x0180
WORD 0x01E0
WORD 0x01F1
WORD 0x01F9
WORD 0x01FB
WORD 0x12FF
WORD 0x01F3
WORD 0x02E0
WORD 0x05C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01FB
WORD 0x0BFF
WORD 0x01FE
WORD 0x06FF
WORD 0x01FF
WORD 0x01E3
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E1
WORD 0x01F1
WORD 0x01F3
WORD 0x11FF
WORD 0x02FF
WORD 0x01E2
WORD 0x03C0
WORD 0x0180
WORD 0x01C0
WORD 0x0280
WORD 0x02C0
WORD 0x01F1
WORD 0x01F3
WORD 0x01F7
WORD 0x10FF
WORD 0x02FF
WORD 0x01E3
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E1
WORD 0x01F3
WORD 0x01F7
WORD 0x06FF
WORD 0x01FD
WORD 0x09FF
WORD 0x03FF
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x02F7
WORD 0x05FF
WORD 0x01FD
WORD 0x09FF
WORD 0x03FF
WORD 0x01F2
WORD 0x02E0
WORD 0x04C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01FB
WORD 0x02FF
WORD 0x017F
WORD 0x0DFF
WORD 0x03FF
WORD 0x01F3
WORD 0x01F0
WORD 0x03E0
WORD 0x02C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F9
WORD 0x01FB
WORD 0x0FFF
WORD 0x04FF
WORD 0x03E0
WORD 0x03C0
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01F3
WORD 0x05FF
WORD 0x01FD
WORD 0x09FF
WORD 0x04FF
WORD 0x01E1
WORD 0x01E0
WORD 0x04C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01F3
WORD 0x01F7
WORD 0x0EFF
WORD 0x04FF
WORD 0x01E3
WORD 0x01E0
WORD 0x04C0
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x01F3
WORD 0x01F7
WORD 0x03FF
WORD 0x01FB
WORD 0x0AFF
WORD 0x02FF
WORD 0x01FE
WORD 0x01FF
WORD 0x01F7
WORD 0x01E2
WORD 0x03C0
WORD 0x0480
WORD 0x01C0
WORD 0x01E0
WORD 0x01E1
WORD 0x01F3
WORD 0x03FF
WORD 0x01FB
WORD 0x07FF
WORD 0x01EF
WORD 0x02FF
WORD 0x05FF
WORD 0x01E3
WORD 0x02C0
WORD 0x0380
WORD 0x0100
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F3
WORD 0x01EF
WORD 0x01FF
WORD 0x01FB
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F1
WORD 0x02E0
WORD 0x04C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F1
WORD 0x01F7
WORD 0x0DFF
WORD 0x05FF
WORD 0x01F1
WORD 0x02E0
WORD 0x03C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F3
WORD 0x01F7
WORD 0x01FF
WORD 0x01FD
WORD 0x0BFF
WORD 0x04FF
WORD 0x01F3
WORD 0x01E0
WORD 0x04C0
WORD 0x0280
WORD 0x02C0
WORD 0x01F0
WORD 0x01F3
WORD 0x01F7
WORD 0x01FF
WORD 0x02FD
WORD 0x0BFF
WORD 0x03FF
WORD 0x01E3
WORD 0x01E0
WORD 0x04C0
WORD 0x0380
WORD 0x01C0
WORD 0x01E0
WORD 0x01F3
WORD 0x01F7
WORD 0x0FFF
WORD 0x03FF
WORD 0x01E3
WORD 0x05C0
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x01F3
WORD 0x01F7
WORD 0x0FFF
WORD 0x03FF
WORD 0x01E3
WORD 0x01E0
WORD 0x04C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01F3
WORD 0x01F7
WORD 0x0FFF
WORD 0x03FF
WORD 0x01E1
WORD 0x01E0
WORD 0x04C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01F3
WORD 0x10FF
WORD 0x02FF
WORD 0x01FB
WORD 0x01F0
WORD 0x02E0
WORD 0x03C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F9
WORD 0x01FB
WORD 0x04FF
WORD 0x01FD
WORD 0x0BFF
WORD 0x01FF
WORD 0x01F7
WORD 0x01F1
WORD 0x02E0
WORD 0x04C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01FB
WORD 0x05FF
WORD 0x01FD
WORD 0x0BFF
WORD 0x01FD
WORD 0x01E3
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x01C0
WORD 0x02F1
WORD 0x01F3
WORD 0x05FF
WORD 0x01FD
WORD 0x0BFF
WORD 0x01E2
WORD 0x01E0
WORD 0x05C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01F7
WORD 0x06FF
WORD 0x01F9
WORD 0x0BFF
WORD 0x06C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x02F7
WORD 0x05FF
WORD 0x02FB
WORD 0x0BFF
WORD 0x03C0
WORD 0x0480
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x01F3
WORD 0x01F7
WORD 0x06FF
WORD 0x01FB
WORD 0x0CFF
WORD 0x05C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F9
WORD 0x01FB
WORD 0x06FF
WORD 0x01FB
WORD 0x0AFF
WORD 0x01BF
WORD 0x02FF
WORD 0x04C0
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F9
WORD 0x01FB
WORD 0x05FF
WORD 0x02FB
WORD 0x0DFF
WORD 0x03C0
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F1
WORD 0x01F3
WORD 0x02FF
WORD 0x01FD
WORD 0x02FF
WORD 0x01F9
WORD 0x0EFF
WORD 0x0380
WORD 0x0100
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F1
WORD 0x01F7
WORD 0x04FF
WORD 0x01FB
WORD 0x01FD
WORD 0x0EFF
WORD 0x0180
WORD 0x0200
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x02F0
WORD 0x01F7
WORD 0x05FF
WORD 0x01FB
WORD 0x01FD
WORD 0x0EFF
WORD 0x0100
WORD 0x0280
WORD 0x02C0
WORD 0x01E0
WORD 0x02F0
WORD 0x01F1
WORD 0x01F7
WORD 0x05FF
WORD 0x01FB
WORD 0x0FFF
WORD 0x0180
WORD 0x02C0
WORD 0x02E0
WORD 0x01F0
WORD 0x02F8
WORD 0x01F3
WORD 0x06FF
WORD 0x01FB
WORD 0x0FFF
WORD 0x02C0
WORD 0x01E0
WORD 0x02F0
WORD 0x03F8
WORD 0x01FB
WORD 0x06FF
WORD 0x01FB
WORD 0x0FFF
WORD 0x03E0
WORD 0x01F0
WORD 0x03F8
WORD 0x01F9
WORD 0x07FF
WORD 0x01FB
WORD 0x01FD
WORD 0x0EFF
WORD 0x02E0
WORD 0x01F0
WORD 0x04F8
WORD 0x01FB
WORD 0x08FF
WORD 0x01FD
WORD 0x0EFF
WORD 0x01E0
WORD 0x01F0
WORD 0x04F8
WORD 0x01F9
WORD 0x08FF
WORD 0x01FD
WORD 0x0FFF
WORD 0x02F0
WORD 0x03F8
WORD 0x01F0
WORD 0x01F1
WORD 0x08FF
WORD 0x01FC
WORD 0x0FFF
WORD 0x01F0
WORD 0x03F8
WORD 0x02F0
WORD 0x08FF
WORD 0x01FD
WORD 0x01FE
WORD 0x0FFF
WORD 0x05FC
WORD 0x08FF
WORD 0x01FD
WORD 0x02FC
WORD 0x0FFF
WORD 0x01FE
WORD 0x0CFF
WORD 0x01FD
WORD 0x01FC
WORD 0x01FE
WORD 0x0FFF
WORD 0x0DFF
WORD 0x01FD
WORD 0x01FE
WORD 0x10FF
WORD 0x0DFF
WORD 0x01FD
WORD 0x01FE
WORD 0x10FF
WORD 0x0CFF
WORD 0x03FC
WORD 0x02FE
WORD 0x0EFF
WORD 0x0BFF
WORD 0x01FE
WORD 0x03FC
WORD 0x03FE
WORD 0x0DFF
WORD 0x0BFF
WORD 0x02FE
WORD 0x02FC
WORD 0x04FE
WORD 0x0CFF
WORD 0x0BFF
WORD 0x04FE
WORD 0x04FC
WORD 0x01FE
WORD 0x0BFF
WORD 0x0DFF
WORD 0x02FE
WORD 0x04FC
WORD 0x01FD
WORD 0x0BFF
WORD 0x0DFF
WORD 0x02FE
WORD 0x01FC
WORD 0x03F8
WORD 0x0CFF
WORD 0x0EFF
WORD 0x01FC
WORD 0x02F8
WORD 0x01F0
WORD 0x01F9
WORD 0x0CFF
WORD 0x0EFF
WORD 0x01F8
WORD 0x02F0
WORD 0x01F8
WORD 0x0DFF
WORD 0x0DFF
WORD 0x01F8
WORD 0x02F0
WORD 0x01F8
WORD 0x01FC
WORD 0x0DFF
WORD 0x0CFF
WORD 0x01F3
WORD 0x02F0
WORD 0x01F8
WORD 0x01FC
WORD 0x01FE
WORD 0x0DFF
WORD 0x0BFF
WORD 0x01F3
WORD 0x01F1
WORD 0x01F0
WORD 0x02F8
WORD 0x01FC
WORD 0x02FE
WORD 0x0CFF
WORD 0x0AFF
WORD 0x01F3
WORD 0x01F1
WORD 0x03F8
WORD 0x02FC
WORD 0x02FE
WORD 0x0CFF
WORD 0x09FF
WORD 0x01FB
WORD 0x01F9
WORD 0x03F8
WORD 0x03FC
WORD 0x03FE
WORD 0x0BFF
WORD 0x08FF
WORD 0x01FB
WORD 0x01F9
WORD 0x04F8
WORD 0x03FC
WORD 0x04FE
WORD 0x0AFF
WORD 0x07FF
WORD 0x02FD
WORD 0x02FC
WORD 0x02F8
WORD 0x04FC
WORD 0x06FE
WORD 0x08FF
WORD 0x07FF
WORD 0x01FD
WORD 0x03FC
WORD 0x02F8
WORD 0x05FC
WORD 0x06FE
WORD 0x07FF
WORD 0x07FF
WORD 0x04FE
WORD 0x01F8
WORD 0x0BFC
WORD 0x01FE
WORD 0x07FF
WORD 0x07FF
WORD 0x03FE
WORD 0x01FC
WORD 0x01F8
WORD 0x03FC
WORD 0x01FE
WORD 0x07FC
WORD 0x01FE
WORD 0x07FF
WORD 0x08FF
WORD 0x01FD
WORD 0x01FF
WORD 0x02FC
WORD 0x01FE
WORD 0x01FA
WORD 0x01FC
WORD 0x01FE
WORD 0x07FC
WORD 0x01FE
WORD 0x07FF
WORD 0x0AFF
WORD 0x01FD
WORD 0x01FC
WORD 0x01FE
WORD 0x02FA
WORD 0x01FE
WORD 0x07FC
WORD 0x01FD
WORD 0x07FF
WORD 0x0BFF
WORD 0x02FC
WORD 0x01FE
WORD 0x01F8
WORD 0x01FE
WORD 0x06FC
WORD 0x01FD
WORD 0x08FF
WORD 0x09FF
WORD 0x01FE
WORD 0x01FF
WORD 0x02FC
WORD 0x01FA
WORD 0x01F8
WORD 0x01FE
WORD 0x06FC
WORD 0x01FD
WORD 0x08FF
WORD 0x0AFF
WORD 0x01FE
WORD 0x01FD
WORD 0x02FC
WORD 0x01F8
WORD 0x06FC
WORD 0x01FD
WORD 0x09FF
WORD 0x0AFF
WORD 0x02FE
WORD 0x01FD
WORD 0x01FC
WORD 0x02F8
WORD 0x05FC
WORD 0x0AFF
WORD 0x0BFF
WORD 0x01FE
WORD 0x01FF
WORD 0x01FC
WORD 0x02F8
WORD 0x04FC
WORD 0x01FE
WORD 0x0AFF
WORD 0x0DFF
WORD 0x01FE
WORD 0x02F8
WORD 0x03FC
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x02FE
WORD 0x01FC
WORD 0x02F8
WORD 0x02FE
WORD 0x0CFF
WORD 0x0CFF
WORD 0x03FE
WORD 0x01FC
WORD 0x02F8
WORD 0x0DFF
WORD 0x0BFF
WORD 0x05FE
WORD 0x01F8
WORD 0x01F0
WORD 0x01FC
WORD 0x0CFF
WORD 0x0BFF
WORD 0x06FE
WORD 0x02F0
WORD 0x01FE
WORD 0x0BFF
WORD 0x11FF
WORD 0x01F2
WORD 0x01F0
WORD 0x01FE
WORD 0x0BFF
WORD 0x11FF
WORD 0x01F2
WORD 0x02F0
WORD 0x03FF
WORD 0x01FE
WORD 0x07FF
WORD 0x11FF
WORD 0x01F2
WORD 0x02F0
WORD 0x01FE
WORD 0x0AFF
WORD 0x11FF
WORD 0x01F6
WORD 0x02F0
WORD 0x01FE
WORD 0x03FF
WORD 0x01FE
WORD 0x06FF
WORD 0x11FF
WORD 0x01F6
WORD 0x02F0
WORD 0x01FA
WORD 0x04FF
WORD 0x01FE
WORD 0x05FF
WORD 0x11FF
WORD 0x01F6
WORD 0x01F4
WORD 0x01F0
WORD 0x01FA
WORD 0x04FF
WORD 0x01FE
WORD 0x05FF
WORD 0x10FF
WORD 0x01F0
WORD 0x01F6
WORD 0x01F4
WORD 0x01F0
WORD 0x01F8
WORD 0x04FF
WORD 0x02FE
WORD 0x04FF
WORD 0x10FF
WORD 0x01E1
WORD 0x01EE
WORD 0x01E4
WORD 0x01E0
WORD 0x01FC
WORD 0x04FF
WORD 0x02FE
WORD 0x04FF
WORD 0x10FF
WORD 0x01E5
WORD 0x01EE
WORD 0x01E4
WORD 0x01E0
WORD 0x01F8
WORD 0x05FF
WORD 0x01FE
WORD 0x04FF
WORD 0x10FF
WORD 0x02EE
WORD 0x01E4
WORD 0x01E0
WORD 0x01F4
WORD 0x01F7
WORD 0x04FF
WORD 0x01FE
WORD 0x01FC
WORD 0x03FF
WORD 0x0FFF
WORD 0x01E1
WORD 0x01DE
WORD 0x01FC
WORD 0x01C8
WORD 0x01C0
WORD 0x01F0
WORD 0x01F7
WORD 0x03FF
WORD 0x03FE
WORD 0x01FD
WORD 0x02FF
WORD 0x0FFF
WORD 0x01C1
WORD 0x02DC
WORD 0x0188
WORD 0x01C0
WORD 0x01E8
WORD 0x02EF
WORD 0x05FE
WORD 0x01FC
WORD 0x01FD
WORD 0x01FF
WORD 0x0EFF
WORD 0x01C1
WORD 0x019D
WORD 0x01BD
WORD 0x01B8
WORD 0x0110
WORD 0x0180
WORD 0x01C8
WORD 0x01DD
WORD 0x01FF
WORD 0x06FE
WORD 0x01FC
WORD 0x01F9
WORD 0x0DFF
WORD 0x01CF
WORD 0x0101
WORD 0x017D
WORD 0x01F9
WORD 0x0130
WORD 0x0200
WORD 0x0180
WORD 0x01BA
WORD 0x01BE
WORD 0x01DE
WORD 0x02FE
WORD 0x05FC
WORD 0x0CFF
WORD 0x019F
WORD 0x0103
WORD 0x01FD
WORD 0x01F9
WORD 0x01F1
WORD 0x0161
WORD 0x0200
WORD 0x0120
WORD 0x0172
WORD 0x037E
WORD 0x06FC
WORD 0x0BFF
WORD 0x0107
WORD 0x0103
WORD 0x01FF
WORD 0x01F8
WORD 0x01F2
WORD 0x01E2
WORD 0x0300
WORD 0x0140
WORD 0x01F4
WORD 0x06FC
WORD 0x03F8
WORD 0x07FF
WORD 0x02FE
WORD 0x017E
WORD 0x0106
WORD 0x01D6
WORD 0x01FE
WORD 0x01F2
WORD 0x02E2
WORD 0x01C2
WORD 0x0300
WORD 0x0180
WORD 0x05FC
WORD 0x05F8
WORD 0x08FE
WORD 0x017E
WORD 0x010E
WORD 0x02FE
WORD 0x01E2
WORD 0x01E6
WORD 0x01C6
WORD 0x0182
WORD 0x0400
WORD 0x018C
WORD 0x03FC
WORD 0x06F8
WORD 0x01F0
WORD 0x07FE
WORD 0x011E
WORD 0x010E
WORD 0x01FE
WORD 0x01F6
WORD 0x01E6
WORD 0x01C4
WORD 0x0284
WORD 0x0104
WORD 0x0300
WORD 0x010C
WORD 0x01BC
WORD 0x02FC
WORD 0x06F8
WORD 0x02F0
WORD 0x07FE
WORD 0x011E
WORD 0x016E
WORD 0x01FE
WORD 0x01C4
WORD 0x0384
WORD 0x0104
WORD 0x0400
WORD 0x010C
WORD 0x02FC
WORD 0x07F8
WORD 0x02F0
WORD 0x06FE
WORD 0x015E
WORD 0x010E
WORD 0x02EE
WORD 0x01CE
WORD 0x0384
WORD 0x0104
WORD 0x0400
WORD 0x010C
WORD 0x01DC
WORD 0x02FC
WORD 0x06F8
WORD 0x02F0
WORD 0x06FE
WORD 0x015E
WORD 0x010E
WORD 0x01FE
WORD 0x01EE
WORD 0x01C6
WORD 0x0386
WORD 0x0106
WORD 0x0500
WORD 0x01DC
WORD 0x03FC
WORD 0x06F8
WORD 0x01F0
WORD 0x06FF
WORD 0x011F
WORD 0x012E
WORD 0x01FE
WORD 0x01F6
WORD 0x02C6
WORD 0x0186
WORD 0x0282
WORD 0x0102
WORD 0x0400
WORD 0x01AC
WORD 0x05FC
WORD 0x05F8
WORD 0x05FF
WORD 0x017F
WORD 0x010F
WORD 0x0137
WORD 0x02F7
WORD 0x01E7
WORD 0x01C7
WORD 0x01C3
WORD 0x0282
WORD 0x0102
WORD 0x0200
WORD 0x0102
WORD 0x0106
WORD 0x01FE
WORD 0x06FC
WORD 0x04F8
WORD 0x05FF
WORD 0x017F
WORD 0x010F
WORD 0x01B7
WORD 0x02FB
WORD 0x02E3
WORD 0x02C3
WORD 0x0183
WORD 0x0400
WORD 0x0182
WORD 0x01E6
WORD 0x02FE
WORD 0x06FC
WORD 0x02F8
WORD 0x05FF
WORD 0x013F
WORD 0x0107
WORD 0x03FB
WORD 0x01F3
WORD 0x01F1
WORD 0x02E1
WORD 0x0141
WORD 0x0101
WORD 0x0300
WORD 0x0180
WORD 0x01E2
WORD 0x05FE
WORD 0x05FC
WORD 0x04FF
WORD 0x017F
WORD 0x0107
WORD 0x0183
WORD 0x02FF
WORD 0x01FD
WORD 0x02F9
WORD 0x02F1
WORD 0x0160
WORD 0x0400
WORD 0x01C0
WORD 0x01E0
WORD 0x01FB
WORD 0x01FF
WORD 0x05FE
WORD 0x03FC
WORD 0x04FF
WORD 0x011F
WORD 0x0103
WORD 0x01C5
WORD 0x01FD
WORD 0x01FF
WORD 0x02FE
WORD 0x01FC
WORD 0x01F8
WORD 0x01F0
WORD 0x0120
WORD 0x0400
WORD 0x01C0
WORD 0x01F0
WORD 0x05FF
WORD 0x05FE
WORD 0x03FF
WORD 0x013F
WORD 0x010F
WORD 0x0101
WORD 0x01E6
WORD 0x05FF
WORD 0x01FC
WORD 0x01F8
WORD 0x0130
WORD 0x0400
WORD 0x0160
WORD 0x0178
WORD 0x08FF
WORD 0x02FE
WORD 0x03FF
WORD 0x011F
WORD 0x0107
WORD 0x0100
WORD 0x05FF
WORD 0x02FE
WORD 0x01FC
WORD 0x0190
WORD 0x0400
WORD 0x0130
WORD 0x017E
WORD 0x037F
WORD 0x04FF
WORD 0x037F
WORD 0x03FF
WORD 0x0107
WORD 0x0100
WORD 0x0171
WORD 0x05FF
WORD 0x01FE
WORD 0x02FC
WORD 0x0108
WORD 0x0400
WORD 0x01B8
WORD 0x01BF
WORD 0x023F
WORD 0x067F
WORD 0x013F
WORD 0x01BF
WORD 0x02FF
WORD 0x018F
WORD 0x0103
WORD 0x0100
WORD 0x0179
WORD 0x05FF
WORD 0x02FE
WORD 0x016C
WORD 0x0500
WORD 0x015C
WORD 0x025F
WORD 0x019F
WORD 0x07BF
WORD 0x019F
WORD 0x02FF
WORD 0x0103
WORD 0x0100
WORD 0x0110
WORD 0x017E
WORD 0x05FF
WORD 0x01FE
WORD 0x017E
WORD 0x0136
WORD 0x0400
WORD 0x0180
WORD 0x02AE
WORD 0x01AF
WORD 0x018F
WORD 0x019F
WORD 0x06DF
WORD 0x01CF
WORD 0x02FF
WORD 0x0101
WORD 0x0100
WORD 0x011C
WORD 0x017F
WORD 0x02FF
WORD 0x047F
WORD 0x013F
WORD 0x013B
WORD 0x0102
WORD 0x0300
WORD 0x0140
WORD 0x01D6
WORD 0x02D7
WORD 0x01C7
WORD 0x01CF
WORD 0x07EF
WORD 0x01FF
WORD 0x01E1
WORD 0x0180
WORD 0x0100
WORD 0x011F
WORD 0x013F
WORD 0x027F
WORD 0x01FF
WORD 0x04BF
WORD 0x011D
WORD 0x0101
WORD 0x0300
WORD 0x0120
WORD 0x03EB
WORD 0x01E3
WORD 0x02E7
WORD 0x06F7
WORD 0x01FF
WORD 0x01E0
WORD 0x0200
WORD 0x010F
WORD 0x04BF
WORD 0x01FF
WORD 0x03DF
WORD 0x018D
WORD 0x0400
WORD 0x0110
WORD 0x01FD
WORD 0x02F5
WORD 0x01F1
WORD 0x02F3
WORD 0x01FF
WORD 0x05FB
WORD 0x01FF
WORD 0x01E0
WORD 0x0280
WORD 0x018F
WORD 0x019F
WORD 0x04DF
WORD 0x01FF
WORD 0x01EF
WORD 0x01CF
WORD 0x0186
WORD 0x0180
WORD 0x0200
WORD 0x0180
WORD 0x0190
WORD 0x01D4
WORD 0x01FE
WORD 0x02F8
WORD 0x02F9
WORD 0x01FB
WORD 0x05FD
WORD 0x01FF
WORD 0x01E0
WORD 0x0180
WORD 0x0181
WORD 0x01CF
WORD 0x02DF
WORD 0x01FF
WORD 0x03EF
WORD 0x01FF
WORD 0x01E7
WORD 0x01C7
WORD 0x0480
WORD 0x0188
WORD 0x02FA
WORD 0x02FE
WORD 0x02FC
WORD 0x02FD
WORD 0x01FC
WORD 0x03FE
WORD 0x01FF
WORD 0x01E0
WORD 0x01C0
WORD 0x01C1
WORD 0x01C7
WORD 0x04EF
WORD 0x01FF
WORD 0x02F7
WORD 0x01E7
WORD 0x01C3
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01C4
WORD 0x01EC
WORD 0x03FD
WORD 0x02FC
WORD 0x05FE
WORD 0x01FF
WORD 0x01FE
WORD 0x01F0
WORD 0x01C0
WORD 0x01C1
WORD 0x01E7
WORD 0x02EF
WORD 0x02FF
WORD 0x02F7
WORD 0x01FF
WORD 0x01EF
WORD 0x01E3
WORD 0x01C2
WORD 0x03C0
WORD 0x01C4
WORD 0x01ED
WORD 0x01FD
WORD 0x02FF
WORD 0x04FE
WORD 0x04FF
WORD 0x01FE
WORD 0x01F0
WORD 0x01C0
WORD 0x01E1
WORD 0x01E7
WORD 0x01EF
WORD 0x02FF
WORD 0x02F7
WORD 0x01FF
WORD 0x02FB
WORD 0x01E3
WORD 0x04C0
WORD 0x01C4
WORD 0x01E4
WORD 0x01FF
WORD 0x05FE
WORD 0x05FF
WORD 0x01FE
WORD 0x01F0
WORD 0x01E0
WORD 0x01E1
WORD 0x01E7
WORD 0x01EF
WORD 0x01FF
WORD 0x02F7
WORD 0x02FF
WORD 0x02FB
WORD 0x02E3
WORD 0x03C0
WORD 0x01E4
WORD 0x01E6
WORD 0x05FE
WORD 0x06FF
WORD 0x01FE
WORD 0x01F0
WORD 0x01E0
WORD 0x01E1
WORD 0x01E7
WORD 0x01FF
WORD 0x02F7
WORD 0x02FF
WORD 0x02FB
WORD 0x01F3
WORD 0x01F1
WORD 0x01E1
WORD 0x02C0
WORD 0x01E0
WORD 0x01E2
WORD 0x01E6
WORD 0x03FE
WORD 0x08FF
WORD 0x01FF
WORD 0x01F0
WORD 0x02E0
WORD 0x01F3
WORD 0x03F7
WORD 0x01FF
WORD 0x03FB
WORD 0x01FF
WORD 0x01F1
WORD 0x01E1
WORD 0x03E0
WORD 0x01E2
WORD 0x01E6
WORD 0x02FE
WORD 0x09FF
WORD 0x01FF
WORD 0x01F0
WORD 0x02E0
WORD 0x01F3
WORD 0x02F7
WORD 0x02FF
WORD 0x04FB
WORD 0x01F1
WORD 0x01E1
WORD 0x03E0
WORD 0x01E2
WORD 0x01E6
WORD 0x01FE
WORD 0x0AFF
WORD 0x01FF
WORD 0x01F8
WORD 0x02E0
WORD 0x01F3
WORD 0x02F7
WORD 0x02FF
WORD 0x02FB
WORD 0x01FF
WORD 0x01FB
WORD 0x01F1
WORD 0x04E0
WORD 0x01E2
WORD 0x01F6
WORD 0x01FE
WORD 0x0AFF
WORD 0x01FF
WORD 0x01F8
WORD 0x01E0
WORD 0x01F0
WORD 0x01F3
WORD 0x01F7
WORD 0x02FF
WORD 0x03FB
WORD 0x01FF
WORD 0x01FB
WORD 0x01F1
WORD 0x04E0
WORD 0x01E2
WORD 0x01F6
WORD 0x01FE
WORD 0x0AFF
WORD 0x01FF
WORD 0x01F8
WORD 0x01E0
WORD 0x01F0
WORD 0x01F3
WORD 0x01F7
WORD 0x02FF
WORD 0x02FB
WORD 0x02FF
WORD 0x01FB
WORD 0x01F1
WORD 0x04E0
WORD 0x01E2
WORD 0x01F6
WORD 0x01FE
WORD 0x0AFF
WORD 0x01FF
WORD 0x01F8
WORD 0x02F0
WORD 0x01F3
WORD 0x01F7
WORD 0x02FF
WORD 0x02FB
WORD 0x02FF
WORD 0x01F9
WORD 0x01F1
WORD 0x04E0
WORD 0x01E2
WORD 0x01F6
WORD 0x01FE
WORD 0x0AFF
WORD 0x01FF
WORD 0x01F8
WORD 0x02F0
WORD 0x01F3
WORD 0x01F7
WORD 0x02FF
WORD 0x02FB
WORD 0x02FF
WORD 0x01F9
WORD 0x01F1
WORD 0x04E0
WORD 0x01E2
WORD 0x01F6
WORD 0x02FE
WORD 0x09FF
WORD 0x01FF
WORD 0x01F8
WORD 0x02F0
WORD 0x01F3
WORD 0x01F7
WORD 0x02FF
WORD 0x02FB
WORD 0x02FF
WORD 0x01FB
WORD 0x01F1
WORD 0x01E1
WORD 0x03E0
WORD 0x01E2
WORD 0x04FE
WORD 0x08FF
WORD 0x01FF
WORD 0x03F0
WORD 0x01F3
WORD 0x01F7
WORD 0x02FF
WORD 0x03FB
WORD 0x01FF
WORD 0x01FB
WORD 0x01E1
WORD 0x04E0
WORD 0x01E4
WORD 0x07FE
WORD 0x05FF
WORD 0x01FF
WORD 0x03F0
WORD 0x01F3
WORD 0x01F7
WORD 0x02FF
WORD 0x04FB
WORD 0x01F3
WORD 0x01E1
WORD 0x04E0
WORD 0x01E4
WORD 0x01FC
WORD 0x01FF
WORD 0x06FE
WORD 0x04FF