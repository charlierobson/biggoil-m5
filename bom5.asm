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
    cp      2
    jr      nz,hang

    call    redefinekeys
    jr      title


interrupt_routine:
    in      a,(VDP_STAT)                ; Acknowledge VDP interrupt
    ei
    reti

; must come before any files defining textual data
#include "charmap.asm"

#include "font.asm"
#include "input.asm"
#include "vdp.asm"
#include "redefine.asm"

#include "seg_data.asm"

#include "title.txt"

    .fill   $2000-$

    .end
