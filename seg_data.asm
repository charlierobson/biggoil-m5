seg_data_target = $7000

seg_data
.relocate seg_data_target

; dfile is mirrored by this map at +$400 bytes further on in memory,
; this is to allow quick indexing into the map by setting a single
; bit in the dfile pointer, bit 10 or bit 2 of H reg.
;
dfile:
	.ds		33*25

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
ctlBegin	= titleinputstates + 3
ctlRedef	= titleinputstates + 7

ctlFire		= gameinputstates + 3
ctlUp		= gameinputstates + 7
ctlDown		= gameinputstates + 11
ctlLeft		= gameinputstates + 15
ctlRight	= gameinputstates + 19

lastJ:
	.db		0
keybit:
	.db		0
keyport:
	.db		0
keyaddress:
	.word	0

tcd:
    .db     0
tt:
    .db     0

frames:
	.db		0

winchframe:
	.byte   0

headchar:
	.byte   PIPE_HEAD1

playerpos:
	.word   0

oldplayerpos:
	.word   0

playerhit:
	.byte   0

playerdirn:
	.word   0

retractptr:
	.word   0

timerv:
	.byte   0

scoretoadd:
	.byte   0

score:
	.word   0

hiscore:
	.word   0

lives:
	.byte   0

entrancecount:
	.byte	0

level:
	.byte	0

timeout:
	.byte   0

fuelchar:
	.byte   FUEL1

cldfrm:
	.byte   0

generatimer:
	.byte	0

leveltrig:
	.byte	0

lx:
	.byte	0

seed:
	.word	0

psound:
	.byte	0

;
; -=-=-=- GAP -=-=-=-
;

	.align	128
entrances:
	.fill	12*8,0          ; up to 10 entrances, 8 bytes apiece


newtone:
newtonep1=newtone+1
newtonep2=newtone+5
newtonep3=newtone+8
newtonep4=newtone+11
	.byte   $EF,$F9,$03,$00,$AD,$03,$02,$AA,$2D,$01,$A7,$FB,$00,$D0,$20
	.byte   $EF,$F9,$03,$00,$AD,$03,$02,$AA,$2D,$01,$A7,$FB,$00,$D0,$20

;
; -=-=-=- GAP -=-=-=-
;


.align $400
.if $ != $7400
;.fail "offscreen map needs to be at $x400 boundary"
.endif
offscreenmap:
	.fill   33*24

;
; -=-=-=- GAP -=-=-=-
;


;	.word   0               ; padding byte - do not remove
	.align  256
retractqueue:
	.fill   256,$ff

	.align  256
enemydata:
	.fill   EDSIZE*NENEMIES,0



initentrances:
	ld		hl,entrances

_c1:
	xor		a
	ld		(entrancecount),a
	ld		(_adval1),a
	inc		a
	ld		(_adval0),a
	ld		a,enemyanimL2R
	ld		(_animnum),a
	ld		de,dfile+$c7-33		    ; start checking at row 5
	call	checkcolumn

_c2:
	ld		a,$ff
	ld		(_adval0),a
	ld		(_adval1),a
	ld		a,enemyanimR2L
	ld		(_animnum),a
	ld		de,dfile+$e6-33

checkcolumn:
	ld		b,17

_nextrow:
	push	hl
	ld		hl,33
	add		hl,de
	ex		de,hl
	pop		hl

	ld		a,(de)
	cp		DOT
	call	z,_add
	djnz	_nextrow
	ret

_add:
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		hl
_adval0 = $+1
	ld		(hl),0
	inc		hl
_adval1 = $+1
	ld		(hl),0
	inc		hl
_animnum = $+1
	ld		(hl),0
	inc		hl
	inc		hl
	inc		hl
	inc		hl

	ld		a,(entrancecount)
	inc		a
	ld		(entrancecount),a
	ret



.endrelocate
seg_data_end
