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

title_start:
    ld      hl,scn_title
    call    showScreen

    call    titleInit

title_loop:
    call    waitVSync
    call    readtitleinput

    call    titleUpdate

    ld      a,(begin)
    and     3
    cp      1
    jp      z,game_start

    ld      a,(redef)
    and     3
    cp      1
    jr      nz,title_loop

    call    redefinekeys
    ld      hl,(fire-3)
    ld      (begin-3),hl
    jr      title_start


game_start:
    ld      hl,scn_level1
    call    showScreen

    call    prepGameInputs

game_loop:
    call    waitVSync
    call    readgameinput

    ld      a,(fire)
    and     3
    cp      1
    jr      nz,game_loop

    jr      title_start


interrupt_routine:
    in      a,(VDP_STAT)                ; Acknowledge VDP interrupt
    ei
    reti


#include "charmap.asm"

#include "title.asm"

#include "input.asm"
#include "vdp.asm"
#include "redefine.asm"

#include "seg_data.asm"

#include "font.asm"

scn_title:
#include "title.txt"

scn_level1:
#include "lvl1.txt"

    .fill   $2000-$

    .end
