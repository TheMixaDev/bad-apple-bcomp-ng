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
WORD 0x0303
WORD 0x0100
WORD 0x0403
WORD 0x0107
WORD 0x0105
WORD 0x0107
WORD 0x0103
WORD 0x010F
WORD 0x0103
WORD 0x010F
WORD 0x021F
WORD 0x010F
WORD 0x027F
WORD 0x01DF
WORD 0x017F
WORD 0x01FF
WORD 0x01CF
WORD 0x0400
WORD 0x0180
WORD 0x0170
WORD 0x0138
WORD 0x0303
WORD 0x0100
WORD 0x0403
WORD 0x0105
WORD 0x0307
WORD 0x020F
WORD 0x041F
WORD 0x017F
WORD 0x01FF
WORD 0x01DF
WORD 0x01FF
WORD 0x01EF
WORD 0x0500
WORD 0x0140
WORD 0x0138
WORD 0x013C
WORD 0x0203
WORD 0x0202
WORD 0x0303
WORD 0x0106
WORD 0x0101
WORD 0x0103
WORD 0x0207
WORD 0x020F
WORD 0x011F
WORD 0x0117
WORD 0x011F
WORD 0x013F
WORD 0x04FF
WORD 0x01C8
WORD 0x0500
WORD 0x0138
WORD 0x01BC
WORD 0x019E
WORD 0x0203
WORD 0x0202
WORD 0x0303
WORD 0x0101
WORD 0x0103
WORD 0x0105
WORD 0x0107
WORD 0x030F
WORD 0x031F
WORD 0x013F
WORD 0x01FF
WORD 0x017F
WORD 0x01FF
WORD 0x01FE
WORD 0x01C0
WORD 0x0500
WORD 0x019C
WORD 0x01DE
WORD 0x01FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0100
WORD 0x0407
WORD 0x020F
WORD 0x031F
WORD 0x013F
WORD 0x03FF
WORD 0x01F8
WORD 0x01C0
WORD 0x0400
WORD 0x0198
WORD 0x01DC
WORD 0x02FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0203
WORD 0x0105
WORD 0x0103
WORD 0x020F
WORD 0x0117
WORD 0x010F
WORD 0x012F
WORD 0x010F
WORD 0x01FF
WORD 0x013F
WORD 0x017F
WORD 0x01F8
WORD 0x0140
WORD 0x0400
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0407
WORD 0x020F
WORD 0x011F
WORD 0x020F
WORD 0x012F
WORD 0x01FF
WORD 0x011F
WORD 0x017F
WORD 0x01F8
WORD 0x0400
WORD 0x0110
WORD 0x01F8
WORD 0x01FC
WORD 0x02FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0101
WORD 0x0307
WORD 0x010F
WORD 0x0107
WORD 0x0117
WORD 0x010F
WORD 0x013F
WORD 0x012F
WORD 0x017F
WORD 0x013F
WORD 0x01FE
WORD 0x01F0
WORD 0x0400
WORD 0x01B0
WORD 0x01F8
WORD 0x01FE
WORD 0x02FF
WORD 0x0103
WORD 0x0102
WORD 0x0103
WORD 0x0102
WORD 0x0203
WORD 0x0101
WORD 0x0100
WORD 0x0103
WORD 0x0105
WORD 0x0307
WORD 0x010B
WORD 0x0117
WORD 0x020F
WORD 0x012F
WORD 0x01DF
WORD 0x013F
WORD 0x01FC
WORD 0x0160
WORD 0x0400
WORD 0x01B0
WORD 0x01FC
WORD 0x01FE
WORD 0x02FF
WORD 0x0103
WORD 0x0102
WORD 0x0103
WORD 0x0102
WORD 0x0503
WORD 0x0101
WORD 0x0107
WORD 0x010F
WORD 0x010B
WORD 0x010F
WORD 0x011F
WORD 0x030F
WORD 0x017F
WORD 0x011F
WORD 0x01F8
WORD 0x0140
WORD 0x0400
WORD 0x01B8
WORD 0x01FC
WORD 0x03FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0100
WORD 0x0105
WORD 0x0207
WORD 0x010F
WORD 0x0103
WORD 0x010B
WORD 0x0117
WORD 0x020F
WORD 0x012F
WORD 0x027F
WORD 0x01F8
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x0118
WORD 0x01FC
WORD 0x03FF
WORD 0x0203
WORD 0x0202
WORD 0x0203
WORD 0x0201
WORD 0x0103
WORD 0x0101
WORD 0x0107
WORD 0x010F
WORD 0x010B
WORD 0x010F
WORD 0x021F
WORD 0x010F
WORD 0x012F
WORD 0x015F
WORD 0x01FF
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x0198
WORD 0x01FE
WORD 0x03FF
WORD 0x0203
WORD 0x0202
WORD 0x0103
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0307
WORD 0x010F
WORD 0x010B
WORD 0x010F
WORD 0x011F
WORD 0x013F
WORD 0x021F
WORD 0x01FF
WORD 0x01FC
WORD 0x0140
WORD 0x0200
WORD 0x0140
WORD 0x0120
WORD 0x0118
WORD 0x019C
WORD 0x01FE
WORD 0x03FF
WORD 0x0203
WORD 0x0202
WORD 0x0203
WORD 0x0101
WORD 0x0107
WORD 0x0303
WORD 0x010B
WORD 0x0103
WORD 0x030F
WORD 0x031F
WORD 0x01F8
WORD 0x0300
WORD 0x01C0
WORD 0x0130
WORD 0x0118
WORD 0x01DC
WORD 0x04FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0106
WORD 0x0105
WORD 0x0107
WORD 0x040F
WORD 0x011F
WORD 0x010F
WORD 0x013F
WORD 0x017F
WORD 0x01DF
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0110
WORD 0x010C
WORD 0x01FE
WORD 0x04FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0107
WORD 0x0103
WORD 0x0207
WORD 0x010B
WORD 0x010F
WORD 0x0107
WORD 0x021F
WORD 0x012F
WORD 0x015F
WORD 0x01F8
WORD 0x01E0
WORD 0x0400
WORD 0x0110
WORD 0x01CC
WORD 0x01FE
WORD 0x04FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0307
WORD 0x0103
WORD 0x020F
WORD 0x0117
WORD 0x011F
WORD 0x013F
WORD 0x017F
WORD 0x015F
WORD 0x01F8
WORD 0x01E0
WORD 0x0400
WORD 0x0108
WORD 0x01FC
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0307
WORD 0x0103
WORD 0x030F
WORD 0x011F
WORD 0x033F
WORD 0x01F8
WORD 0x0160
WORD 0x0400
WORD 0x01C8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0403
WORD 0x0207
WORD 0x010B
WORD 0x020F
WORD 0x0107
WORD 0x021F
WORD 0x013F
WORD 0x017E
WORD 0x01F8
WORD 0x0140
WORD 0x0400
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0307
WORD 0x010B
WORD 0x020F
WORD 0x021F
WORD 0x023F
WORD 0x017E
WORD 0x01F8
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0201
WORD 0x0207
WORD 0x0103
WORD 0x010B
WORD 0x030F
WORD 0x011F
WORD 0x013F
WORD 0x027F
WORD 0x01D8
WORD 0x0500
WORD 0x01F8
WORD 0x01FC
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0107
WORD 0x0105
WORD 0x0107
WORD 0x030F
WORD 0x021F
WORD 0x013F
WORD 0x017F
WORD 0x019F
WORD 0x01B8
WORD 0x0500
WORD 0x01F8
WORD 0x01FC
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0407
WORD 0x020F
WORD 0x011F
WORD 0x013F
WORD 0x03BF
WORD 0x0178
WORD 0x0140
WORD 0x0400
WORD 0x01F8
WORD 0x01FC
WORD 0x05FF
WORD 0x0203
WORD 0x0202
WORD 0x0101
WORD 0x0103
WORD 0x0207
WORD 0x0203
WORD 0x0107
WORD 0x020F
WORD 0x0117
WORD 0x017F
WORD 0x026F
WORD 0x015F
WORD 0x0178
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0203
WORD 0x0105
WORD 0x0103
WORD 0x0107
WORD 0x0103
WORD 0x0207
WORD 0x010F
WORD 0x011F
WORD 0x02BF
WORD 0x02FF
WORD 0x01F8
WORD 0x0500
WORD 0x0158
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0203
WORD 0x0107
WORD 0x0105
WORD 0x0103
WORD 0x0107
WORD 0x020F
WORD 0x018F
WORD 0x019F
WORD 0x02AF
WORD 0x01FF
WORD 0x01DF
WORD 0x01F8
WORD 0x0500
WORD 0x01C8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0100
WORD 0x0103
WORD 0x0101
WORD 0x0407
WORD 0x020F
WORD 0x011B
WORD 0x021F
WORD 0x01AF
WORD 0x01BF
WORD 0x01DE
WORD 0x01F8
WORD 0x0500
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0301
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0105
WORD 0x0103
WORD 0x0105
WORD 0x0107
WORD 0x020F
WORD 0x010B
WORD 0x0117
WORD 0x012F
WORD 0x013F
WORD 0x01BF
WORD 0x019E
WORD 0x01F8
WORD 0x0500
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0107
WORD 0x0103
WORD 0x0207
WORD 0x020F
WORD 0x011F
WORD 0x010F
WORD 0x012F
WORD 0x011F
WORD 0x019F
WORD 0x01FE
WORD 0x01F8
WORD 0x0500
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0203
WORD 0x0101
WORD 0x0102
WORD 0x0201
WORD 0x0105
WORD 0x0307
WORD 0x010F
WORD 0x010B
WORD 0x021F
WORD 0x012F
WORD 0x013F
WORD 0x01BF
WORD 0x01FE
WORD 0x01F8
WORD 0x0500
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0301
WORD 0x0100
WORD 0x0201
WORD 0x0107
WORD 0x0105
WORD 0x0103
WORD 0x0107
WORD 0x010F
WORD 0x010B
WORD 0x020F
WORD 0x012F
WORD 0x010F
WORD 0x01DF
WORD 0x01BE
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0203
WORD 0x0101
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0105
WORD 0x0107
WORD 0x0103
WORD 0x0107
WORD 0x010F
WORD 0x010B
WORD 0x0117
WORD 0x010F
WORD 0x013F
WORD 0x011F
WORD 0x01FF
WORD 0x019E
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0203
WORD 0x0101
WORD 0x0105
WORD 0x0101
WORD 0x0103
WORD 0x0105
WORD 0x0101
WORD 0x0103
WORD 0x0107
WORD 0x010F
WORD 0x010B
WORD 0x0107
WORD 0x010F
WORD 0x012F
WORD 0x011F
WORD 0x01FF
WORD 0x01BE
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0201
WORD 0x0103
WORD 0x0201
WORD 0x0207
WORD 0x0303
WORD 0x010B
WORD 0x0107
WORD 0x011F
WORD 0x010F
WORD 0x013F
WORD 0x011F
WORD 0x01BF
WORD 0x019E
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0101
WORD 0x0403
WORD 0x0105
WORD 0x0107
WORD 0x0101
WORD 0x0105
WORD 0x010B
WORD 0x020F
WORD 0x0117
WORD 0x010F
WORD 0x013F
WORD 0x01BF
WORD 0x01FF
WORD 0x01FE
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0100
WORD 0x0103
WORD 0x0507
WORD 0x020F
WORD 0x031F
WORD 0x012F
WORD 0x01BF
WORD 0x01FC
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01E8
WORD 0x01FE
WORD 0x05FF
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0100
WORD 0x0303
WORD 0x0307
WORD 0x020F
WORD 0x021F
WORD 0x013F
WORD 0x012F
WORD 0x01BF
WORD 0x019C
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01EC
WORD 0x01FE
WORD 0x05FF
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0103
WORD 0x0307
WORD 0x0105
WORD 0x0107
WORD 0x010B
WORD 0x010F
WORD 0x0117
WORD 0x011F
WORD 0x013F
WORD 0x010F
WORD 0x01BF
WORD 0x01FC
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01EC
WORD 0x01FE
WORD 0x05FF
WORD 0x0101
WORD 0x0203
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0107
WORD 0x0105
WORD 0x0107
WORD 0x030F
WORD 0x0117
WORD 0x013F
WORD 0x012F
WORD 0x01CF
WORD 0x01FC
WORD 0x01F0
WORD 0x0300
WORD 0x0140
WORD 0x0100
WORD 0x01EC
WORD 0x01FE
WORD 0x05FF
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0100
WORD 0x0103
WORD 0x0101
WORD 0x0307
WORD 0x0103
WORD 0x030F
WORD 0x011F
WORD 0x023F
WORD 0x01DF
WORD 0x01BC
WORD 0x01F0
WORD 0x0500
WORD 0x01EC
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0100
WORD 0x0103
WORD 0x0105
WORD 0x0307
WORD 0x0103
WORD 0x030F
WORD 0x011F
WORD 0x023F
WORD 0x019F
WORD 0x01BC
WORD 0x01F0
WORD 0x0500
WORD 0x01EC
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0100
WORD 0x0103
WORD 0x0101
WORD 0x0105
WORD 0x0307
WORD 0x0103
WORD 0x020F
WORD 0x011F
WORD 0x023F
WORD 0x01DF
WORD 0x01BC
WORD 0x01F0
WORD 0x0500
WORD 0x01FC
WORD 0x01FE
WORD 0x05FF
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0107
WORD 0x0103
WORD 0x0105
WORD 0x0207
WORD 0x020F
WORD 0x021F
WORD 0x012F
WORD 0x01BF
WORD 0x01BC
WORD 0x01F0
WORD 0x0500
WORD 0x01FC
WORD 0x01FE
WORD 0x05FF
WORD 0x0203
WORD 0x0101
WORD 0x0102
WORD 0x0203
WORD 0x0407
WORD 0x010B
WORD 0x020F
WORD 0x021F
WORD 0x013F
WORD 0x01BF
WORD 0x01FC
WORD 0x01F0
WORD 0x0500
WORD 0x01FC
WORD 0x01FE
WORD 0x05FF
WORD 0x0101
WORD 0x0203
WORD 0x0102
WORD 0x0203
WORD 0x0407
WORD 0x010F
WORD 0x010B
WORD 0x010F
WORD 0x021F
WORD 0x013F
WORD 0x01BF
WORD 0x01DC
WORD 0x01F0
WORD 0x0500
WORD 0x01FC
WORD 0x01FE
WORD 0x05FF
WORD 0x0203
WORD 0x0101
WORD 0x0303
WORD 0x0107
WORD 0x0103
WORD 0x0105
WORD 0x0107
WORD 0x020B
WORD 0x020F
WORD 0x0117
WORD 0x013F
WORD 0x01FF
WORD 0x01FC
WORD 0x01F0
WORD 0x0500
WORD 0x01FC
WORD 0x01FE
WORD 0x05FF
WORD 0x0703
WORD 0x0307
WORD 0x010B
WORD 0x010F
WORD 0x0107
WORD 0x011F
WORD 0x0137
WORD 0x013F
WORD 0x01BF
WORD 0x01DC
WORD 0x01F0
WORD 0x0500
WORD 0x01FC
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0101
WORD 0x0203
WORD 0x0106
WORD 0x0207
WORD 0x010B
WORD 0x020F
WORD 0x021F
WORD 0x013F
WORD 0x01BF
WORD 0x01DC
WORD 0x01F0
WORD 0x0500
WORD 0x01FC
WORD 0x01FE
WORD 0x05FF
WORD 0x0101
WORD 0x0203
WORD 0x0102
WORD 0x0101
WORD 0x0203
WORD 0x0307
WORD 0x010B
WORD 0x020F
WORD 0x021F
WORD 0x012F
WORD 0x01BF
WORD 0x01FC
WORD 0x01F0
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0101
WORD 0x0203
WORD 0x0307
WORD 0x030F
WORD 0x0117
WORD 0x011F
WORD 0x013F
WORD 0x01FF
WORD 0x019E
WORD 0x01F0
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0101
WORD 0x0203
WORD 0x0307
WORD 0x020F
WORD 0x010B
WORD 0x010F
WORD 0x021F
WORD 0x019F
WORD 0x01BE
WORD 0x01F0
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0407
WORD 0x020F
WORD 0x021F
WORD 0x010F
WORD 0x01DF
WORD 0x019E
WORD 0x01F0
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0203
WORD 0x0105
WORD 0x0103
WORD 0x0101
WORD 0x0207
WORD 0x030F
WORD 0x011F
WORD 0x018F
WORD 0x01BF
WORD 0x019E
WORD 0x01F0
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0107
WORD 0x0103
WORD 0x0307
WORD 0x030F
WORD 0x0117
WORD 0x01AF
WORD 0x01BF
WORD 0x01BE
WORD 0x01F8
WORD 0x0400
WORD 0x0180
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0503
WORD 0x0105
WORD 0x0107
WORD 0x030F
WORD 0x019F
WORD 0x02BF
WORD 0x019E
WORD 0x01F8
WORD 0x0400
WORD 0x0180
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0201
WORD 0x0103
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0407
WORD 0x020F
WORD 0x0197
WORD 0x019F
WORD 0x01BF
WORD 0x01FE
WORD 0x01F8
WORD 0x0500
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0203
WORD 0x0101
WORD 0x0102
WORD 0x0303
WORD 0x0106
WORD 0x0307
WORD 0x0103
WORD 0x028F
WORD 0x019F
WORD 0x02BF
WORD 0x01BE
WORD 0x01F8
WORD 0x0140
WORD 0x0300
WORD 0x0140
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0106
WORD 0x0103
WORD 0x0307
WORD 0x028F
WORD 0x019F
WORD 0x0197
WORD 0x01BF
WORD 0x01FE
WORD 0x01F8
WORD 0x0140
WORD 0x0400
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0102
WORD 0x0303
WORD 0x0507
WORD 0x028F
WORD 0x0197
WORD 0x019F
WORD 0x02FF
WORD 0x01F8
WORD 0x0140
WORD 0x0400
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0407
WORD 0x020F
WORD 0x029F
WORD 0x02FF
WORD 0x01F8
WORD 0x0160
WORD 0x0400
WORD 0x01F8
WORD 0x01FE
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0207
WORD 0x0103
WORD 0x010B
WORD 0x0107
WORD 0x015F
WORD 0x01C7
WORD 0x015F
WORD 0x017F
WORD 0x01F8
WORD 0x0160
WORD 0x0400
WORD 0x01F8
WORD 0x01FC
WORD 0x05FF
WORD 0x0303
WORD 0x0102
WORD 0x0101
WORD 0x0102
WORD 0x0103
WORD 0x0100
WORD 0x0103
WORD 0x0207
WORD 0x0103
WORD 0x0207
WORD 0x015F
WORD 0x024F
WORD 0x016F
WORD 0x017C
WORD 0x0170
WORD 0x0400
WORD 0x01B0
WORD 0x01FC
WORD 0x05FF
WORD 0x0103
WORD 0x0201
WORD 0x0102
WORD 0x0201
WORD 0x0103
WORD 0x0100
WORD 0x0203
WORD 0x0107
WORD 0x0103
WORD 0x0207
WORD 0x011F
WORD 0x010F
WORD 0x012F
WORD 0x016F
WORD 0x017C
WORD 0x0170
WORD 0x0400
WORD 0x0120
WORD 0x01FC
WORD 0x05FF
WORD 0x0103
WORD 0x0201
WORD 0x0102
WORD 0x0101
WORD 0x0203
WORD 0x0100
WORD 0x0103
WORD 0x0107
WORD 0x0105
WORD 0x0107
WORD 0x020F
WORD 0x021F
WORD 0x022F
WORD 0x01FC
WORD 0x0178
WORD 0x0160
WORD 0x0400
WORD 0x01F8
WORD 0x01FE
WORD 0x04FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0107
WORD 0x0101
WORD 0x0107
WORD 0x020F
WORD 0x011F
WORD 0x010F
WORD 0x012F
WORD 0x010F
WORD 0x015E
WORD 0x01D8
WORD 0x0170
WORD 0x0400
WORD 0x0120
WORD 0x01FC
WORD 0x04FF
WORD 0x0203
WORD 0x0101
WORD 0x0102
WORD 0x0303
WORD 0x0100
WORD 0x0103
WORD 0x0207
WORD 0x0103
WORD 0x0107
WORD 0x010F
WORD 0x021F
WORD 0x022F
WORD 0x017F
WORD 0x013C
WORD 0x01F8
WORD 0x0120
WORD 0x0400
WORD 0x0160
WORD 0x01FE
WORD 0x03FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0100
WORD 0x0101
WORD 0x0105
WORD 0x0103
WORD 0x0107
WORD 0x020F
WORD 0x0117
WORD 0x010F
WORD 0x013F
WORD 0x010F
WORD 0x017F
WORD 0x013C
WORD 0x01F8
WORD 0x0170
WORD 0x0500
WORD 0x01F0
WORD 0x01FC
WORD 0x02FF
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0102
WORD 0x0303
WORD 0x0106
WORD 0x0103
WORD 0x0207
WORD 0x0103
WORD 0x020F
WORD 0x0117
WORD 0x011F
WORD 0x013F
WORD 0x012F
WORD 0x013F
WORD 0x017F
WORD 0x01FC
WORD 0x01F8
WORD 0x0110
WORD 0x0400
WORD 0x0160
WORD 0x01F8
WORD 0x01FC
WORD 0x01FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0100
WORD 0x0103
WORD 0x0101
WORD 0x0107
WORD 0x0103
WORD 0x020F
WORD 0x021F
WORD 0x023F
WORD 0x027F
WORD 0x01FE
WORD 0x01FC
WORD 0x0118
WORD 0x0500
WORD 0x01F0
WORD 0x01F8
WORD 0x01FC
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0101
WORD 0x0203
WORD 0x0107
WORD 0x010B
WORD 0x010F
WORD 0x0217
WORD 0x023F
WORD 0x027F
WORD 0x01FF
WORD 0x01FE
WORD 0x013C
WORD 0x0110
WORD 0x0400
WORD 0x0160
WORD 0x01F0
WORD 0x01F8
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0105
WORD 0x0107
WORD 0x030F
WORD 0x021F
WORD 0x013F
WORD 0x012F
WORD 0x017F
WORD 0x015F
WORD 0x03FF
WORD 0x011C
WORD 0x0500
WORD 0x0160
WORD 0x01F0
WORD 0x0303
WORD 0x0102
WORD 0x0403
WORD 0x0107
WORD 0x0103
WORD 0x0107
WORD 0x030F
WORD 0x051F
WORD 0x01FF
WORD 0x027F
WORD 0x02FF
WORD 0x019C
WORD 0x0110
WORD 0x0400
WORD 0x0160
WORD 0x0303
WORD 0x0102
WORD 0x0403
WORD 0x0107
WORD 0x0203
WORD 0x0307
WORD 0x0217
WORD 0x023F
WORD 0x011F
WORD 0x027F
WORD 0x013F
WORD 0x03FF
WORD 0x01DC
WORD 0x0110
WORD 0x0400
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0207
WORD 0x0103
WORD 0x0107
WORD 0x010F
WORD 0x011F
WORD 0x0117
WORD 0x021F
WORD 0x015F
WORD 0x011F
WORD 0x015F
WORD 0x017F
WORD 0x04FF
WORD 0x01FE
WORD 0x0118
WORD 0x0300
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0203
WORD 0x0105
WORD 0x0103
WORD 0x0107
WORD 0x050F
WORD 0x013F
WORD 0x025F
WORD 0x019F
WORD 0x017F
WORD 0x01EF
WORD 0x04FF
WORD 0x01FC
WORD 0x0118
WORD 0x0100
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0203
WORD 0x0105
WORD 0x0207
WORD 0x020F
WORD 0x0107
WORD 0x010F
WORD 0x0107
WORD 0x013F
WORD 0x012F
WORD 0x010F
WORD 0x019F
WORD 0x017F
WORD 0x07FF
WORD 0x01FC
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0102
WORD 0x0203
WORD 0x0407
WORD 0x010F
WORD 0x0107
WORD 0x010B
WORD 0x0117
WORD 0x020F
WORD 0x011F
WORD 0x018F
WORD 0x019F
WORD 0x01EF
WORD 0x07FF
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0407
WORD 0x030F
WORD 0x0107
WORD 0x013F
WORD 0x01CF
WORD 0x01BF
WORD 0x07FF
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0201
WORD 0x0703
WORD 0x0407
WORD 0x040F
WORD 0x013F
WORD 0x017F
WORD 0x07FF
WORD 0x0107
WORD 0x0203
WORD 0x0102
WORD 0x0203
WORD 0x0101
WORD 0x0403
WORD 0x0102
WORD 0x0403
WORD 0x0107
WORD 0x0103
WORD 0x0407
WORD 0x021F
WORD 0x012F
WORD 0x017F
WORD 0x05FF
WORD 0x0107
WORD 0x0603
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0102
WORD 0x0303
WORD 0x0100
WORD 0x0403
WORD 0x0207
WORD 0x010F
WORD 0x010E
WORD 0x021F
WORD 0x017F
WORD 0x04FF
WORD 0x020F
WORD 0x0207
WORD 0x0105
WORD 0x0203
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0103
WORD 0x0201
WORD 0x0100
WORD 0x0101
WORD 0x0303
WORD 0x0106
WORD 0x0107
WORD 0x0103
WORD 0x020F
WORD 0x0117
WORD 0x023F
WORD 0x017F
WORD 0x01FF
WORD 0x017F
WORD 0x011F
WORD 0x020F
WORD 0x0307
WORD 0x0503
WORD 0x0102
WORD 0x0301
WORD 0x0100
WORD 0x0201
WORD 0x0100
WORD 0x0102
WORD 0x0203
WORD 0x0205
WORD 0x0207
WORD 0x010F
WORD 0x011F
WORD 0x010F
WORD 0x023F
WORD 0x015F
WORD 0x011F
WORD 0x040F
WORD 0x0307
WORD 0x0203
WORD 0x0102
WORD 0x0201
WORD 0x0200
WORD 0x0201
WORD 0x0103
WORD 0x0100
WORD 0x0101
WORD 0x0203
WORD 0x0105
WORD 0x0307
WORD 0x040F
WORD 0x01FF
WORD 0x027F
WORD 0x013F
WORD 0x040F
WORD 0x0207
WORD 0x0103
WORD 0x0202
WORD 0x0103
WORD 0x0101
WORD 0x0102
WORD 0x0301
WORD 0x0100
WORD 0x0303
WORD 0x0102
WORD 0x0101
WORD 0x0103
WORD 0x0207
WORD 0x0103
WORD 0x0107
WORD 0x010F
WORD 0x0100
WORD 0x0140
WORD 0x01FF
WORD 0x017F
WORD 0x021F
WORD 0x0207
WORD 0x010F
WORD 0x0503
WORD 0x0101
WORD 0x0102
WORD 0x0103
WORD 0x0201
WORD 0x0102
WORD 0x0203
WORD 0x0101
WORD 0x0102
WORD 0x0603
WORD 0x0107
WORD 0x0300
WORD 0x0180
WORD 0x02FF
WORD 0x011F
WORD 0x012F
WORD 0x020F
WORD 0x0307
WORD 0x0203
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0203
WORD 0x0101
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x01FF
WORD 0x0400
WORD 0x0180
WORD 0x02FF
WORD 0x017F
WORD 0x011F
WORD 0x040F
WORD 0x0407
WORD 0x0103
WORD 0x0101
WORD 0x0303
WORD 0x0202
WORD 0x0101
WORD 0x0103
WORD 0x0102
WORD 0x0303
WORD 0x03FF
WORD 0x0120
WORD 0x0400
WORD 0x02FF
WORD 0x014F
WORD 0x012F
WORD 0x011F
WORD 0x030F
WORD 0x0507
WORD 0x0203
WORD 0x0102
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x05FF
WORD 0x0120
WORD 0x0400
WORD 0x01DF
WORD 0x017F
WORD 0x015F
WORD 0x011F
WORD 0x010F
WORD 0x0107
WORD 0x011F
WORD 0x0207
WORD 0x0103
WORD 0x0107
WORD 0x0105
WORD 0x0107
WORD 0x0100
WORD 0x0303
WORD 0x0102
WORD 0x0303
WORD 0x07FF
WORD 0x0124
WORD 0x0400
WORD 0x01DA
WORD 0x01FF
WORD 0x015F
WORD 0x013F
WORD 0x012F
WORD 0x0117
WORD 0x010F
WORD 0x0107
WORD 0x010F
WORD 0x0107
WORD 0x0103
WORD 0x0207
WORD 0x0203
WORD 0x0202
WORD 0x0203
WORD 0x09FF
WORD 0x0174
WORD 0x0400
WORD 0x01DA
WORD 0x017F
WORD 0x020F
WORD 0x011F
WORD 0x0117
WORD 0x0107
WORD 0x010B
WORD 0x0207
WORD 0x0201
WORD 0x0103
WORD 0x0202
WORD 0x0203
WORD 0x0BFF
WORD 0x0120
WORD 0x0400
WORD 0x01FF
WORD 0x023F
WORD 0x011F
WORD 0x0117
WORD 0x020F
WORD 0x010B
WORD 0x0207
WORD 0x0101
WORD 0x0403
WORD 0x0CFF
WORD 0x01F0
WORD 0x0400
WORD 0x01FE
WORD 0x017F
WORD 0x020F
WORD 0x0117
WORD 0x010B
WORD 0x010F
WORD 0x0103
WORD 0x0207
WORD 0x0101
WORD 0x0203
WORD 0x0101
WORD 0x0DFF
WORD 0x0400
WORD 0x0180
WORD 0x017F
WORD 0x011F
WORD 0x0117
WORD 0x011F
WORD 0x010B
WORD 0x0307
WORD 0x0103
WORD 0x0102
WORD 0x0103
WORD 0x0102
WORD 0x0101
WORD 0x0DFF
WORD 0x0164
WORD 0x0400
WORD 0x017E
WORD 0x012F
WORD 0x011F
WORD 0x0107
WORD 0x0103
WORD 0x010F
WORD 0x0203
WORD 0x0107
WORD 0x0201
WORD 0x0103
WORD 0x0101
WORD 0x0EFF
WORD 0x0400
WORD 0x01FC
WORD 0x023F
WORD 0x011F
WORD 0x0107
WORD 0x010F
WORD 0x010B
WORD 0x0207
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0EFF
WORD 0x0400
WORD 0x01C0
WORD 0x017F
WORD 0x010F
WORD 0x0207
WORD 0x010F
WORD 0x010B
WORD 0x0207
WORD 0x0102
WORD 0x0103
WORD 0x0101
WORD 0x0103
WORD 0x0EFF
WORD 0x0400
WORD 0x0180
WORD 0x017F
WORD 0x013F
WORD 0x011F
WORD 0x030F
WORD 0x0207
WORD 0x0403
WORD 0x0EFF
WORD 0x0120
WORD 0x0400
WORD 0x017E
WORD 0x021F
WORD 0x030F
WORD 0x0207
WORD 0x0403
WORD 0x0EFF
WORD 0x0120
WORD 0x0400
WORD 0x017E
WORD 0x021F
WORD 0x020F
WORD 0x0103
WORD 0x0207
WORD 0x0403
WORD 0x0EFF
WORD 0x0120
WORD 0x0400
WORD 0x017E
WORD 0x013F
WORD 0x011F
WORD 0x020F
WORD 0x0307
WORD 0x0102
WORD 0x0303