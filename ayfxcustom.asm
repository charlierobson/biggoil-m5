initdrone:
	ld		a,(level)				; level is 0..3 incl
	rlca
	rlca							; 0,4,8,12
	ld		b,a
	ld		a,40					; 40,36,32,28
	sub		b
	ld		(dronerate),a
	xor		a
	ld		(droneframe),a
    ret

drone:
	ld		a,(droneframe)
	dec		a
	ld		(droneframe),a
	ret     nc

	ld		a,(dronerate)
	ld		(droneframe),a
	ld		a,(drone1+1)
	xor		$0f
	ld		(drone1+1),a
    ld      hl,drone1
	jp		AFX.PLAYON3




resettone:
	ld		hl,newtone+14
	ld		de,newtone
	ld		bc,14
	ldir
	ret


generatetone:
	ld		de,12
	ld		hl,(newtonep1)
	sbc		hl,de
	ld		(newtonep1),hl
	ld		hl,(newtonep2)
	sbc		hl,de
	ld		(newtonep2),hl
	ld		hl,(newtonep3)
	sbc		hl,de
	ld		(newtonep3),hl
	ld		hl,(newtonep4)
	sbc		hl,de
	ld		(newtonep4),hl
	ld		hl,newtone
	jp		AFX.PLAY



smfx3:
    .incbin    "data/3.smfx"
smfx4:
    .incbin    "data/4.smfx"
smfx7:
    .incbin    "data/7.smfx"
smfx12:
    .incbin    "data/12.smfx"
smfx13:
    .incbin    "data/13.smfx"
smfx14:
    .incbin    "data/14.smfx"
smfx17:
    .incbin    "data/17.smfx"
