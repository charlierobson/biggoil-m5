;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;
.module INPUT

readtitleinput:
	ld		hl,titleinputstates
	jr		_ri

readinput:
	ld		hl,gameinputstates
_ri:
	in		a,($37)					; cache joystick direction data
	ld		(lastJ),a

	; hl points at first input state block,
	; return from update function pointing to next
	;
	call	updateinputstate ; (up)
	call	updateinputstate ; (down)
	call	updateinputstate ;  etc.
	call	updateinputstate ;

	; fall into here for last input

updateinputstate:
	ld		c,(hl)					; get key row input port
	in		a,(c)					; read key row
	inc		hl						; point to row mask
	and		(hl)					; result will be non-zero if required key is down

	inc		hl						; points at js mask
	ld		b,$ff					; match-all mask
	jr		nz,{+}					; skip joystick read if key pressed

	ld		b,(hl)					; get j/s mask
	ld		a,(lastJ)				; no key was detected, so test stick

+:	inc		hl						; point at key state
	sla		(hl)					; (key & 3) = 0 - not pressed, 1 - just pressed, 2 - just released and >3 - held

	and		b						; if a key was already detected A&B will be !0
	jr		z,{+}					; else js bit was just tested

	set		0,(hl)					; signify impulse

+:	inc		hl						; ready for next read
	ret
