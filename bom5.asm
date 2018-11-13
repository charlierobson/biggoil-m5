    .org $2000

    .db     0           ; identifier
    .dw     start       ; start execution address
    .dw     ipl         ; IPL address
    .db     0,0,0       ; RST 4 jump
    .db     0,0,0       ; RST 5 jump


VDP_DATA    .equ $10    ; read/write

VDP_REG     .equ $11    ; write
VDP_STAT    .equ $11    ; read

; vram addresses
SPRPAT      .equ    $0000
PATTBL      .equ    $0800
SPRATTR     .equ    $1000
NAMETBL     .equ    $1400
COLTBL      .equ    $2000

COL_TRANS    .equ $00
COL_BLACK    .equ $01
COL_DGREEN   .equ $0c
COL_MGREEN   .equ $02
COL_LGREEN   .equ $03
COL_DBLUE    .equ $04
COL_LBLUE    .equ $05
COL_DRED     .equ $06
COL_MRED     .equ $08
COL_LRED     .equ $09
COL_CYAN     .equ $07
COL_MAGENTA  .equ $0D
COL_DYELLOW  .equ $0A
COL_LYELLOW  .equ $0B
COL_GREY     .equ $0E
COL_WHITE    .equ $0F

ipl:
    ret

start:
    ld      hl,interrupt_routine        ; Set interrupt pointer
    ld      ($7006),hl
    ld      a,$01                       ; Disable timer interrupt
    out     ($01),a

    ld      hl,seg_data
    ld      de,seg_data_target
    ld      bc,seg_data_end - seg_data
    ldir

    call    initVDP

    ; set up the title screen
    ld      hl,NAMETBL
    call    setVDPAddress

    ld      hl,titel+1
    ld      bc,33*24
-:  ld      a,(hl)
    cp      $76
    jr      z,{+}

    out     (VDP_DATA),a

+:  inc     hl
    dec     bc
    ld      a,b
    or      c
    jr      nz,{-}

hang:
    call    readinput

    ld      a,(fire)
    and     3
    cp      1
    jr      nz,hang

    ld      a,(colr)
    inc     a
    and     15
    ld      (colr),a
    ld      b,7
    ld      c,a
    call    writeVDP
    jr      hang

initVDP:
    di

    ; set graphic 1 mode, bg col, vram layout.

    ld      b,0
    ld      hl,graphic1data

-:  ld      a,(hl)
    inc     hl
    out     (VDP_REG),a                 ; write data
    ld      a,b
    or      $80
    out     (VDP_REG),a                 ; write reg number

+:  inc     b
    ld      a,b
    cp      $08
    jr      nz,{-}

    ; set up the inital pattern table

    ld      hl,PATTBL
    call    setVDPAddress

    ld      hl,zx81font
    ld      bc,128*8
-:  ld      a,(hl)
    out     (VDP_DATA),a
    inc     hl
    dec     bc
    ld      a,b
    or      c
    jr      nz,{-}

    ld      hl,zx81font
    ld      bc,128*8
-:  ld      a,(hl)
    xor     $ff
    out     (VDP_DATA),a
    inc     hl
    dec     bc
    ld      a,b
    or      c
    jr      nz,{-}

    ; set up the initial colour table

    ld      hl,COLTBL
    call    setVDPAddress

    ld      a,(COL_BLACK<<4)+COL_WHITE
    ld      b,$20
-:  out     (VDP_DATA),a
    djnz    {-}

    ei
    ret


graphic1data:
    .db     $00,$c0,$05,$80,$01,$20,$00,COL_WHITE


; set vdp write address
;  HL     .equ address
;
setVDPAddress:
    ld      a,l
    out     (VDP_REG),a
    ld      a,h
    and     $3F
    or      $40
    out     (VDP_REG),a
    ret



; set vdp write address
;  HL     .equ address
;
writeVDP:
    di
    ld      a,c
    out     (VDP_REG),a
    ld      a,b
    or      $80
    out     (VDP_REG),a
    ei
    ret


interrupt_routine:
    in      a,(VDP_STAT)                ; Acknowledge VDP interrupt
    ei
    reti


#include "title.txt"
#include "font.asm"
#include "input.asm"
#include "seg_data.asm"

    .fill   $2000-$

    .end


VDP data port ( I/O port 10H )
==============================
Write or read one byte to or from VRAM at a preset address.
After reading or writing, the address is automatically incremented.


VDP command port ( I/O port 11H )
=================================

Bits for reading:
7 - 1     .equ the beam has reached the end of the screen
6 - 1     .equ there was a stretch of two and more sprints
5 - 1     .equ there is a pet and more sprint on one TV set
4 to 0 - the sprite number, which is the heel of the TV rad

Bits for writing:
If bit 7 is set, bits 2 through 0 contain the VDP register
number to which you want to write. If bit 7 is dropped then
bits 5 and 0 contain the VRAM address to which the VDP is set,
where bit 6 is determined if VDP is set to read or write:
0     .equ read, 1     .equ write. Attention! First, I send the data or the
lower half of the address (bits 7 to 0 have no special meaning)
and only the register number or the upper half of the address
has been broadcast (bits 7 and 6 have the same meaning as above).
Importance of the VDP registry:

    7       6       5       4       3       2       1       0    bit/registr
,-------+-------+-------+-------+-------+-------+-------+-------.
|   0   |   0   |   0   |   0   |   0   |   0   |  M3   | EXTVI | R0
+-------+-------+-------+-------+-------+-------+-------+-------+
| VRAM  | BLANK | INTEN |  M1   |  M2   |   0   | SIZE  |  MAG  | R1
+-------+-------+-------+-------+-------+-------+-------+-------+
|   0   |   0   |   0   |   0   |        screen address         | R2
+-------+-------+-------+-------+-------+-------+-------+-------+
|                     color table address                       | R3
+-------+-------+-------+-------+-------+-------+-------+-------+
|   0   |   0   |   0   |   0   |   0   |   char. base address  | R4
+-------+-------+-------+-------+-------+-------+-------+-------+
|   0   |                 Sprite table address                  | R5
+-------+-------+-------+-------+-------+-------+-------+-------+
|   0   |   0   |   0   |   0   |   0   | addr sprite templates | R6
+-------+-------+-------+-------+-------+-------+-------+-------+
|       foreground colour       |   background color or frame   | R7
`-------+-------+-------+-------+-------+-------+-------+-------'

