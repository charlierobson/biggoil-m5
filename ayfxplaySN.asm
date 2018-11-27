	.module AYFX

;SN76489 version of AYFX player
;by SirMorris, AY-3-8910 original
;by Shiru and AlCo, 2006-2007

; data structure
;
; nt
; 00 = no updates
; 01 = update tone
; 10 = update noise
; 11 = update tone + noise

; cmd+vol byte  [nt--vvvv]				; vvvv = volume attenuation: $0 = full vol, $F = silent
; note (word) 	[----llll][--hhhhhh]	; only if t = true
; noise (byte)	[--------]				; only if n = true

; cmd_vol byte	[00111111]				; end marker 0x3F - silences channel



; PSG FREQ :  F = 4MHz / 64 / nn      ;with nn in range 1..4095 (nn=0 acts as nn=1)
; SN FREQ  :  F = 4MHz / 2 x reg value x divider (16)
; MSX to SN freq conversion is SMS = MSX / 2

; PSG NOISE:  0 - 1F
; SN NOISE :  0 - 3
; MSX to SN freg conversion is:
;   MSX noise 0 - F -> SN noise 00
;   MSX noise 10- 1F-> SN noise 01 
; SN is always white noise and fixed volume (0xC?)



; cmd+vol byte	[TN--vvvv]				T = tone update, N = noise update
; note (word)	[xxxxllll][xxmmmmmm]	(only if T=1, l = lsb, m = msb)
; noise (byte)	[xxxxxwnn]				(only if N=1) w=1 whitenoise


_CHAN_ADDR:		.equ	0	;(W) current addr. (channel is free, if MSB==$00)
_CHAN_TIME:		.equ	2	;(B) current play time
_CHAN_ID:		.equ	3	;(B) channel mask
_BIT_T			.equ	7
_BIT_N			.equ	6

 _CHAN_SIZE = 4


;=====================================
; INIT
; in HL is the address of the sfxbank.
;=====================================
INIT:
	ld		(afxBnkAdr),hl					; store the start of the sfxbank
	xor		a
	ld		(afxChDesc),a
	ld		(afxChDesc+_CHAN_SIZE),a
	ld		(afxChDesc+_CHAN_SIZE+_CHAN_SIZE),a
	ret

;=====================================
; FRAME
; ISR routine to generate sound.
;=====================================
FRAME:
	ld		b,$03					; 3 channels to process
	ld		ix,afxChDesc			; ix contains start of channel data

_processChan:
	ld		h,(ix+_CHAN_ADDR+1)		; channel data address MSB
	dec		h
	inc		h
	jp		z,_nextChannel			; skip channel if not active

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
	jp		z,_channelDone

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
	jr		z,_bumpTimer

_doNoise:
	inc		hl
	jr		_bumpTimer


_channelDone:
	ld		hl,0

_bumpTimer:
	inc		(ix+_CHAN_TIME)
	ld		(ix+_CHAN_ADDR),l
	ld		(ix+_CHAN_ADDR+1),h
 
_nextChannel:
	ld		de,_CHAN_SIZE
	add		ix,de
	dec		b
	jp		nz,_processChan
	ret


;=====================================
; PLAY
; Start playback of an SFX
; A = sfx number, 
; C = relative volume
;=====================================
PLAY:
	ld 		hl,(afxBnkAdr)		;Add the start of the sfxbank to the offset
	ld		(afxChDesc+_CHAN_ADDR),hl
	ret
