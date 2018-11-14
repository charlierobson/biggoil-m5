    .org $2000

    .db     0           ; identifier
    .dw     start       ; start execution address
    .dw     ipl         ; IPL address
    .db     0,0,0       ; RST 4 jump
    .db     0,0,0       ; RST 5 jump


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

title:
    ld      hl,titel+1
    call    showScreen

hang:
    call    readtitleinput

    ld      a,(begin)
    and     3
    cp      1
    jp      z,beginGame

    ld      a,(redef)
    and     3
    cp      2
    jr      nz,hang

    call    redefinekeys
    ld      hl,(fire-3)
    ld      (begin-3),hl
    jr      title


beginGame:
    ld      hl,level1+1
    call    showScreen

hang2:
    call    readgameinput

    ld      a,(fire)
    and     3
    cp      1
    jr      nz,hang2

    jr      title


interrupt_routine:
    in      a,(VDP_STAT)                ; Acknowledge VDP interrupt
    ei
    reti

; must come before any files defining textual data
#include "charmap.asm"

#include "input.asm"
#include "vdp.asm"
#include "redefine.asm"

#include "seg_data.asm"

#include "font.asm"
#include "title.txt"

level1:
    #include "lvl1.txt"

    .fill   $2000-$

    .end
