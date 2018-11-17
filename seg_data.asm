initmem:
	ld		hl,$7000
	ld		de,$7001
	ld		bc,$e00
	xor		a
	ld		(hl),a
	ldir

    ld      hl,seg_data
    ld      de,seg_data_target
    ld      bc,seg_data_end - seg_data
    ldir
	ret


level1:
	.incbin data/lvl1.binlz

level2:
	.incbin	data/lvl2.binlz

level3:
	.incbin	data/lvl3.binlz

level4:
	.incbin	data/lvl4.binlz

title:
	.incbin data/title.binlz

end:
	.incbin data/end.binlz


	.align 16
reversetab:
	.word   33,-1,-33,0,1

; the turntable tells us which character should be displayed at a pipe junction
; we make an index from the last direction and the latest direction.
; current dir << 3 + new dir
; see UP, DOWN etc in gamedefs.
;
; up -> up = 0
; up -> right = 1
; up -> left = 4
; right -> up = 8
; etc. etc.
;
	.align 256
turntable:
	.byte   $85,$85,$00,$00,$84,$00,$00,$00
	.byte   $03,$03,$84,$00,$00,$00,$00,$00
	.byte   $00,$02,$85,$00,$03,$00,$00,$00
	.byte   $00,$00,$00,$00,$00,$00,$00,$00
	.byte   $02,$00,$85,$00,$03,$00,$00,$00
	.byte   $00,$00,$00,$00,$00,$00,$00,$00

	.align  16
winchanim:
	.byte   $00,$01
	.byte   $00,$04
	.byte   $87,$00
	.byte   $02,$00

	.align	64
leveldata:
	.word	level1, level2, level3, level4

	.align 16
enemyanims:
	.byte   $10,$13     ;ENEMY,ENEMY|128 ; enemyanim0
	.byte   $11,$12     ;ENEMY-1,ENEMY-1|128 ; enemyanim1 etc



scoreline:
	.byte	$38, $28, $34, $37, $2a, $0e, $1c, $1c, $1c, $1c, $1c, $00, $2d, $2e, $0e, $1c, $1c, $1c, $1c, $1c, $00, $31, $3b, $31, $0e, $1d, $00, $32, $2a, $33, $0e, $20


	.align  128
clouds:
	.byte	$00, $0a, $08, $09, $00, $00, $00, $00, $00, $00, $00, $0a, $0a, $09, $09, $00, $00, $00, $08, $08, $0a, $00, $00, $00, $00, $00, $00, $09, $08, $08, $0a, $00
	.byte	$00, $00, $00, $09, $09, $00, $00, $00, $00, $0a, $08, $00, $00, $00, $00, $09, $0a, $00, $00, $00, $09, $09, $08, $00, $00, $00, $00, $00, $00, $0a, $09, $00
	.byte	$00, $0a, $08, $09, $00, $00, $00, $00, $00, $00, $00, $0a, $0a, $09, $09, $00, $00, $00, $08, $08, $0a, $00, $00, $00, $00, $00, $00, $09, $08, $08, $0a, $00


; dfile is mirrored at +$400 bytes further on in memory,
; this is to allow quick indexing into the map by setting
; a single bit in the dfile pointer, bit 2 of H reg.
;
dfile = $7000
offscreenmap = $7400

; initialised data goes here
seg_data_target = $7320

; uninitialised data goes here
seg_bss_target = $7720


; retractqueue code requires a 'backstop' - the byte at $77ff is used.
;
retractqueue = $7800
entrances = $7900

seg_data:
.relocate seg_data_target

;   7       6       5       4       3       2       1       0    bit
;-------+-------+-------+-------+-------+-------+-------+-------.
; ENTER | SPACE |  ---  |  ---  |R.SHIFT|L.SHIFT| FUNC  | CTRL  | 30
;-------+-------+-------+-------+-------+-------+-------+-------+
;   8   |   7   |   6   |   5   |   4   |   3   |   2   |   1   | 31
;-------+-------+-------+-------+-------+-------+-------+-------+
;   I   |   U   |   Y   |   T   |   R   |   E   |   W   |   Q   | 32
;-------+-------+-------+-------+-------+-------+-------+-------+
;   K   |   J   |   H   |   G   |   F   |   D   |   S   |   A   | 33
;-------+-------+-------+-------+-------+-------+-------+-------+
;   ,   |   M   |   N   |   B   |   V   |   C   |   X   |   Z   | 34
;-------+-------+-------+-------+-------+-------+-------+-------+
;   \   |   _   |   /   |   .   |   ^   |   -   |   0   |   9   | 35
;-------+-------+-------+-------+-------+-------+-------+-------+
;   ]   |   :   |   ;   |   L   |   [   |   @   |   P   |   O   | 36
;-------+-------+-------+-------+-------+-------+-------+-------+
; R.JOY | R.JOY | R.JOY | R.JOY | L.JOY | L.JOY | L.JOY | L.JOY | 37
;   |   |  <--  |   ^   |  -->  |   |   |  <--  |   ^   |  -->  |
;   v   |       |   |   |       |   v   |       |   |   |       |
;-------+-------+-------+-------+-------+-------+-------+-------'
;
; input state data:
;
; key row input port $30-37
; key mask
; joystick bit mask from port $37, or 0 if no js
; trigger impulse

titleinputstates:
	.byte	$30,%01000000,%00000000,0		; startgame	(SP)
	.byte	$32,%00001000,%00000000,0		; redefine	(R)
	.byte	$30,%00000000,%00000000,0
	.byte	$30,%00000000,%00000000,0
	.byte	$30,%00000000,%00000000,0

gameinputstates:
	.byte	$30,%01000000,%00000000,0		; fire	(SP)
	.byte	$32,%00000001,%00000010,0		; up	(Q)
	.byte	$33,%00000001,%00001000,0		; down	(A)
	.byte	$36,%00000001,%00000100,0		; left	(O)
	.byte	$36,%00000010,%00000001,0		; right	(P)

; calculate actual input impulse addresses
;
begin	= titleinputstates + 3
redef	= titleinputstates + 7
fire	= gameinputstates + 3
up		= gameinputstates + 7
down	= gameinputstates + 11
left	= gameinputstates + 15
right	= gameinputstates + 19

headchar:
	.byte   PIPE_HEAD1

fuelchar:
	.byte   FUEL1


newtone:
newtonep1=newtone+1
newtonep2=newtone+5
newtonep3=newtone+8
newtonep4=newtone+11
	.byte   $EF,$F9,$03,$00,$AD,$03,$02,$AA,$2D,$01,$A7,$FB,$00,$D0,$20
	.byte   $EF,$F9,$03,$00,$AD,$03,$02,$AA,$2D,$01,$A7,$FB,$00,$D0,$20



; =-=-=-=-= self-modifying codez =-=-=-=-=


; called from initentrances in leveldata
;
addv:
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		hl
adval0 = $+1
	ld		(hl),0
	inc		hl
adval1 = $+1
	ld		(hl),0
	inc		hl
animnum = $+1
	ld		(hl),0
	inc		hl
	inc		hl
	inc		hl
	inc		hl

	ld		a,(entrancecount)
	inc		a
	ld		(entrancecount),a
	ret


.if $ >= $7400
.fail "relocatable data is too large to fit the gap"
.endif

.endrelocate
seg_data_end



seg_bss:
.varloc seg_bss_target,$e0
	.var	byte, lastJ
	.var	byte, keybit
	.var	byte, keyport
	.var	word, keyaddress
	.var	byte, tcd
	.var	byte, tt
	.var	byte, frames
	.var	byte, winchframe
	.var	word, playerpos
	.var	word, oldplayerpos
	.var	byte, playerhit
	.var	word, playerdirn
	.var	word, retractptr
	.var	byte, timerv
	.var	byte, scoretoadd
	.var	word, score
	.var	word, hiscore
	.var	byte, lives
	.var	byte, entrancecount
	.var	byte, level
	.var	byte, timeout
	.var	byte, cldfrm
	.var	byte, generatimer
	.var	byte, leveltrig
	.var	byte, lx
	.var	word, rndseed
	.var	byte, psound
	.var	byte[ENEMYSIZE*NENEMIES], enemydata
