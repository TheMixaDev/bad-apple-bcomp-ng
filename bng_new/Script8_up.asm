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
WORD 0x01FF
WORD 0x03F0
WORD 0x01F3
WORD 0x02F7
WORD 0x02FF
WORD 0x03FB
WORD 0x01F3
WORD 0x01E1
WORD 0x01E0
WORD 0x03C0
WORD 0x01EC
WORD 0x01FC
WORD 0x02FF
WORD 0x06FE
WORD 0x03FF
WORD 0x01FF
WORD 0x02E0
WORD 0x01F0
WORD 0x01F3
WORD 0x02F7
WORD 0x02FF
WORD 0x03FB
WORD 0x01E3
WORD 0x01E1
WORD 0x04C0
WORD 0x01EC
WORD 0x01FC
WORD 0x04FF
WORD 0x06FE
WORD 0x01FF
WORD 0x01FF
WORD 0x03E0
WORD 0x01F3
WORD 0x03F7
WORD 0x02FF
WORD 0x01FB
WORD 0x01F3
WORD 0x01E3
WORD 0x01E1
WORD 0x04C0
WORD 0x02FC
WORD 0x02FD
WORD 0x02FF
WORD 0x07FE
WORD 0x01FF
WORD 0x01F8
WORD 0x02E0
WORD 0x01F3
WORD 0x03F7
WORD 0x03FF
WORD 0x01F3
WORD 0x01E3
WORD 0x01E1
WORD 0x04C0
WORD 0x02FC
WORD 0x02FD
WORD 0x02FF
WORD 0x07FE
WORD 0x01FF
WORD 0x01F8
WORD 0x02E0
WORD 0x01F3
WORD 0x03F7
WORD 0x03FF
WORD 0x01F3
WORD 0x01E3
WORD 0x01E1
WORD 0x01C1
WORD 0x03C0
WORD 0x02FC
WORD 0x02FD
WORD 0x02FF
WORD 0x07FE
WORD 0x01FF
WORD 0x01F8
WORD 0x02E0
WORD 0x01F3
WORD 0x03F7
WORD 0x03FF
WORD 0x01F3
WORD 0x01E3
WORD 0x01E1
WORD 0x01C1
WORD 0x03C0
WORD 0x02FC
WORD 0x02FD
WORD 0x02FF
WORD 0x07FE
WORD 0x01FF
WORD 0x01F8
WORD 0x02E0
WORD 0x01F3
WORD 0x03F7
WORD 0x02FF
WORD 0x01F7
WORD 0x01F3
WORD 0x01E3
WORD 0x01E1
WORD 0x01C1
WORD 0x03C0
WORD 0x01EC
WORD 0x02FC
WORD 0x01FD
WORD 0x02FF
WORD 0x07FE
WORD 0x01FF
WORD 0x01FC
WORD 0x02E0
WORD 0x01F1
WORD 0x03F7
WORD 0x02FF
WORD 0x02F7
WORD 0x02E1
WORD 0x01C1
WORD 0x04C0
WORD 0x02FC
WORD 0x01FD
WORD 0x02FF
WORD 0x07FE
WORD 0x02FF
WORD 0x02E0
WORD 0x01F0
WORD 0x01F3
WORD 0x01FF
WORD 0x02F7
WORD 0x01FF
WORD 0x02F7
WORD 0x01E3
WORD 0x02E1
WORD 0x01C1
WORD 0x03C0
WORD 0x02FC
WORD 0x01FD
WORD 0x03FF
WORD 0x06FE
WORD 0x02FF
WORD 0x01F8
WORD 0x02E0
WORD 0x01F1
WORD 0x03F7
WORD 0x02FF
WORD 0x01F7
WORD 0x01F3
WORD 0x01E3
WORD 0x01E1
WORD 0x01C1
WORD 0x04C0
WORD 0x02FC
WORD 0x01FD
WORD 0x03FF
WORD 0x05FE
WORD 0x02FF
WORD 0x01FE
WORD 0x03E0
WORD 0x01F3
WORD 0x03F7
WORD 0x02FF
WORD 0x01F7
WORD 0x01F3
WORD 0x01E3
WORD 0x01E1
WORD 0x01C1
WORD 0x04C0
WORD 0x03FC
WORD 0x03FF
WORD 0x04FE
WORD 0x03FF
WORD 0x01F8
WORD 0x03E0
WORD 0x04F7
WORD 0x03FF
WORD 0x02F3
WORD 0x01E1
WORD 0x01C1
WORD 0x04C0
WORD 0x01DC
WORD 0x02FC
WORD 0x03FF
WORD 0x03FE
WORD 0x04FF
WORD 0x03E0
WORD 0x01E1
WORD 0x04F7
WORD 0x02FF
WORD 0x02FB
WORD 0x01F3
WORD 0x01E3
WORD 0x01C1
WORD 0x05C0
WORD 0x03FC
WORD 0x02FF
WORD 0x02FE
WORD 0x04FF
WORD 0x01FC
WORD 0x03E0
WORD 0x01E1
WORD 0x01E7
WORD 0x01FF
WORD 0x03F7
WORD 0x01FF
WORD 0x01FB
WORD 0x01FF
WORD 0x01F3
WORD 0x01E3
WORD 0x01C1
WORD 0x06C0
WORD 0x02FC
WORD 0x01FE
WORD 0x01FF
WORD 0x01FE
WORD 0x05FF
WORD 0x01FC
WORD 0x03E0
WORD 0x01E1
WORD 0x01E7
WORD 0x01FF
WORD 0x04F7
WORD 0x02FF
WORD 0x01F3
WORD 0x01E3
WORD 0x01C3
WORD 0x01C1
WORD 0x01C0
WORD 0x0480
WORD 0x01D0
WORD 0x03FC
WORD 0x06FF
WORD 0x01F8
WORD 0x01C0
WORD 0x02E0
WORD 0x01E1
WORD 0x01E7
WORD 0x01EF
WORD 0x01FF
WORD 0x04F7
WORD 0x01FF
WORD 0x01F3
WORD 0x02E3
WORD 0x01C1
WORD 0x01C0
WORD 0x0580
WORD 0x0198
WORD 0x01FC
WORD 0x07FF
WORD 0x01D0
WORD 0x03C0
WORD 0x01E1
WORD 0x01E7
WORD 0x02EF
WORD 0x02FF
WORD 0x05F7
WORD 0x01E7
WORD 0x02C1
WORD 0x0380
WORD 0x0200
WORD 0x0180
WORD 0x07FF
WORD 0x01FC
WORD 0x04C0
WORD 0x01C1
WORD 0x01C7
WORD 0x04EF
WORD 0x01FF
WORD 0x04F7
WORD 0x01F3
WORD 0x01E7
WORD 0x01C1
WORD 0x0181
WORD 0x0280
WORD 0x0200
WORD 0x08FF
WORD 0x01F0
WORD 0x0280
WORD 0x02C0
WORD 0x01C3
WORD 0x01CF
WORD 0x01DF
WORD 0x01FF
WORD 0x05EF
WORD 0x01FF
WORD 0x02F7
WORD 0x01F3
WORD 0x01C3
WORD 0x01C1
WORD 0x0181
WORD 0x0180
WORD 0x0100
WORD 0x08FF
WORD 0x01FC
WORD 0x01A0
WORD 0x0480
WORD 0x0183
WORD 0x01CF
WORD 0x03DF
WORD 0x01FF
WORD 0x06EF
WORD 0x01FF
WORD 0x01E3
WORD 0x01C3
WORD 0x0181
WORD 0x0101
WORD 0x09FF
WORD 0x01E0
WORD 0x0300
WORD 0x0280
WORD 0x0187
WORD 0x029F
WORD 0x06DF
WORD 0x05EF
WORD 0x01C7
WORD 0x0187
WORD 0x09FF
WORD 0x01F0
WORD 0x0500
WORD 0x0101
WORD 0x010F
WORD 0x023F
WORD 0x04BF
WORD 0x019F
WORD 0x06DF
WORD 0x01CF
WORD 0x09FF
WORD 0x01F0
WORD 0x0180
WORD 0x0600
WORD 0x010F
WORD 0x013F
WORD 0x067F
WORD 0x023F
WORD 0x04BF
WORD 0x09FF
WORD 0x01F0
WORD 0x0180
WORD 0x0700
WORD 0x0107
WORD 0x013F
WORD 0x09FF
WORD 0x027F
WORD 0x09FF
WORD 0x01F0
WORD 0x0180
WORD 0x0800
WORD 0x0101
WORD 0x011F
WORD 0x017F
WORD 0x09FF
WORD 0x0AFF
WORD 0x0180
WORD 0x0A00
WORD 0x0103
WORD 0x013F
WORD 0x017F
WORD 0x07FF
WORD 0x0AFF
WORD 0x01C0
WORD 0x0D00
WORD 0x013F
WORD 0x017F
WORD 0x05FF
WORD 0x0BFF
WORD 0x0180
WORD 0x0E00
WORD 0x010D
WORD 0x013F
WORD 0x03FF
WORD 0x0CFF
WORD 0x0180
WORD 0x1000
WORD 0x011F
WORD 0x01FF
WORD 0x0EFF
WORD 0x1000
WORD 0x0107
WORD 0x0EFF
WORD 0x01E7
WORD 0x1000
WORD 0x0FFF
WORD 0x1000
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x10FF
WORD 0x0F00
WORD 0x0EFF
WORD 0x02FE
WORD 0x0101
WORD 0x0E00
WORD 0x0DFF
WORD 0x02FE
WORD 0x01FC
WORD 0x0201
WORD 0x0D00
WORD 0x0BFF
WORD 0x03FE
WORD 0x02FC
WORD 0x0203
WORD 0x0101
WORD 0x0C00
WORD 0x0BFF
WORD 0x01FE
WORD 0x03FC
WORD 0x01F8
WORD 0x0303
WORD 0x0C00
WORD 0x0BFF
WORD 0x01FD
WORD 0x02FC
WORD 0x02F8
WORD 0x0207
WORD 0x0103
WORD 0x0C00
WORD 0x0BFF
WORD 0x01FD
WORD 0x03F8
WORD 0x01F0
WORD 0x0207
WORD 0x0103
WORD 0x0C00
WORD 0x0BFF
WORD 0x01FD
WORD 0x01F9
WORD 0x01F8
WORD 0x02F0
WORD 0x010F
WORD 0x0207
WORD 0x0C00
WORD 0x0CFF
WORD 0x01F9
WORD 0x03F0
WORD 0x010F
WORD 0x0206
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FD
WORD 0x03F0
WORD 0x010F
WORD 0x020E
WORD 0x0C00
WORD 0x0CFF
WORD 0x01F9
WORD 0x03F0
WORD 0x010F
WORD 0x020E
WORD 0x0C00
WORD 0x0CFF
WORD 0x01F9
WORD 0x03F0
WORD 0x010F
WORD 0x020E
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FD
WORD 0x03F0
WORD 0x020F
WORD 0x010E
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FD
WORD 0x01F8
WORD 0x02F0
WORD 0x010F
WORD 0x0107
WORD 0x0106
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FD
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x010E
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FC
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x010E
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FC
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x010E
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FC
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x0106
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FC
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x0106
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FC
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x0106
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FD
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x0106
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FD
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0107
WORD 0x0106
WORD 0x0C00
WORD 0x0CFF
WORD 0x01FD
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0207
WORD 0x0C00
WORD 0x0DFF
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0207
WORD 0x0C00
WORD 0x0DFF
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0207
WORD 0x0C00
WORD 0x0DFF
WORD 0x02F8
WORD 0x01F0
WORD 0x010F
WORD 0x0207
WORD 0x0C00
WORD 0x0DFF
WORD 0x01FC
WORD 0x02F8
WORD 0x0307
WORD 0x0106
WORD 0x0B00
WORD 0x0DFF
WORD 0x01FC
WORD 0x02F8
WORD 0x0307
WORD 0x0106
WORD 0x0B00
WORD 0x0DFF
WORD 0x01FC
WORD 0x02F8
WORD 0x0307
WORD 0x0106
WORD 0x0B00
WORD 0x0DFF
WORD 0x01FC
WORD 0x02F8
WORD 0x0307
WORD 0x0106
WORD 0x0B00
WORD 0x0DFF
WORD 0x01FE
WORD 0x01FC
WORD 0x01F8
WORD 0x0207
WORD 0x0203
WORD 0x0101
WORD 0x0A00
WORD 0x0EFF
WORD 0x01FE
WORD 0x01FC
WORD 0x0203
WORD 0x0201
WORD 0x0B00
WORD 0x0EFF
WORD 0x02FE
WORD 0x0301
WORD 0x0C00
WORD 0x0FFF
WORD 0x01FE
WORD 0x0201
WORD 0x0100
WORD 0x0101
WORD 0x0B00
WORD 0x0FFF
WORD 0x01C4
WORD 0x0107
WORD 0x0E00
WORD 0x0DFF
WORD 0x01DF
WORD 0x0180
WORD 0x01E0
WORD 0x0F00
WORD 0x0DFF
WORD 0x0187
WORD 0x01E0
WORD 0x01FC
WORD 0x0F00
WORD 0x0DFF
WORD 0x01C3
WORD 0x01F0
WORD 0x01FC
WORD 0x0F00
WORD 0x0DFF
WORD 0x01C3
WORD 0x01F0
WORD 0x1000
WORD 0x0DFF
WORD 0x01C3
WORD 0x01F8
WORD 0x1000
WORD 0x0DFF
WORD 0x01C3
WORD 0x01F8
WORD 0x1000
WORD 0x0DFF
WORD 0x01C1
WORD 0x01F8
WORD 0x1000
WORD 0x0DFF
WORD 0x01C0
WORD 0x01F8
WORD 0x1000
WORD 0x0DFF
WORD 0x01C0
WORD 0x01FC
WORD 0x1000
WORD 0x0DFF
WORD 0x02C0
WORD 0x1000
WORD 0x0DFF
WORD 0x01C0
WORD 0x01E0
WORD 0x1000
WORD 0x0DFF
WORD 0x01C0
WORD 0x1100
WORD 0x0CFF
WORD 0x01FE
WORD 0x01C0
WORD 0x1100
WORD 0x0CFF
WORD 0x01FE
WORD 0x01C0
WORD 0x1100
WORD 0x0BFF
WORD 0x01FE
WORD 0x01E0
WORD 0x1200
WORD 0x0BFF
WORD 0x019C
WORD 0x0180
WORD 0x1200
WORD 0x0AFF
WORD 0x019F
WORD 0x0186
WORD 0x0100
WORD 0x0103
WORD 0x1100
WORD 0x0AFF
WORD 0x01BF
WORD 0x01CE
WORD 0x0111
WORD 0x0109
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0E00
WORD 0x0BFF
WORD 0x0201
WORD 0x0103
WORD 0x0113
WORD 0x0101
WORD 0x0107
WORD 0x0201
WORD 0x0C00
WORD 0x0BFF
WORD 0x0100
WORD 0x0503
WORD 0x0200
WORD 0x0201
WORD 0x0A00
WORD 0x0AFF
WORD 0x01FC
WORD 0x0102
WORD 0x0407
WORD 0x0103
WORD 0x0E00
WORD 0x0AFF
WORD 0x0100
WORD 0x0106
WORD 0x0107
WORD 0x020F
WORD 0x0107
WORD 0x0F00
WORD 0x09FF
WORD 0x01F3
WORD 0x010C
WORD 0x020E
WORD 0x010F
WORD 0x0107
WORD 0x0200
WORD 0x0401
WORD 0x0A00
WORD 0x09FF
WORD 0x01F3
WORD 0x011C
WORD 0x031F
WORD 0x0105
WORD 0x0301
WORD 0x0203
WORD 0x0102
WORD 0x0A00
WORD 0x09FF
WORD 0x01F2
WORD 0x010F
WORD 0x021F
WORD 0x010D
WORD 0x0401
WORD 0x0D00
WORD 0x03FC
WORD 0x02FD
WORD 0x03FC
WORD 0x01F4
WORD 0x01F0
WORD 0x0100
WORD 0x021F
WORD 0x011C
WORD 0x0103
WORD 0x0101
WORD 0x0F00
WORD 0x01FD
WORD 0x02F5
WORD 0x04F9
WORD 0x01F8
WORD 0x01FC
WORD 0x01F0
WORD 0x01E0
WORD 0x0100
WORD 0x011F
WORD 0x011D
WORD 0x010D
WORD 0x0103
WORD 0x0101
WORD 0x0E00
WORD 0x08FD
WORD 0x01F9
WORD 0x01FC
WORD 0x01F4
WORD 0x02E0
WORD 0x011F
WORD 0x021D
WORD 0x010D
WORD 0x0103
WORD 0x0D00
WORD 0x01FD
WORD 0x01FF
WORD 0x04FD
WORD 0x01FC
WORD 0x03FD
WORD 0x01F9
WORD 0x01F4
WORD 0x01F0
WORD 0x02E0
WORD 0x031D
WORD 0x010D
WORD 0x0103
WORD 0x0101
WORD 0x0A00
WORD 0x04FD
WORD 0x01FF
WORD 0x02FD
WORD 0x03FC
WORD 0x02FD
WORD 0x01FC
WORD 0x03F0
WORD 0x01E0
WORD 0x013D
WORD 0x031D
WORD 0x0105
WORD 0x0201
WORD 0x0700
WORD 0x02FF
WORD 0x04FD
WORD 0x02FF
WORD 0x07FD
WORD 0x02FC
WORD 0x01F0
WORD 0x01E0
WORD 0x01F0
WORD 0x01FD
WORD 0x031D
WORD 0x0119
WORD 0x0101
WORD 0x0100
WORD 0x0101
WORD 0x0300
WORD 0x06FF
WORD 0x04FD
WORD 0x02FF
WORD 0x07FD
WORD 0x02FC
WORD 0x02F0
WORD 0x01FF
WORD 0x011D
WORD 0x011F
WORD 0x021D
WORD 0x0119
WORD 0x0101
WORD 0x0104
WORD 0x0BFF
WORD 0x01FD
WORD 0x04FF
WORD 0x07FD
WORD 0x02FC
WORD 0x02F0
WORD 0x01FF
WORD 0x01FD
WORD 0x021F
WORD 0x15FF
WORD 0x01FC
WORD 0x01FD
WORD 0x01FC
WORD 0x03FD
WORD 0x02FC
WORD 0x01F8
WORD 0x01F0
WORD 0x14FF
WORD 0x04FE
WORD 0x01FF
WORD 0x04FC
WORD 0x02FD
WORD 0x17FF
WORD 0x06FE
WORD 0x02FC
WORD 0x19FF
WORD 0x06FE
WORD 0x1AFF
WORD 0x05FE
WORD 0x19FF
WORD 0x06FE
WORD 0x19FF
WORD 0x04FE
WORD 0x02FF
WORD 0x1FFF
WORD 0x1FFF
WORD 0x1FFF
WORD 0x15FF
WORD 0x03FE
WORD 0x07FF
WORD 0x14FF
WORD 0x04FE
WORD 0x07FF
WORD 0x12FF
WORD 0x04FC
WORD 0x02FE
WORD 0x07FF
WORD 0x11FF
WORD 0x01FC
WORD 0x02F8
WORD 0x02FC
WORD 0x02FE
WORD 0x07FF
WORD 0x10FF
WORD 0x01F9
WORD 0x03F8
WORD 0x02FC
WORD 0x01FE
WORD 0x08FF
WORD 0x0FFF
WORD 0x01F9
WORD 0x03F0
WORD 0x01F8
WORD 0x02FC
WORD 0x09FF
WORD 0x0EFF
WORD 0x01F7
WORD 0x03E0
WORD 0x01F0
WORD 0x01F8
WORD 0x01FC
WORD 0x01FE
WORD 0x09FF
WORD 0x0EFF
WORD 0x01C4
WORD 0x01C0
WORD 0x02E0
WORD 0x01F0
WORD 0x01F8
WORD 0x01FE
WORD 0x0AFF
WORD 0x0DFF
WORD 0x01CF
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FC
WORD 0x0BFF
WORD 0x0DFF
WORD 0x01CD
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FC
WORD 0x0BFF
WORD 0x0DFF
WORD 0x01CD
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FC
WORD 0x0BFF
WORD 0x0DFF
WORD 0x01CD
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FC
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01EF
WORD 0x018D
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FC
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01EF
WORD 0x0184
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01EF
WORD 0x0184
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01CF
WORD 0x0184
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x0186
WORD 0x0180
WORD 0x02C0
WORD 0x01E0
WORD 0x01FC
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x0186
WORD 0x02C0
WORD 0x02E0
WORD 0x01FC
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x0186
WORD 0x02C0
WORD 0x02E0
WORD 0x01FC
WORD 0x01FE
WORD 0x0BFF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01C7
WORD 0x0182
WORD 0x02C0
WORD 0x02E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x0182
WORD 0x0180
WORD 0x01C0
WORD 0x02E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x0182
WORD 0x0180
WORD 0x01C0
WORD 0x02E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x0182
WORD 0x0180
WORD 0x01C0
WORD 0x02E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x01C2
WORD 0x0180
WORD 0x01C0
WORD 0x02E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01C7
WORD 0x01C2
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C2
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C2
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F8
WORD 0x01FE
WORD 0x0BFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C2
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F8
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C2
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F8
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C2
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0380
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0380
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0380
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0380
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0380
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0380
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01E0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C6
WORD 0x0380
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01E6
WORD 0x01C6
WORD 0x0380
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x0CFF
WORD 0x01EE
WORD 0x01C4
WORD 0x0380
WORD 0x01C0
WORD 0x01F0
WORD 0x0CFF
WORD 0x06FF
WORD 0x02FE
WORD 0x04FF
WORD 0x01EE
WORD 0x01C4
WORD 0x01C0
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01FE
WORD 0x0BFF
WORD 0x06FF
WORD 0x02FE
WORD 0x04FF
WORD 0x01EE
WORD 0x01C4
WORD 0x01C0
WORD 0x0380
WORD 0x01E0
WORD 0x01FE
WORD 0x0BFF
WORD 0x06FF
WORD 0x02FE
WORD 0x04FF
WORD 0x01EE
WORD 0x0184
WORD 0x01C0
WORD 0x0380
WORD 0x01E0
WORD 0x01FC
WORD 0x0BFF
WORD 0x05FF
WORD 0x02FE
WORD 0x01FC
WORD 0x01FE
WORD 0x03FF
WORD 0x01AE
WORD 0x0184
WORD 0x01C0
WORD 0x0380
WORD 0x01A0
WORD 0x01FC
WORD 0x01FE
WORD 0x0AFF
WORD 0x05FF
WORD 0x01FE
WORD 0x02FC
WORD 0x01FE
WORD 0x03FF
WORD 0x019E
WORD 0x01C4
WORD 0x02C0
WORD 0x0380
WORD 0x01FC
WORD 0x01FE
WORD 0x0AFF
WORD 0x05FF
WORD 0x02FC
WORD 0x01F8
WORD 0x01FC
WORD 0x03FF
WORD 0x019C
WORD 0x0180
WORD 0x03C0
WORD 0x0280
WORD 0x019C
WORD 0x01FE
WORD 0x0AFF
WORD 0x05FF
WORD 0x01FC
WORD 0x03F8
WORD 0x03FF
WORD 0x019C
WORD 0x0280
WORD 0x03C0
WORD 0x0180
WORD 0x019C
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FD
WORD 0x01F8
WORD 0x01F0
WORD 0x01F8
WORD 0x03FF
WORD 0x01DC
WORD 0x0190
WORD 0x0180
WORD 0x04C0
WORD 0x019C
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FD
WORD 0x03F0
WORD 0x02FF
WORD 0x01FE
WORD 0x01FC
WORD 0x0190
WORD 0x0280
WORD 0x03C0
WORD 0x01DE
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F9
WORD 0x01F8
WORD 0x01F0
WORD 0x01F8
WORD 0x03FF
WORD 0x01FC
WORD 0x0190
WORD 0x0280
WORD 0x03C0
WORD 0x01C7
WORD 0x0BFF
WORD 0x06FF
WORD 0x01F8
WORD 0x02F0
WORD 0x02FF
WORD 0x01FE
WORD 0x01FC
WORD 0x0190
WORD 0x0280
WORD 0x03C0
WORD 0x01C7
WORD 0x0BFF
WORD 0x06FF
WORD 0x03F8
WORD 0x02FF
WORD 0x01FE
WORD 0x01FC
WORD 0x0190
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FD
WORD 0x01F0
WORD 0x01F8
WORD 0x01E8
WORD 0x02FF
WORD 0x01FE
WORD 0x01FC
WORD 0x0190
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FD
WORD 0x02F0
WORD 0x01F8
WORD 0x03FF
WORD 0x01FE
WORD 0x0190
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F9
WORD 0x01F8
WORD 0x01E0
WORD 0x01F0
WORD 0x01FD
WORD 0x02FF
WORD 0x01FE
WORD 0x01D0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FB
WORD 0x01F0
WORD 0x01F8
WORD 0x01F0
WORD 0x01FD
WORD 0x02FF
WORD 0x01FE
WORD 0x01D0
WORD 0x0280
WORD 0x03C0
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FB
WORD 0x03F0
WORD 0x03FF
WORD 0x01FE
WORD 0x01D0
WORD 0x0280
WORD 0x03C0
WORD 0x01C6
WORD 0x0BFF
WORD 0x06FF
WORD 0x01F0
WORD 0x02F8
WORD 0x03FF
WORD 0x01FC
WORD 0x01D0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FB
WORD 0x03F8
WORD 0x03FF
WORD 0x01FC
WORD 0x01D0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x06FF
WORD 0x01F8
WORD 0x02F0
WORD 0x01FE
WORD 0x02FF
WORD 0x01FC
WORD 0x01D0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FD
WORD 0x02F8
WORD 0x01F0
WORD 0x01FE
WORD 0x02FF
WORD 0x01FE
WORD 0x01D0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FD
WORD 0x01F0
WORD 0x02F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01FE
WORD 0x01F0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FD
WORD 0x03F8
WORD 0x01FD
WORD 0x02FF
WORD 0x01FE
WORD 0x01F0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FB
WORD 0x01F8
WORD 0x01F0
WORD 0x01F8
WORD 0x01F9
WORD 0x02FF
WORD 0x01FE
WORD 0x01D0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FE
WORD 0x01F8
WORD 0x01F0
WORD 0x01F8
WORD 0x01FB
WORD 0x02FF
WORD 0x01FE
WORD 0x01D0
WORD 0x0280
WORD 0x02C0
WORD 0x01C4
WORD 0x01C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01E0
WORD 0x01F0
WORD 0x03FF
WORD 0x01FE
WORD 0x01C0
WORD 0x0280
WORD 0x02C0
WORD 0x02C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F8
WORD 0x01F0
WORD 0x01E0
WORD 0x01F1
WORD 0x03FF
WORD 0x01FC
WORD 0x0380
WORD 0x02C0
WORD 0x02C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F8
WORD 0x01E0
WORD 0x01F0
WORD 0x01FD
WORD 0x03FF
WORD 0x01FC
WORD 0x0380
WORD 0x02C0
WORD 0x02C6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F0
WORD 0x02E0
WORD 0x01F9
WORD 0x01FD
WORD 0x02FF
WORD 0x01FC
WORD 0x0380
WORD 0x02C0
WORD 0x01C4
WORD 0x01D6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F9
WORD 0x02E0
WORD 0x01F8
WORD 0x03FF
WORD 0x01FC
WORD 0x0380
WORD 0x03C0
WORD 0x01D6
WORD 0x0BFF
WORD 0x05FF
WORD 0x01F9
WORD 0x01F8
WORD 0x01F0
WORD 0x01F8
WORD 0x03FF
WORD 0x01FC
WORD 0x0380
WORD 0x03C0
WORD 0x01D6
WORD 0x04FF
WORD 0x02FE
WORD 0x05FF
WORD 0x05FF
WORD 0x01FB
WORD 0x01F8
WORD 0x01E0
WORD 0x01F0
WORD 0x03FF
WORD 0x01DC
WORD 0x0380
WORD 0x03C0
WORD 0x019E
WORD 0x03FF
WORD 0x01FE
WORD 0x02FC
WORD 0x01FE
WORD 0x04FF
WORD 0x06FF
WORD 0x01F1
WORD 0x01E0
WORD 0x01C0
WORD 0x01F1
WORD 0x02FF
WORD 0x019C
WORD 0x0190
WORD 0x0180
WORD 0x04C0
WORD 0x019E
WORD 0x02FF
WORD 0x01FC
WORD 0x03F8
WORD 0x05FF
WORD 0x07FF
WORD 0x01F2
WORD 0x01F0
WORD 0x01C0
WORD 0x01E1
WORD 0x01FF
WORD 0x019C
WORD 0x0180
WORD 0x05C0
WORD 0x019E
WORD 0x01FF
WORD 0x01FD
WORD 0x03F0
WORD 0x06FF