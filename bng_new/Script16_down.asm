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
WORD 0x0F00
WORD 0x013F
WORD 0x02FF
WORD 0x01F3
WORD 0x01E0
WORD 0x0160
WORD 0x0100
WORD 0x0201
WORD 0x0303
WORD 0x0183
WORD 0x01C7
WORD 0x02E7
WORD 0x0F00
WORD 0x0104
WORD 0x015F
WORD 0x027F
WORD 0x01FB
WORD 0x01F0
WORD 0x0170
WORD 0x0108
WORD 0x0300
WORD 0x0101
WORD 0x0181
WORD 0x02C1
WORD 0x01E1
WORD 0x0E00
WORD 0x01F8
WORD 0x01FE
WORD 0x02FF
WORD 0x01F7
WORD 0x0163
WORD 0x0140
WORD 0x0700
WORD 0x01C0
WORD 0x01E1
WORD 0x01E0
WORD 0x0C00
WORD 0x0190
WORD 0x0278
WORD 0x027C
WORD 0x013E
WORD 0x017F
WORD 0x010F
WORD 0x0103
WORD 0x0101
WORD 0x0800
WORD 0x01E0
WORD 0x0E00
WORD 0x010C
WORD 0x012E
WORD 0x021E
WORD 0x020F
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0800
WORD 0x1000
WORD 0x0110
WORD 0x010B
WORD 0x010F
WORD 0x0207
WORD 0x0103
WORD 0x0107
WORD 0x0101
WORD 0x0700
WORD 0x1300
WORD 0x0104
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0200
WORD 0x0101
WORD 0x0500
WORD 0x1F00
WORD 0x1F00
WORD 0x1F00
WORD 0x1F00
WORD 0x0C00
WORD 0x0180
WORD 0x0100
WORD 0x0180
WORD 0x1000
WORD 0x1200
WORD 0x0180
WORD 0x0C00
WORD 0x1200
WORD 0x01E0
WORD 0x0C00
WORD 0x0E00
WORD 0x0140
WORD 0x0200
WORD 0x0220
WORD 0x0130
WORD 0x0110
WORD 0x0108
WORD 0x0900
WORD 0x0E00
WORD 0x0120
WORD 0x0100
WORD 0x0208
WORD 0x0118
WORD 0x0108
WORD 0x0100
WORD 0x0308
WORD 0x0700
WORD 0x0E00
WORD 0x0301
WORD 0x0203
WORD 0x0106
WORD 0x0104
WORD 0x010C
WORD 0x0108
WORD 0x0118
WORD 0x0210
WORD 0x0120
WORD 0x0100
WORD 0x0140
WORD 0x0200
WORD 0x1400
WORD 0x0101
WORD 0x0103
WORD 0x0107
WORD 0x011F
WORD 0x017F
WORD 0x0160
WORD 0x0180
WORD 0x0400
WORD 0x1600
WORD 0x0180
WORD 0x0160
WORD 0x01FF
WORD 0x010F
WORD 0x0103
WORD 0x0101
WORD 0x0300
WORD 0x1200
WORD 0x0140
WORD 0x01C0
WORD 0x0260
WORD 0x0130
WORD 0x0110
WORD 0x0118
WORD 0x0108
WORD 0x010C
WORD 0x0106
WORD 0x0107
WORD 0x0203
WORD 0x0F00
WORD 0x0280
WORD 0x01C0
WORD 0x0140
WORD 0x0260
WORD 0x0230
WORD 0x0218
WORD 0x020C
WORD 0x010E
WORD 0x0106
WORD 0x0207
WORD 0x1000
WORD 0x0180
WORD 0x02C0
WORD 0x0160
WORD 0x0170
WORD 0x0130
WORD 0x0238
WORD 0x011C
WORD 0x010C
WORD 0x010E
WORD 0x020F
WORD 0x0207
WORD 0x1000
WORD 0x0180
WORD 0x01C0
WORD 0x02E0
WORD 0x0170
WORD 0x0178
WORD 0x0138
WORD 0x013C
WORD 0x011E
WORD 0x011F
WORD 0x050F
WORD 0x1000
WORD 0x0180
WORD 0x01C0
WORD 0x02E0
WORD 0x0170
WORD 0x0178
WORD 0x017C
WORD 0x013C
WORD 0x021F
WORD 0x050F
WORD 0x1000
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x02F0
WORD 0x0178
WORD 0x013E
WORD 0x073F
WORD 0x1000
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F8
WORD 0x017C
WORD 0x017E
WORD 0x077F
WORD 0x1000
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x0AFF
WORD 0x1100
WORD 0x01C0
WORD 0x01E0
WORD 0x0CFF
WORD 0x1000
WORD 0x0180
WORD 0x0CFF
WORD 0x01A0
WORD 0x0100
WORD 0x0E00
WORD 0x0107
WORD 0x0AFF
WORD 0x01FB
WORD 0x0500
WORD 0x0E00
WORD 0x08FF
WORD 0x01CF
WORD 0x0101
WORD 0x0700
WORD 0x0A00
WORD 0x0301
WORD 0x013F
WORD 0x07FF
WORD 0x011F
WORD 0x0101
WORD 0x0800
WORD 0x0600
WORD 0x0201
WORD 0x0507
WORD 0x017F
WORD 0x05FF
WORD 0x01FC
WORD 0x011E
WORD 0x0107
WORD 0x0900
WORD 0x0500
WORD 0x0203
WORD 0x0107
WORD 0x010F
WORD 0x031F
WORD 0x010E
WORD 0x027F
WORD 0x03FF
WORD 0x01FD
WORD 0x01BD
WORD 0x010F
WORD 0x0A00
WORD 0x0500
WORD 0x0207
WORD 0x010F
WORD 0x021F
WORD 0x013F
WORD 0x011C
WORD 0x0104
WORD 0x013F
WORD 0x04FF
WORD 0x01F9
WORD 0x010F
WORD 0x0102
WORD 0x0A00
WORD 0x0500
WORD 0x0106
WORD 0x010F
WORD 0x011F
WORD 0x023F
WORD 0x013E
WORD 0x013C
WORD 0x010D
WORD 0x013F
WORD 0x05FF
WORD 0x018F
WORD 0x0102
WORD 0x0A00
WORD 0x0400
WORD 0x0104
WORD 0x010E
WORD 0x010F
WORD 0x011F
WORD 0x013F
WORD 0x013E
WORD 0x023C
WORD 0x0109
WORD 0x017F
WORD 0x04FF
WORD 0x01FB
WORD 0x01FF
WORD 0x013E
WORD 0x0104
WORD 0x0900
WORD 0x0400
WORD 0x010C
WORD 0x021E
WORD 0x013E
WORD 0x017E
WORD 0x017C
WORD 0x0178
WORD 0x0168
WORD 0x0119
WORD 0x04FF
WORD 0x01FB
WORD 0x01CF
WORD 0x01E7
WORD 0x0138
WORD 0x010E
WORD 0x0106
WORD 0x0800
WORD 0x0400
WORD 0x011C
WORD 0x023C
WORD 0x017C
WORD 0x01FC
WORD 0x02F8
WORD 0x0168
WORD 0x01B9
WORD 0x04FF
WORD 0x01DB
WORD 0x01EF
WORD 0x0167
WORD 0x0138
WORD 0x011C
WORD 0x010E
WORD 0x0106
WORD 0x0700
WORD 0x0300
WORD 0x0110
WORD 0x0138
WORD 0x023C
WORD 0x017C
WORD 0x04F8
WORD 0x01F9
WORD 0x04FF
WORD 0x01FB
WORD 0x017F
WORD 0x013F
WORD 0x011C
WORD 0x010E
WORD 0x0106
WORD 0x0800
WORD 0x0300
WORD 0x0130
WORD 0x0378
WORD 0x04F8
WORD 0x01E8
WORD 0x01F9
WORD 0x017F
WORD 0x04FF
WORD 0x011F
WORD 0x010F
WORD 0x0106
WORD 0x0A00
WORD 0x0200
WORD 0x0270
WORD 0x02F8
WORD 0x03F0
WORD 0x01F8
WORD 0x01F9
WORD 0x01F8
WORD 0x01F9
WORD 0x04FF
WORD 0x011F
WORD 0x010B
WORD 0x010F
WORD 0x0B00
WORD 0x0200
WORD 0x02E0
WORD 0x03F0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F8
WORD 0x01D8
WORD 0x01F8
WORD 0x01FB
WORD 0x04FF
WORD 0x011B
WORD 0x0119
WORD 0x010F
WORD 0x0106
WORD 0x0A00
WORD 0x0200
WORD 0x02C0
WORD 0x04E0
WORD 0x01E6
WORD 0x01F0
WORD 0x0198
WORD 0x01BB
WORD 0x05FF
WORD 0x0133
WORD 0x0119
WORD 0x020F
WORD 0x0A00
WORD 0x0300
WORD 0x0180
WORD 0x04C0
WORD 0x01C2
WORD 0x01F0
WORD 0x0190
WORD 0x019B
WORD 0x013E
WORD 0x04FF
WORD 0x01F3
WORD 0x0111
WORD 0x011B
WORD 0x010F
WORD 0x0104
WORD 0x0900
WORD 0x0400
WORD 0x0480
WORD 0x01C8
WORD 0x01F0
WORD 0x01B0
WORD 0x0120
WORD 0x0137
WORD 0x017F
WORD 0x03FF
WORD 0x01F3
WORD 0x01B1
WORD 0x0119
WORD 0x010F
WORD 0x0106
WORD 0x0900
WORD 0x0800
WORD 0x0180
WORD 0x01F0
WORD 0x0130
WORD 0x0120
WORD 0x0121
WORD 0x013F
WORD 0x04FF
WORD 0x01F1
WORD 0x0199
WORD 0x010B
WORD 0x010E
WORD 0x0900
WORD 0x0800
WORD 0x0180
WORD 0x01E0
WORD 0x0170
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01FD
WORD 0x01F9
WORD 0x019B
WORD 0x010E
WORD 0x0104
WORD 0x0800
WORD 0x0800
WORD 0x0180
WORD 0x02E0
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01F9
WORD 0x02FF
WORD 0x010F
WORD 0x0104
WORD 0x0800
WORD 0x0800
WORD 0x0180
WORD 0x01C0
WORD 0x01E2
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01F0
WORD 0x01F8
WORD 0x02FF
WORD 0x010E
WORD 0x0800
WORD 0x0900
WORD 0x01C0
WORD 0x01E0
WORD 0x0220
WORD 0x013F
WORD 0x027F
WORD 0x02FF
WORD 0x02F0
WORD 0x01FB
WORD 0x01FF
WORD 0x010F
WORD 0x0800
WORD 0x0900
WORD 0x01C0
WORD 0x01F2
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x02F0
WORD 0x01F9
WORD 0x01FF
WORD 0x010F
WORD 0x0800
WORD 0x0900
WORD 0x01C0
WORD 0x01F0
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x02F0
WORD 0x01FD
WORD 0x01FF
WORD 0x010F
WORD 0x0800
WORD 0x0900
WORD 0x01C0
WORD 0x01E0
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01F0
WORD 0x01F8
WORD 0x01FF
WORD 0x018F
WORD 0x010E
WORD 0x0800
WORD 0x0900
WORD 0x01C0
WORD 0x01E1
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01F9
WORD 0x01FE
WORD 0x01FF
WORD 0x018B
WORD 0x010E
WORD 0x0800
WORD 0x0900
WORD 0x0180
WORD 0x01E6
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01FD
WORD 0x01FF
WORD 0x01FB
WORD 0x018B
WORD 0x010E
WORD 0x0800
WORD 0x0900
WORD 0x0180
WORD 0x01F3
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x05FF
WORD 0x01F9
WORD 0x018B
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0900
WORD 0x0180
WORD 0x01F0
WORD 0x0220
WORD 0x013F
WORD 0x027F
WORD 0x04FF
WORD 0x01F9
WORD 0x018B
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0900
WORD 0x0180
WORD 0x01F0
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01FD
WORD 0x01FF
WORD 0x01F9
WORD 0x018B
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0900
WORD 0x0180
WORD 0x01E0
WORD 0x0220
WORD 0x013F
WORD 0x017F
WORD 0x03FF
WORD 0x01F8
WORD 0x02FF
WORD 0x018B
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0900
WORD 0x0180
WORD 0x01E0
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x02FF
WORD 0x01F8
WORD 0x02FF
WORD 0x01CF
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0A00
WORD 0x01E0
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x02FF
WORD 0x01F0
WORD 0x02FF
WORD 0x01CF
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0A00
WORD 0x01EF
WORD 0x0220
WORD 0x023F
WORD 0x03FF
WORD 0x01F0
WORD 0x01FD
WORD 0x01FF
WORD 0x01CF
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0A00
WORD 0x01EE
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x02FF
WORD 0x01F0
WORD 0x01FD
WORD 0x01FF
WORD 0x01CF
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0A00
WORD 0x01EA
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x02FF
WORD 0x01F0
WORD 0x01FD
WORD 0x01FF
WORD 0x01CF
WORD 0x010E
WORD 0x0104
WORD 0x0700
WORD 0x0A00
WORD 0x01F6
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x02FF
WORD 0x01F0
WORD 0x01FD
WORD 0x01FF
WORD 0x01CF
WORD 0x0106
WORD 0x0104
WORD 0x0700
WORD 0x0A00
WORD 0x01F5
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FD
WORD 0x01F0
WORD 0x02FF
WORD 0x01CF
WORD 0x0106
WORD 0x0104
WORD 0x0700
WORD 0x0A00
WORD 0x01E5
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FD
WORD 0x01F0
WORD 0x02FF
WORD 0x01EF
WORD 0x0206
WORD 0x0700
WORD 0x0A00
WORD 0x01E1
WORD 0x0130
WORD 0x0120
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FD
WORD 0x01F8
WORD 0x02FF
WORD 0x01EF
WORD 0x0206
WORD 0x0700
WORD 0x0A00
WORD 0x01F0
WORD 0x0130
WORD 0x0120
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FD
WORD 0x01F8
WORD 0x02FF
WORD 0x01EF
WORD 0x0106
WORD 0x0102
WORD 0x0700
WORD 0x0900
WORD 0x0140
WORD 0x01F1
WORD 0x0130
WORD 0x0120
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FD
WORD 0x01F8
WORD 0x02FF
WORD 0x01EF
WORD 0x0106
WORD 0x0102
WORD 0x0700
WORD 0x0A00
WORD 0x01F0
WORD 0x0130
WORD 0x0120
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FD
WORD 0x01F8
WORD 0x02FF
WORD 0x01EF
WORD 0x0186
WORD 0x0182
WORD 0x0700
WORD 0x0A00
WORD 0x01F1
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FD
WORD 0x01F8
WORD 0x01FD
WORD 0x02FF
WORD 0x0186
WORD 0x0182
WORD 0x0700
WORD 0x0A00
WORD 0x01FC
WORD 0x0220
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FD
WORD 0x02FF
WORD 0x0187
WORD 0x0182
WORD 0x0700
WORD 0x0A00
WORD 0x01F1
WORD 0x0220
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FD
WORD 0x02FF
WORD 0x0187
WORD 0x0182
WORD 0x0700
WORD 0x0A00
WORD 0x01F0
WORD 0x0120
WORD 0x0124
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x0187
WORD 0x0182
WORD 0x0700
WORD 0x0A00
WORD 0x01E0
WORD 0x0130
WORD 0x0124
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x0187
WORD 0x0182
WORD 0x0700
WORD 0x0A00
WORD 0x01E0
WORD 0x0130
WORD 0x0124
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x0187
WORD 0x0182
WORD 0x0700
WORD 0x0A00
WORD 0x01E1
WORD 0x0130
WORD 0x0136
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FE
WORD 0x02FF
WORD 0x01C7
WORD 0x0182
WORD 0x0180
WORD 0x0600
WORD 0x0A00
WORD 0x01E9
WORD 0x0130
WORD 0x0136
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C7
WORD 0x0182
WORD 0x0180
WORD 0x0600
WORD 0x0A00
WORD 0x01E4
WORD 0x0130
WORD 0x0136
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C7
WORD 0x0280
WORD 0x0600
WORD 0x0A00
WORD 0x01E1
WORD 0x0130
WORD 0x0136
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C3
WORD 0x0280
WORD 0x0600
WORD 0x0A00
WORD 0x01E0
WORD 0x0130
WORD 0x0137
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C3
WORD 0x0280
WORD 0x0600
WORD 0x0A00
WORD 0x01E4
WORD 0x0130
WORD 0x0137
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C3
WORD 0x0280
WORD 0x0600
WORD 0x0A00
WORD 0x01FC
WORD 0x0120
WORD 0x0126
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C3
WORD 0x0280
WORD 0x0600
WORD 0x0A00
WORD 0x01E7
WORD 0x0220
WORD 0x033F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C3
WORD 0x0280
WORD 0x0600
WORD 0x0900
WORD 0x0180
WORD 0x01E7
WORD 0x0160
WORD 0x0120
WORD 0x012F
WORD 0x023F
WORD 0x017F
WORD 0x01FC
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01C3
WORD 0x0280
WORD 0x0600
WORD 0x0A00
WORD 0x01C9
WORD 0x0140
WORD 0x0160
WORD 0x016F
WORD 0x017F
WORD 0x013F
WORD 0x017F
WORD 0x01FF
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x01E3
WORD 0x01C0
WORD 0x0280
WORD 0x0500
WORD 0x0A00
WORD 0x0185
WORD 0x01C0
WORD 0x0140
WORD 0x014F
WORD 0x015F
WORD 0x027F
WORD 0x01FF
WORD 0x02FC
WORD 0x02FF
WORD 0x01F3
WORD 0x02C0
WORD 0x0180
WORD 0x0500
WORD 0x0A00
WORD 0x0182
WORD 0x01C0
WORD 0x0140
WORD 0x0147
WORD 0x015F
WORD 0x027F
WORD 0x01FF
WORD 0x02FC
WORD 0x02FF
WORD 0x01F3
WORD 0x02C0
WORD 0x0180
WORD 0x0500
WORD 0x0900
WORD 0x0130
WORD 0x0100
WORD 0x0180
WORD 0x0240
WORD 0x015F
WORD 0x027F
WORD 0x01FF
WORD 0x02FC
WORD 0x03FF
WORD 0x02C0
WORD 0x0280
WORD 0x0400
WORD 0x0800
WORD 0x010C
WORD 0x0101
WORD 0x0100
WORD 0x0380
WORD 0x01DF
WORD 0x015F
WORD 0x017F
WORD 0x02FF
WORD 0x01FC
WORD 0x03FF
WORD 0x02C0
WORD 0x0280
WORD 0x0400
WORD 0x0800
WORD 0x0107
WORD 0x0300
WORD 0x0280
WORD 0x01CF
WORD 0x015F
WORD 0x017F
WORD 0x02FF
WORD 0x01FE
WORD 0x03FF
WORD 0x02C0
WORD 0x0180
WORD 0x0500
WORD 0x0800
WORD 0x0104
WORD 0x0300
WORD 0x0280
WORD 0x01CF
WORD 0x027F
WORD 0x02FF
WORD 0x01FE
WORD 0x02FF
WORD 0x01EF
WORD 0x02C0
WORD 0x0600
WORD 0x0A00
WORD 0x0130
WORD 0x0100
WORD 0x0180
WORD 0x0184
WORD 0x01DF
WORD 0x017F
WORD 0x06FF
WORD 0x01E6
WORD 0x01C0
WORD 0x0180
WORD 0x0600
WORD 0x0800
WORD 0x0101
WORD 0x0100
WORD 0x0104
WORD 0x0100
WORD 0x0186
WORD 0x019E
WORD 0x01FF
WORD 0x017F
WORD 0x06FF
WORD 0x01E1
WORD 0x01C0
WORD 0x0700
WORD 0x0900
WORD 0x0201
WORD 0x010E
WORD 0x018C
WORD 0x019C
WORD 0x01FF
WORD 0x017F
WORD 0x06FF
WORD 0x01E0
WORD 0x01C0
WORD 0x0700
WORD 0x0A00
WORD 0x0141
WORD 0x0107
WORD 0x018C
WORD 0x019C
WORD 0x01FF
WORD 0x017F
WORD 0x05FF
WORD 0x02E0
WORD 0x01C0
WORD 0x0700
WORD 0x0B00
WORD 0x0106
WORD 0x018C
WORD 0x019C
WORD 0x01DF
WORD 0x017F
WORD 0x05FF
WORD 0x02E0
WORD 0x01C0
WORD 0x0700
WORD 0x0A00
WORD 0x0130
WORD 0x0100
WORD 0x0186
WORD 0x018E
WORD 0x01DF
WORD 0x017F
WORD 0x05FF
WORD 0x02E0
WORD 0x01C0
WORD 0x0700
WORD 0x0A00
WORD 0x0146
WORD 0x0100
WORD 0x0180
WORD 0x0186
WORD 0x01DF
WORD 0x017F
WORD 0x05FF
WORD 0x02E0
WORD 0x01C0
WORD 0x0700
WORD 0x0A00
WORD 0x0114
WORD 0x0280
WORD 0x0184
WORD 0x01DF
WORD 0x017F
WORD 0x05FF
WORD 0x02E0
WORD 0x01C0
WORD 0x0700
WORD 0x0A00
WORD 0x0118
WORD 0x0280
WORD 0x018E
WORD 0x01DF
WORD 0x017F
WORD 0x05FF
WORD 0x02E0
WORD 0x01C0
WORD 0x0700
WORD 0x0A00
WORD 0x0146
WORD 0x0100
WORD 0x0186
WORD 0x018E
WORD 0x01DF
WORD 0x017F
WORD 0x05FF
WORD 0x01E2
WORD 0x01E0
WORD 0x01C0
WORD 0x0700
WORD 0x0C00
WORD 0x0187
WORD 0x018E
WORD 0x01DF
WORD 0x017F
WORD 0x05FF
WORD 0x01E7
WORD 0x01E0
WORD 0x02C0
WORD 0x0600
WORD 0x0A00
WORD 0x01CC
WORD 0x0103
WORD 0x0186
WORD 0x018E
WORD 0x01DF
WORD 0x017F
WORD 0x06FF
WORD 0x02E0
WORD 0x01C0
WORD 0x0600
WORD 0x0A00
WORD 0x01C1
WORD 0x0100
WORD 0x0183
WORD 0x018F
WORD 0x01DF
WORD 0x017F
WORD 0x06FF
WORD 0x01F0
WORD 0x02E0
WORD 0x0140
WORD 0x0500
WORD 0x0A00
WORD 0x0140
WORD 0x0100
WORD 0x0183
WORD 0x0187
WORD 0x01DF
WORD 0x07FF
WORD 0x01F0
WORD 0x02E0
WORD 0x01C0
WORD 0x0500
WORD 0x0C00
WORD 0x0183
WORD 0x01C7
WORD 0x01CF
WORD 0x017F
WORD 0x06FF
WORD 0x02F0
WORD 0x02E0
WORD 0x0140
WORD 0x0400
WORD 0x0900
WORD 0x0105
WORD 0x0200
WORD 0x0183
WORD 0x01C7
WORD 0x01CF
WORD 0x07FF
WORD 0x01F8
WORD 0x03F0
WORD 0x0160
WORD 0x0400
WORD 0x0900
WORD 0x0128
WORD 0x0100
WORD 0x0180
WORD 0x0183
WORD 0x01C7
WORD 0x016F
WORD 0x08FF
WORD 0x02F8
WORD 0x02F0
WORD 0x0160
WORD 0x0300
WORD 0x0800
WORD 0x0103
WORD 0x0140
WORD 0x0100
WORD 0x0180
WORD 0x01C3
WORD 0x01C7
WORD 0x016F
WORD 0x01BF
WORD 0x07FF
WORD 0x03F8
WORD 0x01F0
WORD 0x0170
WORD 0x0160
WORD 0x0200
WORD 0x0800
WORD 0x0176
WORD 0x0100
WORD 0x0280
WORD 0x01C3
WORD 0x01E7
WORD 0x0167
WORD 0x013F
WORD 0x07FF
WORD 0x01FE
WORD 0x02FC
WORD 0x02F8
WORD 0x0178
WORD 0x0230
WORD 0x0700
WORD 0x0105
WORD 0x01AE
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01C1
WORD 0x0167
WORD 0x0177
WORD 0x013F
WORD 0x08FF
WORD 0x01FE
WORD 0x04FC
WORD 0x01BC
WORD 0x01B8
WORD 0x0700
WORD 0x01BD
WORD 0x0140
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E1
WORD 0x0163
WORD 0x0177
WORD 0x013F
WORD 0x09FF
WORD 0x02FE
WORD 0x01FF
WORD 0x01FE
WORD 0x01BE
WORD 0x01BC
WORD 0x0600
WORD 0x01F6
WORD 0x0180
WORD 0x0100
WORD 0x0180
WORD 0x02C0
WORD 0x01E1
WORD 0x0173
WORD 0x023F
WORD 0x0BFF
WORD 0x01FE
WORD 0x03FF
WORD 0x0400
WORD 0x0101
WORD 0x010F
WORD 0x0198
WORD 0x0100
WORD 0x0280
WORD 0x01C0
WORD 0x01E0
WORD 0x01F1
WORD 0x0179
WORD 0x013F
WORD 0x015F
WORD 0x0FFF
WORD 0x0400
WORD 0x013B
WORD 0x01EA
WORD 0x0140
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x0170
WORD 0x0179
WORD 0x013F
WORD 0x015F
WORD 0x0FFF
WORD 0x0200
WORD 0x0103
WORD 0x017D
WORD 0x01DF
WORD 0x0140
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x02F0
WORD 0x0178
WORD 0x013C
WORD 0x011F
WORD 0x015F
WORD 0x0FFF
WORD 0x013A
WORD 0x01CE
WORD 0x01DF
WORD 0x0160
WORD 0x0100
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x02F0
WORD 0x01F8
WORD 0x017C
WORD 0x023E
WORD 0x011F
WORD 0x016F
WORD 0x017F
WORD 0x0EFF
WORD 0x01F9
WORD 0x0300
WORD 0x0180
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F8
WORD 0x01FC
WORD 0x017E
WORD 0x013E
WORD 0x013F
WORD 0x011F
WORD 0x010F
WORD 0x0177
WORD 0x027F
WORD 0x0DFF
WORD 0x0200
WORD 0x01C0
WORD 0x02E0
WORD 0x01F0
WORD 0x01F8
WORD 0x01FC
WORD 0x017C
WORD 0x017E
WORD 0x013F
WORD 0x021F
WORD 0x010F
WORD 0x0137
WORD 0x013F
WORD 0x027F
WORD 0x0DFF
WORD 0x01C0
WORD 0x01E0
WORD 0x01F0
WORD 0x01F8
WORD 0x02FC
WORD 0x01FF
WORD 0x017F
WORD 0x023F
WORD 0x011F
WORD 0x020F
WORD 0x0107
WORD 0x011B
WORD 0x023F
WORD 0x017F
WORD 0x0DFF
WORD 0x01F8
WORD 0x01FC
WORD 0x01FE
WORD 0x01FF
WORD 0x027F
WORD 0x023F
WORD 0x011F
WORD 0x020F
WORD 0x0107
WORD 0x0103
WORD 0x010D
WORD 0x011F
WORD 0x033F
WORD 0x017F
WORD 0x0CFF
WORD 0x02FF
WORD 0x017F
WORD 0x023F
WORD 0x021F
WORD 0x010F
WORD 0x0207
WORD 0x0103
WORD 0x0101
WORD 0x0207
WORD 0x010F
WORD 0x031F
WORD 0x013F
WORD 0x017F
WORD 0x0BFF
WORD 0x023F
WORD 0x011F
WORD 0x020F
WORD 0x0207
WORD 0x0103
WORD 0x0201
WORD 0x0200
WORD 0x0103
WORD 0x0207
WORD 0x030F
WORD 0x021F
WORD 0x027F
WORD 0x09FF
WORD 0x0203
WORD 0x0201
WORD 0x0900
WORD 0x0501
WORD 0x0203
WORD 0x010F
WORD 0x011F
WORD 0x013F
WORD 0x047F
WORD 0x04FF
WORD 0x1400
WORD 0x0201
WORD 0x0103
WORD 0x0107
WORD 0x021F
WORD 0x053F
WORD 0x1B00
WORD 0x0301
WORD 0x0103
WORD 0x0F00
WORD 0x0380
WORD 0x0D00
WORD 0x0E00
WORD 0x03C0
WORD 0x0180
WORD 0x0D00
WORD 0x0E00
WORD 0x04C0
WORD 0x0D00
WORD 0x0E00
WORD 0x02C0
WORD 0x01E0
WORD 0x01C0
WORD 0x0D00
WORD 0x0E00
WORD 0x01C0
WORD 0x02E0
WORD 0x01C0
WORD 0x0D00
WORD 0x0E00
WORD 0x01C0
WORD 0x02E0
WORD 0x01C0
WORD 0x0D00
WORD 0x0E00
WORD 0x0160
WORD 0x02E0
WORD 0x0160
WORD 0x0140
WORD 0x0C00
WORD 0x0E00
WORD 0x0260
WORD 0x0170
WORD 0x0160
WORD 0x0D00
WORD 0x0E00
WORD 0x0120
WORD 0x0270
WORD 0x0120
WORD 0x0D00
WORD 0x0E00
WORD 0x0430
WORD 0x0D00
WORD 0x0E00
WORD 0x0330
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0330
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0330
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0330
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0230
WORD 0x0138
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0110
WORD 0x0278
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0110
WORD 0x0278
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0110
WORD 0x0278
WORD 0x0110
WORD 0x0D00
WORD 0x0E00
WORD 0x0110
WORD 0x0278
WORD 0x0E00
WORD 0x0E00
WORD 0x0110
WORD 0x0178
WORD 0x0158
WORD 0x0E00
WORD 0x0E00
WORD 0x0110
WORD 0x0178
WORD 0x0138
WORD 0x0E00
WORD 0x0E00
WORD 0x0110
WORD 0x0178
WORD 0x0138
WORD 0x0E00
WORD 0x0E00
WORD 0x0118
WORD 0x01F8
WORD 0x0118
WORD 0x0E00
WORD 0x0E00
WORD 0x0118
WORD 0x01F8
WORD 0x0118
WORD 0x0E00
WORD 0x0E00
WORD 0x0118
WORD 0x01F8
WORD 0x01B8
WORD 0x0E00
WORD 0x0E00
WORD 0x0118
WORD 0x01F8
WORD 0x0178
WORD 0x0E00
WORD 0x0E00
WORD 0x0118
WORD 0x01F8
WORD 0x017C
WORD 0x0E00
WORD 0x0E00
WORD 0x0118
WORD 0x02FC
WORD 0x0E00
WORD 0x0E00
WORD 0x0118
WORD 0x02FC
WORD 0x0118
WORD 0x0D00
WORD 0x0E00
WORD 0x0118
WORD 0x01F8
WORD 0x01FE
WORD 0x0118
WORD 0x0D00
WORD 0x0E00
WORD 0x0118
WORD 0x01FC
WORD 0x01FF
WORD 0x01BC
WORD 0x0108
WORD 0x0C00
WORD 0x0E00
WORD 0x010C
WORD 0x01FC
WORD 0x01FF
WORD 0x01FC
WORD 0x011C
WORD 0x0C00
WORD 0x0E00
WORD 0x010C
WORD 0x01FE
WORD 0x02FF
WORD 0x013E
WORD 0x010C
WORD 0x0B00
WORD 0x0E00
WORD 0x0106
WORD 0x01FE
WORD 0x03FF
WORD 0x011E
WORD 0x0106
WORD 0x0A00
WORD 0x0E00
WORD 0x01E2
WORD 0x01EF
WORD 0x03FF
WORD 0x013F
WORD 0x010F
WORD 0x0103
WORD 0x0900
WORD 0x0E00
WORD 0x01E1
WORD 0x01E7
WORD 0x019F
WORD 0x02FF
WORD 0x013F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x0800
WORD 0x0D00
WORD 0x0120
WORD 0x01E0
WORD 0x01E3
WORD 0x018F
WORD 0x03FF
WORD 0x013F
WORD 0x010F
WORD 0x0107
WORD 0x0101
WORD 0x0700
WORD 0x0D00
WORD 0x01A0
WORD 0x01F0
WORD 0x01E1
WORD 0x0187
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0600
WORD 0x0D00
WORD 0x01A0
WORD 0x01F0
WORD 0x01E1
WORD 0x0187
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x010F
WORD 0x0103
WORD 0x0101
WORD 0x0600
WORD 0x0D00
WORD 0x01A0
WORD 0x01F0
WORD 0x01E1
WORD 0x0187
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x010F
WORD 0x0103
WORD 0x0101
WORD 0x0600
WORD 0x0D00
WORD 0x01A0
WORD 0x01F0
WORD 0x01E1
WORD 0x0187
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0600
WORD 0x0D00
WORD 0x02F0
WORD 0x01A1
WORD 0x0187
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0600
WORD 0x0D00
WORD 0x02F0
WORD 0x01A0
WORD 0x0187
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0600
WORD 0x0D00
WORD 0x02F0
WORD 0x01B0
WORD 0x0187
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0600
WORD 0x0D00
WORD 0x02F0
WORD 0x0190
WORD 0x0147
WORD 0x03FF
WORD 0x013F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x0101
WORD 0x0600