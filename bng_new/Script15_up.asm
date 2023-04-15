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
WORD 0x0EFF
WORD 0x01E9
WORD 0x02E0
WORD 0x02E1
WORD 0x01F0
WORD 0x02F9
WORD 0x09FF
WORD 0x06FF
WORD 0x02FB
WORD 0x03FF
WORD 0x02FB
WORD 0x01E3
WORD 0x01C0
WORD 0x03E0
WORD 0x02F1
WORD 0x01F9
WORD 0x01FB
WORD 0x09FF
WORD 0x07FF
WORD 0x01FB
WORD 0x02FF
WORD 0x03FB
WORD 0x01E3
WORD 0x01E0
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x06FB
WORD 0x07FF
WORD 0x09FF
WORD 0x03F9
WORD 0x01F1
WORD 0x01E1
WORD 0x02C0
WORD 0x01E0
WORD 0x06FB
WORD 0x08FF
WORD 0x08FF
WORD 0x04F9
WORD 0x01F1
WORD 0x01C1
WORD 0x01C0
WORD 0x01E0
WORD 0x01E8
WORD 0x03F9
WORD 0x01FB
WORD 0x0AFF
WORD 0x08FF
WORD 0x02FD
WORD 0x02F9
WORD 0x01E1
WORD 0x01C0
WORD 0x02E0
WORD 0x01E9
WORD 0x01F8
WORD 0x04FE
WORD 0x09FF
WORD 0x09FF
WORD 0x01FE
WORD 0x01FC
WORD 0x01EC
WORD 0x03E0
WORD 0x01E1
WORD 0x01F9
WORD 0x02FA
WORD 0x03FE
WORD 0x09FF
WORD 0x0AFF
WORD 0x01FE
WORD 0x04E0
WORD 0x01E9
WORD 0x02FC
WORD 0x02FD
WORD 0x0BFF
WORD 0x0AFF
WORD 0x01FE
WORD 0x04E0
WORD 0x02FC
WORD 0x02FE
WORD 0x0CFF
WORD 0x0AFF
WORD 0x01FE
WORD 0x04E0
WORD 0x01E8
WORD 0x02FE
WORD 0x0DFF
WORD 0x0AFF
WORD 0x01FE
WORD 0x05E0
WORD 0x02FE
WORD 0x0DFF
WORD 0x0BFF
WORD 0x01F6
WORD 0x04E0
WORD 0x01EE
WORD 0x0EFF
WORD 0x0BFF
WORD 0x01F7
WORD 0x03E0
WORD 0x01C0
WORD 0x01E8
WORD 0x01FE
WORD 0x0DFF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01E2
WORD 0x02E0
WORD 0x01C0
WORD 0x01E0
WORD 0x01EE
WORD 0x0DFF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01E2
WORD 0x02E0
WORD 0x02C0
WORD 0x01E8
WORD 0x01FE
WORD 0x0CFF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01E3
WORD 0x03E0
WORD 0x01C0
WORD 0x01E0
WORD 0x01E8
WORD 0x0CFF
WORD 0x0BFF
WORD 0x01D7
WORD 0x01E3
WORD 0x04E0
WORD 0x01C0
WORD 0x01E0
WORD 0x01EE
WORD 0x01EF
WORD 0x0AFF
WORD 0x0BFF
WORD 0x01D7
WORD 0x01C3
WORD 0x04E0
WORD 0x02C0
WORD 0x0180
WORD 0x02EF
WORD 0x09FF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01C3
WORD 0x05E0
WORD 0x02C0
WORD 0x01CF
WORD 0x02EF
WORD 0x08FF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01C7
WORD 0x01C0
WORD 0x05E0
WORD 0x01C0
WORD 0x01C4
WORD 0x01A7
WORD 0x09FF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01C7
WORD 0x01C0
WORD 0x06E0
WORD 0x01C0
WORD 0x01C7
WORD 0x09FF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01E7
WORD 0x01C3
WORD 0x06E0
WORD 0x01C0
WORD 0x01C7
WORD 0x09FF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C3
WORD 0x07E0
WORD 0x01C7
WORD 0x09FF
WORD 0x0CFF
WORD 0x01E7
WORD 0x01C7
WORD 0x07E0
WORD 0x01C6
WORD 0x01F7
WORD 0x08FF
WORD 0x0CFF
WORD 0x01F7
WORD 0x01C7
WORD 0x07E0
WORD 0x01C4
WORD 0x01E7
WORD 0x08FF
WORD 0x0CFF
WORD 0x01F7
WORD 0x01C7
WORD 0x01C0
WORD 0x06E0
WORD 0x01C4
WORD 0x01E7
WORD 0x01F7
WORD 0x07FF
WORD 0x0CFF
WORD 0x01F7
WORD 0x0187
WORD 0x01C0
WORD 0x06E0
WORD 0x01C6
WORD 0x01C7
WORD 0x01F7
WORD 0x07FF
WORD 0x0CFF
WORD 0x01F7
WORD 0x01C7
WORD 0x02C0
WORD 0x05E0
WORD 0x01C3
WORD 0x01C7
WORD 0x01F7
WORD 0x07FF
WORD 0x0BFF
WORD 0x01F7
WORD 0x01D7
WORD 0x01C7
WORD 0x0180
WORD 0x01C0
WORD 0x05E0
WORD 0x01E3
WORD 0x01C7
WORD 0x01F7
WORD 0x07FF
WORD 0x0CFF
WORD 0x01DF
WORD 0x01C6
WORD 0x0180
WORD 0x02C0
WORD 0x04E0
WORD 0x01E3
WORD 0x01C7
WORD 0x01F7
WORD 0x07FF
WORD 0x07FF
WORD 0x04FE
WORD 0x01EE
WORD 0x01CE
WORD 0x02C0
WORD 0x0180
WORD 0x01C0
WORD 0x03E0
WORD 0x02E3
WORD 0x01F3
WORD 0x08FF
WORD 0x05FF
WORD 0x01FE
WORD 0x01FC
WORD 0x01F8
WORD 0x01F9
WORD 0x01FC
WORD 0x01EC
WORD 0x01E8
WORD 0x02C0
WORD 0x0180
WORD 0x01C0
WORD 0x03E0
WORD 0x03E3
WORD 0x09FF
WORD 0x01FF
WORD 0x01FD
WORD 0x03F8
WORD 0x02FB
WORD 0x01FE
WORD 0x02FC
WORD 0x01F0
WORD 0x01C2
WORD 0x03C0
WORD 0x02E0
WORD 0x01C0
WORD 0x01E0
WORD 0x01C7
WORD 0x01E7
WORD 0x01F7
WORD 0x09FF
WORD 0x01FD
WORD 0x02F8
WORD 0x01FC
WORD 0x03FF
WORD 0x02FE
WORD 0x01FC
WORD 0x01F1
WORD 0x02E1
WORD 0x03E0
WORD 0x03C0
WORD 0x01C7
WORD 0x01E7
WORD 0x01EF
WORD 0x09FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x01FE
WORD 0x06FF
WORD 0x01F6
WORD 0x01E0
WORD 0x01E1
WORD 0x03E0
WORD 0x03C0
WORD 0x01F4
WORD 0x01EF
WORD 0x0AFF
WORD 0x02FC
WORD 0x01FE
WORD 0x07FF
WORD 0x01F7
WORD 0x01E3
WORD 0x04E0
WORD 0x03C0
WORD 0x01F4
WORD 0x02EF
WORD 0x09FF
WORD 0x01FC
WORD 0x02FE
WORD 0x07FF
WORD 0x01F7
WORD 0x01C3
WORD 0x01E1
WORD 0x03E0
WORD 0x03C0
WORD 0x01E4
WORD 0x02EF
WORD 0x09FF
WORD 0x01FC
WORD 0x01FE
WORD 0x08FF
WORD 0x01F7
WORD 0x01D3
WORD 0x01E1
WORD 0x03E0
WORD 0x03C0
WORD 0x01E4
WORD 0x02EF
WORD 0x09FF
WORD 0x01FC
WORD 0x01FE
WORD 0x09FF
WORD 0x01D3
WORD 0x04E0
WORD 0x03C0
WORD 0x01E4
WORD 0x02EF
WORD 0x09FF
WORD 0x01FC
WORD 0x01FE
WORD 0x09FF
WORD 0x01C3
WORD 0x05E0
WORD 0x02C0
WORD 0x01E4
WORD 0x02EF
WORD 0x09FF
WORD 0x01FC
WORD 0x01FE
WORD 0x01F7
WORD 0x01C7
WORD 0x01E0
WORD 0x01C0
WORD 0x01E0
WORD 0x0BC0
WORD 0x01ED
WORD 0x01EF
WORD 0x0BFF
WORD 0x02C0
WORD 0x0180
WORD 0x03C0
WORD 0x01E0
WORD 0x01E7
WORD 0x01EF
WORD 0x16FF
WORD 0x1FFF
WORD 0x1FFF
WORD 0x1AFF
WORD 0x01FB
WORD 0x01E3
WORD 0x01E1
WORD 0x02C0
WORD 0x0CFF
WORD 0x01FB
WORD 0x01E3
WORD 0x01E0
WORD 0x0FC0
WORD 0x01FB
WORD 0x0AFF
WORD 0x01FB
WORD 0x01E3
WORD 0x07C0
WORD 0x01E0
WORD 0x01EB
WORD 0x0AFF
WORD 0x0AFF
WORD 0x01FB
WORD 0x01E3
WORD 0x01E0
WORD 0x06C0
WORD 0x01E0
WORD 0x01EB
WORD 0x0AFF
WORD 0x0AFF
WORD 0x01FB
WORD 0x01E3
WORD 0x01E0
WORD 0x06C0
WORD 0x01E0
WORD 0x01EB
WORD 0x0AFF
WORD 0x0BFF
WORD 0x01EB
WORD 0x01E0
WORD 0x06C0
WORD 0x01E0
WORD 0x01EB
WORD 0x0AFF
WORD 0x0BFF
WORD 0x01F3
WORD 0x01E0
WORD 0x06C0
WORD 0x01E0
WORD 0x01EB
WORD 0x0AFF
WORD 0x0BFF
WORD 0x01F3
WORD 0x01E0
WORD 0x06C0
WORD 0x01E0
WORD 0x01E3
WORD 0x0AFF
WORD 0x0BFF
WORD 0x01F3
WORD 0x01E0
WORD 0x06C0
WORD 0x01E0
WORD 0x01F3
WORD 0x0AFF
WORD 0x03FF
WORD 0x01F3
WORD 0x01E0
WORD 0x0CC0
WORD 0x02E0
WORD 0x01FB
WORD 0x0BFF
WORD 0x06C0
WORD 0x02E0
WORD 0x17FF
WORD 0x1FFF
WORD 0x1FFF
WORD 0x18FF
WORD 0x02EB
WORD 0x01C3
WORD 0x01E3
WORD 0x03E0
WORD 0x0AFF
WORD 0x01FB
WORD 0x01F3
WORD 0x01E3
WORD 0x0DE0
WORD 0x01C0
WORD 0x01E0
WORD 0x02E3
WORD 0x01F7
WORD 0x08FF
WORD 0x01FB
WORD 0x02E3
WORD 0x08E0
WORD 0x01E3
WORD 0x01F3
WORD 0x01F7
WORD 0x09FF
WORD 0x08FF
WORD 0x01FB
WORD 0x01F3
WORD 0x01E3
WORD 0x08E0
WORD 0x01E7
WORD 0x01F7
WORD 0x0AFF
WORD 0x08FF
WORD 0x01FB
WORD 0x02E3
WORD 0x08E0
WORD 0x01E7
WORD 0x01F7
WORD 0x0AFF
WORD 0x08FF
WORD 0x01FB
WORD 0x02E3
WORD 0x08E0
WORD 0x01C7
WORD 0x02F7
WORD 0x09FF
WORD 0x08FF
WORD 0x01FB
WORD 0x02E3
WORD 0x08E0
WORD 0x01C7
WORD 0x02F7
WORD 0x09FF
WORD 0x08FF
WORD 0x01EB
WORD 0x02E3
WORD 0x08E0
WORD 0x01C7
WORD 0x02F7
WORD 0x09FF
WORD 0x08FF
WORD 0x01EB
WORD 0x01C3
WORD 0x01E3
WORD 0x07E0
WORD 0x01C0
WORD 0x01E7
WORD 0x01F7
WORD 0x0AFF
WORD 0x07FF
WORD 0x01EB
WORD 0x02C3
WORD 0x08E0
WORD 0x01C7
WORD 0x02F7
WORD 0x0AFF
WORD 0x04FF
WORD 0x01EF
WORD 0x01E3
WORD 0x01C3
WORD 0x01C0
WORD 0x07E0
WORD 0x01C0
WORD 0x01C3
WORD 0x01E3
WORD 0x01F7
WORD 0x0CFF
WORD 0x01E7
WORD 0x01E3
WORD 0x0183
WORD 0x03C0
WORD 0x04E0
WORD 0x02C0
WORD 0x01E0
WORD 0x01E3
WORD 0x01F3
WORD 0x01F7
WORD 0x0FFF
WORD 0x0180
WORD 0x05C0
WORD 0x01E0
WORD 0x03C0
WORD 0x01E3
WORD 0x01EF
WORD 0x13FF
WORD 0x0180
WORD 0x07C0
WORD 0x01E0
WORD 0x01E7
WORD 0x01F7
WORD 0x14FF
WORD 0x0780
WORD 0x01C0
WORD 0x01C1
WORD 0x01E7
WORD 0x01F7
WORD 0x12FF
WORD 0x02EF
WORD 0x0600
WORD 0x0180
WORD 0x01C0
WORD 0x01C1
WORD 0x01C7
WORD 0x02F7
WORD 0x09FF
WORD 0x01EF
WORD 0x01E7
WORD 0x01E3
WORD 0x01C3
WORD 0x0183
WORD 0x0301
WORD 0x0200
WORD 0x0600
WORD 0x0180
WORD 0x0181
WORD 0x01C1
WORD 0x01C3
WORD 0x02EF
WORD 0x07FF
WORD 0x01EF
WORD 0x01C7
WORD 0x0183
WORD 0x0203
WORD 0x0201
WORD 0x0500
WORD 0x0700
WORD 0x0181
WORD 0x01C1
WORD 0x01E3
WORD 0x03EF
WORD 0x05FF
WORD 0x01EF
WORD 0x01C3
WORD 0x01C7
WORD 0x01A3
WORD 0x0103
WORD 0x0281
WORD 0x0600
WORD 0x0700
WORD 0x0181
WORD 0x01C1
WORD 0x01C3
WORD 0x03EF
WORD 0x06FF
WORD 0x01E7
WORD 0x01C7
WORD 0x01A3
WORD 0x0103
WORD 0x0181
WORD 0x0101
WORD 0x0600
WORD 0x0700
WORD 0x0181
WORD 0x01C3
WORD 0x01E7
WORD 0x03EF
WORD 0x06FF
WORD 0x01E7
WORD 0x01C7
WORD 0x01A3
WORD 0x0143
WORD 0x0181
WORD 0x0101
WORD 0x0600
WORD 0x0700
WORD 0x0181
WORD 0x01C1
WORD 0x01E7
WORD 0x03EF
WORD 0x06FF
WORD 0x01E7
WORD 0x01C7
WORD 0x01A3
WORD 0x0143
WORD 0x0183
WORD 0x0201
WORD 0x0500
WORD 0x0600
WORD 0x0180
WORD 0x0181
WORD 0x01C3
WORD 0x01E7
WORD 0x02EF
WORD 0x07FF
WORD 0x01E7
WORD 0x01C7
WORD 0x01A7
WORD 0x0103
WORD 0x0183
WORD 0x0101
WORD 0x0600
WORD 0x0600
WORD 0x0180
WORD 0x0181
WORD 0x01C3
WORD 0x01E7
WORD 0x02EF
WORD 0x07FF
WORD 0x01EF
WORD 0x01C7
WORD 0x0187
WORD 0x0103
WORD 0x0201
WORD 0x0600
WORD 0x0600
WORD 0x0180
WORD 0x0181
WORD 0x01C3
WORD 0x01E7
WORD 0x01EF
WORD 0x09FF
WORD 0x01C7
WORD 0x0187
WORD 0x0103
WORD 0x0201
WORD 0x0600
WORD 0x0600
WORD 0x0180
WORD 0x01C1
WORD 0x01C3
WORD 0x01EF
WORD 0x0AFF
WORD 0x01C7
WORD 0x0187
WORD 0x0103
WORD 0x0101
WORD 0x0700
WORD 0x0600
WORD 0x0180
WORD 0x01C1
WORD 0x01C3
WORD 0x01EF
WORD 0x0AFF
WORD 0x01C7
WORD 0x0187
WORD 0x0103
WORD 0x0101
WORD 0x0700
WORD 0x0600
WORD 0x0180
WORD 0x01C0
WORD 0x01E3
WORD 0x0BFF
WORD 0x01C7
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0700
WORD 0x0600
WORD 0x01C0
WORD 0x01E0
WORD 0x01FB
WORD 0x0BFF
WORD 0x010F
WORD 0x0107
WORD 0x0101
WORD 0x0800
WORD 0x0600
WORD 0x0140
WORD 0x01F8
WORD 0x0CFF
WORD 0x010F
WORD 0x0107
WORD 0x0101
WORD 0x0800
WORD 0x0600
WORD 0x0110
WORD 0x01F8
WORD 0x0BFF
WORD 0x013F
WORD 0x010F
WORD 0x0107
WORD 0x0900
WORD 0x0600
WORD 0x0108
WORD 0x0178
WORD 0x01FC
WORD 0x09FF
WORD 0x013F
WORD 0x011F
WORD 0x010F
WORD 0x0107
WORD 0x0900
WORD 0x0600
WORD 0x0108
WORD 0x0178
WORD 0x01FC
WORD 0x09FF
WORD 0x017F
WORD 0x011F
WORD 0x010F
WORD 0x0107
WORD 0x0900
WORD 0x0600
WORD 0x011C
WORD 0x0158
WORD 0x0BFF
WORD 0x013F
WORD 0x011F
WORD 0x010F
WORD 0x0900
WORD 0x0100
WORD 0x0180
WORD 0x0400
WORD 0x010C
WORD 0x013C
WORD 0x017F
WORD 0x0AFF
WORD 0x013F
WORD 0x011F
WORD 0x010F
WORD 0x0900
WORD 0x02E0
WORD 0x0400
WORD 0x0116
WORD 0x013C
WORD 0x0AFF
WORD 0x017F
WORD 0x013F
WORD 0x011F
WORD 0x010F
WORD 0x0101
WORD 0x0800
WORD 0x01F8
WORD 0x0280
WORD 0x0100
WORD 0x01C0
WORD 0x0180
WORD 0x0181
WORD 0x01BF
WORD 0x08FF
WORD 0x017F
WORD 0x023F
WORD 0x021F
WORD 0x010F
WORD 0x0900
WORD 0x01FE
WORD 0x01F3
WORD 0x01F0
WORD 0x01C0
WORD 0x03E0
WORD 0x01EF
WORD 0x05FF
WORD 0x027F
WORD 0x023F
WORD 0x031F
WORD 0x010F
WORD 0x0103
WORD 0x0900
WORD 0x02FF
WORD 0x01FC
WORD 0x05F8
WORD 0x01FF
WORD 0x037F
WORD 0x013F
WORD 0x031F
WORD 0x040F
WORD 0x0107
WORD 0x0103
WORD 0x0900
WORD 0x011F
WORD 0x013F
WORD 0x02FF
WORD 0x02FE
WORD 0x01EE
WORD 0x02FE
WORD 0x011F
WORD 0x013F
WORD 0x011F
WORD 0x040F
WORD 0x0407
WORD 0x0103
WORD 0x0101
WORD 0x0900
WORD 0x0103
WORD 0x01C7
WORD 0x01EF
WORD 0x05FF
WORD 0x0177
WORD 0x030F
WORD 0x0807
WORD 0x0103
WORD 0x0201
WORD 0x0800
WORD 0x0103
WORD 0x0121
WORD 0x0171
WORD 0x02FB
WORD 0x02FF
WORD 0x017D
WORD 0x013D
WORD 0x010B
WORD 0x0407
WORD 0x0803
WORD 0x0101
WORD 0x0800
WORD 0x0103
WORD 0x0101
WORD 0x0110
WORD 0x0138
WORD 0x027D
WORD 0x027F
WORD 0x013F
WORD 0x011D
WORD 0x0105
WORD 0x0103
WORD 0x0107
WORD 0x0903
WORD 0x0201
WORD 0x0700
WORD 0x0201
WORD 0x0100
WORD 0x0118
WORD 0x0138
WORD 0x017C
WORD 0x017F
WORD 0x023F
WORD 0x021E
WORD 0x0101
WORD 0x0A03
WORD 0x0201
WORD 0x0700
WORD 0x0100
WORD 0x0201
WORD 0x0100
WORD 0x0118
WORD 0x013C
WORD 0x017E
WORD 0x017F
WORD 0x023F
WORD 0x011E
WORD 0x010E
WORD 0x0101
WORD 0x0403
WORD 0x0801
WORD 0x0600
WORD 0x0101
WORD 0x0100
WORD 0x0101
WORD 0x0200
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x023F
WORD 0x011E
WORD 0x010E
WORD 0x0101
WORD 0x0303
WORD 0x0801
WORD 0x0600
WORD 0x0201
WORD 0x0100
WORD 0x0201
WORD 0x0100
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0105
WORD 0x0203
WORD 0x0801
WORD 0x0600
WORD 0x0301
WORD 0x0100
WORD 0x0101
WORD 0x0200
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x033F
WORD 0x011E
WORD 0x0107
WORD 0x0101
WORD 0x0203
WORD 0x0601
WORD 0x0600
WORD 0x0100
WORD 0x0301
WORD 0x0400
WORD 0x0118
WORD 0x011C
WORD 0x027E
WORD 0x017F
WORD 0x023F
WORD 0x011F
WORD 0x0106
WORD 0x0101
WORD 0x0203
WORD 0x0201
WORD 0x0900
WORD 0x0300
WORD 0x0201
WORD 0x0500
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0100
WORD 0x0101
WORD 0x0103
WORD 0x0201
WORD 0x0800
WORD 0x0500
WORD 0x0101
WORD 0x0500
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x033F
WORD 0x011E
WORD 0x0106
WORD 0x0101
WORD 0x0103
WORD 0x0201
WORD 0x0700
WORD 0x0600
WORD 0x0101
WORD 0x0500
WORD 0x0118
WORD 0x011C
WORD 0x027E
WORD 0x017F
WORD 0x023F
WORD 0x011E
WORD 0x0106
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0600
WORD 0x0700
WORD 0x0101
WORD 0x0500
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x017F
WORD 0x023F
WORD 0x011E
WORD 0x0106
WORD 0x0201
WORD 0x0103
WORD 0x0101
WORD 0x0500
WORD 0x0800
WORD 0x0101
WORD 0x0500
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x033F
WORD 0x011E
WORD 0x0106
WORD 0x0101
WORD 0x0203
WORD 0x0201
WORD 0x0300
WORD 0x0900
WORD 0x0101
WORD 0x0500
WORD 0x0118
WORD 0x017C
WORD 0x027E
WORD 0x033F
WORD 0x011E
WORD 0x0104
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0300
WORD 0x0900
WORD 0x0201
WORD 0x0400
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x017F
WORD 0x023F
WORD 0x011E
WORD 0x0106
WORD 0x0201
WORD 0x0103
WORD 0x0201
WORD 0x0200
WORD 0x0A00
WORD 0x0101
WORD 0x0400
WORD 0x0108
WORD 0x013C
WORD 0x017C
WORD 0x027E
WORD 0x023F
WORD 0x011E
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0900
WORD 0x0201
WORD 0x0400
WORD 0x0108
WORD 0x013C
WORD 0x017C
WORD 0x027E
WORD 0x023F
WORD 0x011E
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0900
WORD 0x0201
WORD 0x0400
WORD 0x0118
WORD 0x011C
WORD 0x017C
WORD 0x027E
WORD 0x023F
WORD 0x011E
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0A00
WORD 0x0101
WORD 0x0400
WORD 0x0118
WORD 0x011C
WORD 0x017C
WORD 0x027E
WORD 0x023F
WORD 0x011E
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0A00
WORD 0x0101
WORD 0x0400
WORD 0x0218
WORD 0x017C
WORD 0x027E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0A00
WORD 0x0101
WORD 0x0400
WORD 0x0118
WORD 0x011C
WORD 0x017C
WORD 0x017E
WORD 0x013E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0A00
WORD 0x0101
WORD 0x0400
WORD 0x0118
WORD 0x013C
WORD 0x017C
WORD 0x017E
WORD 0x013E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0A00
WORD 0x0101
WORD 0x0400
WORD 0x0118
WORD 0x017C
WORD 0x027E
WORD 0x013E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0A00
WORD 0x0101
WORD 0x0400
WORD 0x0118
WORD 0x017C
WORD 0x027E
WORD 0x013E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0F00
WORD 0x0118
WORD 0x017C
WORD 0x027E
WORD 0x013E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0F00
WORD 0x0118
WORD 0x017C
WORD 0x027E
WORD 0x013E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0F00
WORD 0x0118
WORD 0x011C
WORD 0x017C
WORD 0x027E
WORD 0x023F
WORD 0x011F
WORD 0x010E
WORD 0x0201
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1000
WORD 0x011C
WORD 0x017C
WORD 0x027E
WORD 0x023F
WORD 0x011E
WORD 0x010E
WORD 0x0100
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1000
WORD 0x0118
WORD 0x017C
WORD 0x027E
WORD 0x017F
WORD 0x013F
WORD 0x013E
WORD 0x011E
WORD 0x0100
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1000
WORD 0x0118
WORD 0x013C
WORD 0x027E
WORD 0x017F
WORD 0x013F
WORD 0x013E
WORD 0x011E
WORD 0x0104
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1000
WORD 0x0110
WORD 0x0138
WORD 0x013E
WORD 0x017E
WORD 0x027F
WORD 0x013F
WORD 0x011F
WORD 0x010E
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1100
WORD 0x0118
WORD 0x013C
WORD 0x017E
WORD 0x027F
WORD 0x023F
WORD 0x011F
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1100
WORD 0x0110
WORD 0x013C
WORD 0x013E
WORD 0x037F
WORD 0x013F
WORD 0x011F
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1100
WORD 0x0110
WORD 0x013C
WORD 0x013E
WORD 0x047F
WORD 0x011F
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1200
WORD 0x013C
WORD 0x013E
WORD 0x013F
WORD 0x037F
WORD 0x013F
WORD 0x010B
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1200
WORD 0x013C
WORD 0x013E
WORD 0x013F
WORD 0x037F
WORD 0x013F
WORD 0x011F
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1200
WORD 0x023C
WORD 0x013F
WORD 0x037F
WORD 0x013F
WORD 0x011F
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1200
WORD 0x023C
WORD 0x013F
WORD 0x037F
WORD 0x013F
WORD 0x010D
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1200
WORD 0x023C
WORD 0x013F
WORD 0x037F
WORD 0x013F
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x1200
WORD 0x013C
WORD 0x023F
WORD 0x037F
WORD 0x013F
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0D00
WORD 0x0101
WORD 0x0300
WORD 0x0110
WORD 0x013E
WORD 0x023F
WORD 0x037F
WORD 0x011F
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0200
WORD 0x0D00
WORD 0x0101
WORD 0x0300
WORD 0x0110
WORD 0x013E
WORD 0x023F
WORD 0x037F
WORD 0x011F
WORD 0x0303
WORD 0x0101
WORD 0x0200
WORD 0x0C00
WORD 0x0201
WORD 0x0300
WORD 0x0110
WORD 0x013E
WORD 0x023F
WORD 0x037F
WORD 0x011F
WORD 0x0303
WORD 0x0101
WORD 0x0200
WORD 0x0C00
WORD 0x0301
WORD 0x0300
WORD 0x013C
WORD 0x013E
WORD 0x047F
WORD 0x013F
WORD 0x0303
WORD 0x0101
WORD 0x0200
WORD 0x0C00
WORD 0x0203
WORD 0x0101
WORD 0x0300
WORD 0x013C
WORD 0x013E
WORD 0x057F
WORD 0x011F
WORD 0x0101
WORD 0x0103
WORD 0x0201
WORD 0x0100
WORD 0x0C00
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0300
WORD 0x0130
WORD 0x013E
WORD 0x027F
WORD 0x02FF
WORD 0x017F
WORD 0x013F
WORD 0x011F
WORD 0x0203
WORD 0x0101
WORD 0x0100
WORD 0x0C00
WORD 0x0102
WORD 0x0203
WORD 0x0300
WORD 0x0110
WORD 0x013C
WORD 0x017E
WORD 0x027F
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x0203
WORD 0x0101
WORD 0x0C00
WORD 0x0106
WORD 0x0107
WORD 0x0103
WORD 0x0400
WORD 0x0134
WORD 0x027E
WORD 0x017F
WORD 0x04FF
WORD 0x013F
WORD 0x011F
WORD 0x0203
WORD 0x0C00
WORD 0x0104
WORD 0x0106
WORD 0x0107
WORD 0x0103
WORD 0x0300
WORD 0x0110
WORD 0x013C
WORD 0x027E
WORD 0x017F
WORD 0x04FF
WORD 0x017F
WORD 0x013F
WORD 0x010F
WORD 0x0D00
WORD 0x0106
WORD 0x0107
WORD 0x0103
WORD 0x0400
WORD 0x0130
WORD 0x017E
WORD 0x027F
WORD 0x05FF
WORD 0x027F
WORD 0x0E00
WORD 0x0207
WORD 0x0103
WORD 0x0400
WORD 0x0138
WORD 0x017E
WORD 0x027F
WORD 0x06FF
WORD 0x0F00
WORD 0x0303
WORD 0x0400
WORD 0x013C
WORD 0x017C
WORD 0x027F
WORD 0x05FF
WORD 0x0F00
WORD 0x0401
WORD 0x0400
WORD 0x011C
WORD 0x013E
WORD 0x017E
WORD 0x05FF