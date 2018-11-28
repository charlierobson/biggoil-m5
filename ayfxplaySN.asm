	.module AYFX

; SN76489 version of AYFX player by SirMorris, 2018
; AY-3-8910 original by Shiru and AlCo, 2006-2007

; data structure

; cmd+vol (byte)	[TN--vvvv]				T = tone update, N = noise update
; note    (word)	[xxxxllll][xxmmmmmm]	data present only if T=1. l = lsb, m = msb
; noise   (byte)	[xxxxxwnn]				data present only if N=1. w=1 whitenoise, nn = noise rate

; PSG FREQ: F = 4000000 / 64 / nn							with nn in range 1..4095 (nn=0 acts as nn=1)
; SN FREQ:  F = 4000000 / 2 x reg value x divider (16)
; MSX to SN freq conversion is SMS = MSX / 2

; PSG NOISE:  0 - 1F
; SN NOISE :  0 - 3
; MSX to SN freg conversion is:
;   MSX noise 0 - F -> SN noise 00
;   MSX noise 10- 1F-> SN noise 01 
; SN is always white noise and fixed volume (0xC?)


_CHAN_ADDR:		.equ	0	;(W) current addr. channel is free if MSB = 0
_CHAN_TIME:		.equ	2	;(B) current play time
_CHAN_ID:		.equ	3	;(B) channel mask used, to build register data

_CHAN_SIZE = 4

_CHAN0 = 0
_CHAN1 = _CHAN_SIZE
_CHAN2 = _CHAN_SIZE*2

_BIT_T			.equ	7
_BIT_N			.equ	6



;=====================================
; INIT
; in HL is the address of the sfxbank.
;=====================================
INIT:
	inc		hl
	ld		(afxBnkAdr),hl					; store the start of the sfxbank

	xor		a								; silence all channels
	ld		(afxChDesc+_CHAN0),a
	ld		(afxChDesc+_CHAN1),a
	ld		(afxChDesc+_CHAN2),a
	ret


;=====================================
; FRAME
; ISR routine to generate sound.
;=====================================
FRAME:
	ld		ix,afxChDesc+_CHAN0
	call	_processChan
	ld		ix,afxChDesc+_CHAN1
	call	_processChan
	ld		ix,afxChDesc+_CHAN2
	call	_processChan

_processNoise:
	ret


_processChan:
	ld		h,(ix+_CHAN_ADDR+1)		; channel data address MSB
	dec		h
	inc		h
	ret		z						; nothing to do if msb is 0

	ld		l,(ix+_CHAN_ADDR)		; get sfx address low byte
	ld		e,(hl)					; cmd + volume
	inc		hl

	ld		a,e
	and		15
	or		(ix+_CHAN_ID)
	or		$90
	out		($20),a					; chan volume

	ld		a,e						; vol has been set, was this the effect terminator?
	cp		$3f
	jr		nz,_channelContinues

	ld		(ix+_CHAN_ADDR+1),0
	ret

_channelContinues:
	inc		(ix+_CHAN_TIME)

	bit		_BIT_T,e				; check if we have new tone val
	jr		z,_checkNoise

	ld		a,(hl)					; get 4 ls bits
	inc		hl
	or		(ix+_CHAN_ID)
	or		$80
	out		($20),a					; chan tone lsb

	ld		a,(hl)					; get 6 ms bits
	inc		hl
	out		($20),a					; chan tone msb

_checkNoise:
	bit		_BIT_N,e				; any noise to do?
	jr		nz,_updatePtr

_doNoise:
	inc		hl

	; do whatever noise stuff needs doing here

_updatePtr:
	ld		(ix+_CHAN_ADDR),l
	ld		(ix+_CHAN_ADDR+1),h
	ret


;=====================================
; PLAY
; Start playback of an SFX
; A = sfx number, 
; C = relative volume
;=====================================
PLAY:
	ld 		hl,(afxBnkAdr)
	ld		(afxChDesc+_CHAN_ADDR),hl
	ret
