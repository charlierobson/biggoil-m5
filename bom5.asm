    loadaddr=$2000
    .org loadaddr

#include "gamedefs.asm"

    .db     0           ; identifier
    .dw     start       ; start execution address
    .dw     ipl         ; IPL address
    .db     0,0,0       ; RST 4 jump
    .db     0,0,0       ; RST 5 jump


ipl:
    ret


vbl:
    exx
    push    af
    ld      hl,(frames)
    inc     hl
    ld      (frames),hl

    call    AYFX.FRAME

    in      a,(VDP_STAT)
    pop     af
    exx
    ei

clrirq:
    reti



start:
    di
	ld		sp,$7fff

    ld      a,$01                   ; disable timer interrupts
    out     ($01),a

    call    initmem
    call    initVDP

	call	seedrnd

    ld      hl,vbl
    ld      ($7006),hl

    call    clrirq                  ; release irq
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
#include "helpscrn.asm"

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
    .echo "Rom size is ", $-loadaddr
    .echoln " bytes."
    .echoln ""

    .end

