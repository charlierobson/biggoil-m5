
;   7       6       5       4       3       2       1       0    bit/registr
;-------+-------+-------+-------+-------+-------+-------+-------.
;   0   |   0   |   0   |   0   |   0   |   0   |  M3   | EXTVI | R0
;-------+-------+-------+-------+-------+-------+-------+-------+
; VRAM  | BLANK | INTEN |  M1   |  M2   |   0   | SIZE  |  MAG  | R1
;-------+-------+-------+-------+-------+-------+-------+-------+
;   0   |   0   |   0   |   0   |        screen address         | R2
;-------+-------+-------+-------+-------+-------+-------+-------+
;                     color table address                       | R3
;-------+-------+-------+-------+-------+-------+-------+-------+
;   0   |   0   |   0   |   0   |   0   |   char. base address  | R4
;-------+-------+-------+-------+-------+-------+-------+-------+
;   0   |                 Sprite table address                  | R5
;-------+-------+-------+-------+-------+-------+-------+-------+
;   0   |   0   |   0   |   0   |   0   | addr sprite templates | R6
;-------+-------+-------+-------+-------+-------+-------+-------+
;       foreground colour       |   background color or frame   | R7
;-------+-------+-------+-------+-------+-------+-------+-------'


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

initVDP:
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
    ld      a,c
    out     (VDP_REG),a
    ld      a,b
    or      $80
    out     (VDP_REG),a
    ret


waitframes:
waitFrames:
    call    waitVSync
    djnz    waitFrames

waitVSync:
    in      a,(VDP_STAT)                ; read/Acknowledge VDP interrupt
    and     $80
    jr      z,waitVSync
    ld      a,(frames)
    dec     a
    ld      (frames),a
    ret


cls:
    ld      hl,NAMETBL
    call    setVDPAddress

    xor     a
    ld      bc,3

-:  out     (VDP_DATA),a
    djnz    {-}
    dec     c
    jr      nz,{-}

    ret


_setVDPAddr:
    push    hl
    ld      h,0                     ; hl = NAMETBL + (32 * e) + d
    ld      l,e
    ld      e,d
    ld      d,h
    add     hl,hl
    add     hl,hl
    add     hl,hl
    add     hl,hl
    add     hl,hl
    add     hl,de
    ld      de,NAMETBL
    add     hl,de
    call    setVDPAddress
    pop     hl
    ret



textOut:
    call    _setVDPAddr

-:  ld      a,(hl)
    cp      $ff
    ret     z
    out     (VDP_DATA),a
    inc     hl
    jr      {-}



textOutN:
    call    _setVDPAddr

-:  ld      a,(hl)
    out     (VDP_DATA),a
    inc     hl
    djnz    {-}
    ret



invertScreen:
	ld		hl,dfile
    ld      bc,33*24

-:  ld		a,(hl)
	xor		$80
    ld      (hl),a
    inc     hl
    dec     bc
    ld      a,b
    or      c
    jr      nz,{-}

    ret



showScreen:
    push    hl
    ld      hl,NAMETBL
    call    setVDPAddress
    pop     hl

    ld      bc,VDP_DATA
    otir
    otir
    otir

    ret




framesync:
    call    waitVSync

    ld      hl,NAMETBL
    call    setVDPAddress
    ld      hl,dfile+1
    ld      b,24

-:  ld      e,b
    ld      bc,$2000+VDP_DATA
    otir
    inc     hl
    ld      b,e
    djnz    {-}

    ret