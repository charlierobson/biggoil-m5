	.module AYFX

;MSX version of AYFX player
;by Shiru and AlCo, 2006-2007
;ported to Sega Master System  
;by Huey - Trilobyte-SMS, 2012
;
;sjasm version
;
;Init:
;	ld hl,addr. of sfx bank (*.afb)
;	call AYFX.INIT
;
;Call sfx:
;	ld a,sfx number (0..255)
;	ld c,relative volume (-15..15, 0=normal)
;	call AYFX.PLAY
;
;On frame interrupt (every 1/50 sec, _after_ music player)
;	call AYFX.FRAME


; data structure
;
; nt
; 00 = no updates
; 01 = update tone
; 10 = update noise
; 11 = update tone + noise


; cmd+vol byte  [NntTvvvv] 		T/N -> 1=off;  v=0 silence
; note (word)  	[ffffffff][xxxxffff] 	(only if t=1)
; noise (byte)	[xxxnnnnn]	     	(only if n=1)	
; ....
; end marker:
; cmd_vol byte	[11010000] 0xD0		; T and N are off, volume is 0
; noise (byte)	[00100000] 0x20		; noise is 0




; PSG FREQ :  F = 4MHz / 64 / nn      ;with nn in range 1..4095 (nn=0 acts as nn=1)
; SN FREQ  :  F = 4MHz / 2 x reg value x divider (16)
; MSX to SN freq conversion is SMS = MSX / 2

; PSG NOISE:  0 - 1F
; SN NOISE :  0 - 3
; MSX to SN freg conversion is:
;   MSX noise 0 - F -> SN noise 00
;   MSX noise 10- 1F-> SN noise 01 
; SN is always white noise and fixed volume (0xC?)


; new :
; cmd+vol byte  [NntTvvvv] 		T/N -> 1=off;  v=0 silence
; note (word)  	[xxxfffff][xxxfffff] 	(only if t=1)
; noise (byte)	[xxxxxwnn]	     	(only if n=1) w=1 whitenoise


_CHAN_ADDR:		.equ	0	;(W) current addr. (channel is free, if MSB==$00)
_CHAN_TIME:		.equ	2	;(B) current play time
_CHAN_ID:		.equ	3	;(B) channel mask
 
;=====================================
; INIT
; in HL is the address of the sfxbank.
;=====================================
INIT:
	inc 	hl
	ld		(afxBnkAdr),hl					;store the start of the sfxbank
 
	ld 		hl,afxChDesc					;initialize the variables of sfx replayer
	ld 		bc,$1500
-:	ld 		(hl),c
	inc 	hl
	djnz 	{-}

	dec 	bc								; load BC with 0xffff
	ld 		(afxChDesc+_CHAN_TIME),bc		; set the current play time to 0xffff 
	ld 		(afxChDesc+_CHAN_TIME+7),bc		; "
	ld 		(afxChDesc+_CHAN_TIME+14),bc	; "
	
	ret
 
 
;=====================================
; FRAME
; ISR routine to generate sound.
;=====================================
FRAME:
	ld 		b,$03					; 3 channels to process
	ld 		ix,afxChDesc			; ix contains start of channel data
	
afxFrame0:
	push 	bc						; store counter

	xor		a
	ld 		h,(ix+_CHAN_ADDR+1)		; channel data address MSB
	cp		h
	jp 		z,_nextChannel			; skip channel if not active

	;--- get the sfx address (we already have H)
	ld 		l,(ix+_CHAN_ADDR)		; get sfx address low byte

	ld 		e,(hl)					; load the volume+CMD in E
	inc 	hl

	ld		a,e
	and		15
	or		(ix+_CHAN_ID)
	or		$90
	out 	($20),a					; chan volume

	;--- Test if need to update the tone regs
	bit 	5,e						;Bit 5 is 1 if we have new tone val
	jr 		z,_checkNoise

	ld 		d,(hl)
	inc 	hl
	ld 		a,(hl)
	inc 	hl

	and		15
	or		(ix+_CHAN_ID)
	or		$80
	out 	($20),a					; chan tone

	ld		a,d
	and		$7f
	out 	($20),a					; chan tone

_checkNoise:
	bit 	6,e
	jr 		z,_bumpTimer
	
	ld 		a,(hl)
	cp		$20
	jr		nz,_doNoise

	; finished

	xor		a
	ld		(ix+_CHAN_ADDR),a
	ld 		(ix+_CHAN_ADDR+1),a
	jr		_nextChannel


_doNoise:
	inc hl
	
	ld c,SG			;����� �������� ����
	ld d,6
	out (c),d
	ld c,iyh			;SG(off)/$A1(on)
	out (c),a
 
afxFrame3:
	pop bc				;��������������� �������� ����� � B
	push bc
	inc b				;���������� ������� ��� ������ TN (4..2)
	
	ld a,%01101111		;����� ��� ������ TN
	
	
	; M I X E R
afxFrame4:
	rrc e				;�������� ����� � �����
	rrca
	djnz afxFrame4
	ld d,a
	
	ld a,7
	out (SG),a
	in a,($22)
	xor e				;����������� ����� ������
	and d
	xor e
	ld c,iyh			;SG(off)/$A1(on)
	;sb by Dioniso
	 or $80
	 and $bf
	out (c),a			;������� ������� � ������


	; end sfx processing. set new timer and addres values 
afxFrame5:
	ld c,(ix+_CHAN_TIME)			;����������� ������� �������
	ld b,(ix+_CHAN_TIME+1)
	inc bc
 
	ld (ix+_CHAN_TIME),c
	ld (ix+_CHAN_TIME+1),b
	
	ld (ix+_CHAN_ADDR),l			;��������� ������������ �����
	ld (ix+_CHAN_ADDR+1),h
 
_nextChannel:	
	;-- Set the next channel
	ld bc,7				;channel data size is 7
	add ix,bc			
	pop bc				; restore channel counter
	dec b				
	jp nz,afxFrame0			; Process only 3 channels
	ret
	
 
;=====================================
; PLAY
; Start playback of an SFX
; A = sfx number, 
; C = relative volume
;=====================================
PLAY:
	ld	c,0
	; calculate SFX address index
	push bc				;store volume in C

	ld de,0			
	ld h,e
	ld l,a
	add hl,hl
	ld bc,(afxBnkAdr)		;Add the start of the sfxbank to the offset
	add hl,bc
	
	;--- Retrieve the SFX start addres formthe addres index
	ld c,(hl)
	inc hl
	ld b,(hl)
	add hl,bc			; The start of the SFx is relative to the SFXbank
	push hl				; Store the addres
 
	ld hl,afxChDesc			; Chan data pointer 
	ld b,3				; number of channels to check
	;--- Determin the channel with the lowest priority
afxPlay0:
	inc hl
	inc hl				; point to the TIMER (LOW)
	;--- Check if SFX is shorter than current sfx
	ld a,(hl)			;Get the LOW byte of the TIMER value
	inc hl				
	inc hl				; point to the volume value
	;--- Only play in channel if chan SFX is shorter than best matching  channel
	cp e				; e contains the timer of best matching channel
	jr c,afxPlay1			; skip channel is current channel sfx time (remaining) is > prevoius channel timer
	ld c,a				; store timer low byte in C
	ld a,(hl)			; get volume value
	;--- Only play in channel is chan SFX is louder(vol) than best matching  channel (relative vol).
	cp d				; d contains the volume of the best matching channel
	jr c,afxPlay1			; skip channel if channel volume is < best matching channel vol 
	
	;--- Set the current channel as best matching playback channel
	ld e,c				;store timer in e
	ld d,a				;store volume in d
	push hl				;push the pointer to the current chandata + 4 bytes
	pop ix				;retrieve the pointer to IX for later use

	;--- Next channel
afxPlay1:
	inc hl
	inc hl
	inc hl				; point to start of new channel
	djnz afxPlay0
 
 	; Store the new SFX info in the best matchin channel
	pop de				;get the SFX start address from the stack  
	ld (ix-4),e			;set the start addres
	ld (ix-3),d
	ld (ix-2),b			;set timer to 0 (b is 0 due to djnz)
	ld (ix-1),b
	pop bc				;retrieve the volume form the stack
	ld (ix-0),c			;set the relative volume
	ret