	.module AYFX

; SN76489 version of AYFX player by SirMorris, 2018
; AY-3-8910 original by Shiru and AlCo, 2006-2007

; data structure

; cmd+vol (byte)	[TN--vvvv]				T = tone update, N = noise update
; note    (word)	[xxxxllll][xxmmmmmm]	data present only if T=1. l = lsb, m = msb
; noise   (byte)	[xxxxxwnn]				data present only if N=1. w=1 whitenoise, nn = noise rate

; PSG NOISE:  0 - 1F
; SN NOISE :  0 - 3
; MSX to SN freg conversion is:
;   MSX noise 0 - F -> SN noise 00
;   MSX noise 10- 1F-> SN noise 01 
; SN is always white noise and fixed volume (0xC?)


CHAN_ADDR:		.equ	0	;(W) current addr. channel is free if MSB = 0
CHAN_TIME:		.equ	2	;(B) current play time
CHAN_ID:		.equ	3	;(B) channel mask used, to build register data

CHAN_SIZE = 4

CHAN1 = 0
CHAN2 = CHAN_SIZE
CHAN3 = CHAN_SIZE*2

_BIT_T			.equ	7
_BIT_N			.equ	6
_BIT_DRONE		.equ	5


;=====================================
; INIT
; in HL is the address of the sfxbank.
;=====================================
INIT:
	xor		a								; silence all channels
	ld		(afxChDesc+CHAN1),a
	ld		(afxChDesc+CHAN2),a
	ld		(afxChDesc+CHAN3),a
	ret


;=====================================
; FRAME
; ISR routine to generate sound.
;=====================================
FRAME:
	ld		ix,afxChDesc+CHAN1
	call	_processChan
	ld		ix,afxChDesc+CHAN2
	call	_processChan
	ld		ix,afxChDesc+CHAN3
	call	_processChan

_processNoise:
	ret


_processChan:
	ld		h,(ix+CHAN_ADDR+1)		; channel data address MSB
	dec		h
	inc		h
	ret		z						; nothing to do if msb is 0

	ld		l,(ix+CHAN_ADDR)		; get sfx address low byte
	ld		e,(hl)					; cmd + volume
	inc		hl

	ld		a,e
	and		15
	or		(ix+CHAN_ID)
	or		$90
	out		($20),a					; chan volume

	ld		a,e						; vol has been set, was this the effect terminator?
	cp		$3f
	jr		nz,CHANnelContinues

	ld		(ix+CHAN_ADDR+1),0
	ret

CHANnelContinues:
	inc		(ix+CHAN_TIME)

	bit		_BIT_T,e				; check if we have new tone val
	jr		z,_checkNoise

	ld		a,(hl)					; get 4 ls bits
	inc		hl
	or		(ix+CHAN_ID)
	or		$80
	out		($20),a					; chan tone lsb

	ld		a,(hl)					; get 6 ms bits
	inc		hl
	out		($20),a					; chan tone msb

	bit		_BIT_DRONE,e			; if this is a drone then return w/o updating pointers
	ret		nz

_checkNoise:
	bit		_BIT_N,e				; any noise to do?
	jr		z,_updatePtr

_doNoise:
	inc		hl

	; do whatever noise stuff needs doing here

_updatePtr:
	ld		(ix+CHAN_ADDR),l
	ld		(ix+CHAN_ADDR+1),h
	ret


;=====================================
; PLAY
; Start playback of an SFX
; HL = sfx data
;=====================================
PLAY:
	; find an empty channel
	ld		bc,(afxChDesc+CHAN_ADDR+1)
	ld		a,b
	and		a
	jr		nz,_on2

	ld		(afxChDesc+CHAN_ADDR),hl
	ret

_on2:
	ld		(afxChDesc+CHAN_ADDR+CHAN_SIZE),hl
	ret
