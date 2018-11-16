    .org $2000

#include "gamedefs.asm"

    .db     0           ; identifier
    .dw     start       ; start execution address
    .dw     ipl         ; IPL address
    .db     0,0,0       ; RST 4 jump
    .db     0,0,0       ; RST 5 jump


ipl:
    ret


start:
	ld		sp,$7fff

    ld      hl,interrupt_routine        ; Set interrupt pointer
    ld      ($7006),hl
    ld      a,$01                       ; Disable timer interrupt
    out     ($01),a

    ld      hl,seg_data
    ld      de,seg_data_target
    ld      bc,seg_data_end - seg_data
    ldir

	call	seedrnd
    call    initVDP

;	ld		b,100					; give time for crappy LCD tvs to re-sync
;	call	waitframes

-:	call	titlescn
	call	game
	call	gameoverscn
	jr		{-}


;-------------------------------------------------------------------------------


interrupt_routine:
    in      a,(VDP_STAT)                ; Acknowledge VDP interrupt
    ei
    reti


;-------------------------------------------------------------------------------


#include "charmap.asm"

#include "titlescrn.asm"
#include "redefine.asm"
#include "game.asm"
#include "gameoverscrn.asm"

#include "player.asm"
#include "enemies.asm"
#include "whimsy.asm"
#include "score.asm"

#include "leveldata.asm"

#include "random.asm"
#include "decrunch.asm"
#include "input.asm"
#include "vdp.asm"
#include "stcplay.asm"
#include "ayfxplay.asm"

#include "seg_data.asm"
#include "seg_text.asm"

#include "font.asm"


    .end
