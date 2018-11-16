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

    call    initVDP
	call	seedrnd

entitled:
	call	titlescn

	xor		a
	ld		(level),a
	ld		(score),a
	ld		(score+1),a

	ld		a,4
	ld		(lives),a

	ld		a,DOWN
	ld		(retractqueue-1),a

	call	displayscoreline

;;	call	initsfx

newlevel:
	call	displaylevel
	call	createmap
	call	initentrances

	ld		hl,dfile
	ld		de,offscreenmap
	ld		bc,33*5
	ldir

;;	call	initdrone

restart:
	ld		a,$99
	ld		(timerv),a
	call	inittimer

	call	initialiseenemies
	call	initenemytimer

	call	displaymen

	ld		hl,dfile+INITIAL_OFFS	; set initial position and direction
	ld		(playerpos),hl

	ld		a,DOWN					; player's 'last' move was down so correct pipe can be drawn
	ld		(playerdirn),a

	ld		hl,retractqueue			; initialise the pipeline retract lifo
	ld		(retractptr),hl

	xor		a
	ld		(playerhit),a

mainloop:
	call	copyDFile
	call	readGameInput

	ld		a,(ctlFire)				; if fire button has just been released then reset the retract tone
	and		3
	cp		2
;;	call	z,resettone

	call	updatecloud
;;	call	drone

	call	generateenemy

	ld		a,(frames)
	and		63
	call	z,dotimer				; returns with z set if timer has hit 0
	jr		z,_die

	call	updateenemies
	ld		a,(playerhit)
	and		a
	jr		z,_playon

_die:
	call	loselife
	jp		nz,restart

	ld		b,75
	call	waitFrames

	call	gameoverscreen

	jp		entitled


_playon:
	ld		a,(ctlFire)				; retract happens quickly so check every frame
	and		1
	jr		z,_noretract

	ld		hl,(retractptr)			; because the retract buffer sits on a 256 byte
	xor		a						; boundary we can use the lsb to tell when it's empty
	cp		l
	jr		z,mainloop				; even if we can't retract, jump back

	call	retract					; retract the head
	ld		a,(frames)
	and		1
	call	z,retract				; do an extra retract every other frame

	ld		a,(winchframe)			; update winch animation
	inc		a
	ld		(winchframe),a

	call	showwinch				; so it's about a speed and a half
	ld		a,(frames)
	and		3						; prepare the z flag
	ld		a,18					; set up sound number in case it's time
;;	call	z,generatetone
	jp		mainloop

_noretract:
	ld		a,(frames)				; only dig every nth frame
	and		3						; could be game speed controller?
	cp		3
	jr		nz,mainloop

	ld		a,(headchar)			; animate the digging head
	xor		PIPE_HEAD1 ^ PIPE_HEAD2
	ld		(headchar),a

	call	tryup					; the tryxxx functions return with z set
	jr		z,_headupdate			; if that direction was taken

	call	trydown
	jr		z,_headupdate

	call	tryleft
	jr		z,_headupdate

	call	tryright

_headupdate:
	call	showwinch				; animate the winch

	ld		hl,(playerpos)			; update the digging head
	ld		a,(headchar)
	ld		(hl),a

	ld		a,(scoretoadd)			; any score last frame?
	and		a			
	jp		z,mainloop

	ld		c,a						; add score
	xor		a
	ld		(scoretoadd),a
	ld		b,a
	call	addscore
	call	checkhi

	call	lorryfill

;	call	countdots
;	jp		nz,mainloop

	call	detectdot
	jp		z,mainloop

nextlevel:
	ld		a,12
	call	AFXPLAY

	call	tidyup
	call	levelup
	call	displaylvl

	jp		newlevel

;-------------------------------------------------------------------------------

inittimer:
	ld		a,(timerv)
	jr		_timerdd

dotimer:
	ld		a,(timerv)
	and		a
	ret		z
	dec		a
	daa
	ld		(timerv),a
_timerdd:
	push	af
	and		$f0
	rrca
	rrca
	rrca
	rrca
	add		a,ZEROZ+128
	ld		de,dfile+TIMER_OFFS
	ld		(de),a
	pop		af
	and		$0f
	add		a,ZEROZ+128
	inc		de
	ld		(de),a
	ret

;-------------------------------------------------------------------------------

countdots:
	ld		hl,dfile+6*33
	ld		de,16*33
	ld		c,0

-:	ld		a,(hl)
	cp		DOT
	jr		nz,{+}

	inc		c

+:	inc		hl
	dec		de
	ld		a,d
	or		e
	jr		nz,{-}

	ld		a,c
	or		a
	ret



detectdot:
	ld		hl,dfile+6*33
	ld		bc,16*33
	ld		a,DOT
	cpir
	ret


AFXPLAY:
    ret

;-------------------------------------------------------------------------------

loselife:
	ld		a,(lives)
	cp		1
	jr		nz,{+}

	ld		a,13
	call	AFXPLAY

+:	call	tidyup
	ld		a,(lives)
	dec		a
	ld		(lives),a
	ret


tidyup:
	ld		b,4
-:	push	bc
	call	copyDFile
	call	invertScreen
	pop		bc
	djnz	{-}

	call	resetenemies

-:	call	copyDFile
	call	retract						; retract the head
	call	retract
	call	retract
	ld		a,(winchframe)			; update winch animation
	inc		a
	ld		(winchframe),a
	call	showwinch
	ld		a,(retractptr)
	and		a
	jr		nz,{-}
	ret


interrupt_routine:
    in      a,(VDP_STAT)                ; Acknowledge VDP interrupt
    ei
    reti


#include "charmap.asm"

#include "title.asm"
#include "redefine.asm"

#include "player.asm"
#include "enemies.asm"
#include "whimsy.asm"
#include "score.asm"

#include "leveldata.asm"

#include "random.asm"
#include "decrunch.asm"
#include "input.asm"
#include "vdp.asm"

#include "seg_data.asm"
#include "seg_text.asm"

#include "font.asm"

    .fill   $2000-$

    .end
