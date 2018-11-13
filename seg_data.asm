seg_data_target = $7100

seg_data
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
	.byte	$31,%00000001,%00000000,0		; startgame	(1)
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

lastJ:
	.db		0

colr:
	.db		0

.endrelocate
seg_data_end
