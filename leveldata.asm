;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;
.module LEV

levelup:
	ld		a,(level)
	inc		a
	cp		8
	jr		nz,{+}
	ld		a,7
+:	ld		(level),a
	ret


displaylevel:
	ld		a,(level)			    ; level to HL, caps at 8
	and		3					    ; cycle of 4 levels, stick on level 4 after 2 cycles
	rlca
	or		leveldata & 255
	ld		l,a
	ld		h,leveldata / 256
	ld		a,(hl)
	inc		hl
	ld		h,(hl)
	ld		l,a
	ld		de,dfile
	call	decrunch
	call	displayscore
	call	displayhi
	call	displaymen

displaylvl:
	ld		a,(level)
	add		a,ONEZ
	ld		hl,dfile+LVL_OFFS
	ld		(hl),a
	ret


displaymen:
	ld		a,(lives)
	add		a,ZEROZ
	ld		hl,dfile+MEN_OFFS
	ld		(hl),a
	ret


displayscoreline:
	ld		hl,scoreline			; render the scoreline
	ld		de,dfile+23*33+1
	ld		bc,32
	ldir
	ret



createmap:
	ld		hl,dfile				; copy top 5 lines
	ld		de,offscreenmap
	ld		bc,33*5
	ldir

	ld		bc,33*19				; for remainder of lines do some processing...

_scryit:
	ld		a,(hl)
	cp		0
	jr		z,_storeit
	cp		DOT
	jr		z,_storeit
	cp		$76
	jr		z,_storeit
	ld		a,128
_storeit:
	ld		(de),a
	inc		hl
	inc		de
	dec		bc
	ld		a,b
	or		c
	jr		nz,_scryit
	ret
