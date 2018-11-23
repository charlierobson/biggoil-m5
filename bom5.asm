    .org $2000

#include "gamedefs.asm"

    .db     0           ; identifier
    .dw     start       ; start execution address
    .dw     ipl         ; IPL address
    .db     0,0,0       ; RST 4 jump
    .db     0,0,0       ; RST 5 jump


ipl:
    ret

clrirq:
    reti

vbl:
    exx
    in      a,(VDP_STAT)

    ld      a,(frames)
    inc     a
    ld      (frames),a

    call    AYFX.FRAME

    exx
    ei
    reti


start:
    di
    call    clrirq                  ; release irq

	ld		sp,$7fff

    ld      a,$01                   ; disable timer interrupts
    out     ($01),a

    call    initmem
    call    initVDP
    call    initsfx

	call	seedrnd

    ld      hl,vbl
    ld      ($7006),hl

    ei

-:	call	titlescn
	call	game
	call	gameoverscn
	jr		{-}


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
#include "ayfxcustom.asm"
#include "ayfxplaySN.asm"

#include "font.asm"

#include "seg_data.asm"

    .echoln ""
    .echo "Rom size is ", $-$2000
    .echoln " bytes."
    .echoln ""

    .end

