;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;
.module TSC


_tt1:
	.asc	" space to start "
_tt2:
	.asc	"r - redefine key"
_tt3:
	.asc	"i - instructions"

	.align	8
_ttbl:
	.dw		_tt1,_tt2,_tt1,_tt3


titlescn:
	ld		hl,title
	ld		de,dfile
	call	decrunch
	call	displayscoreonts
	call	displayhionts

    call    AYFX.INIT

_titleloop:
	call	framesync

	ld		a,(frames+1)
	and		3
	add		a,a
	ld		hl,_ttbl
	or		l
	ld		l,a
	ld		a,(hl)
	inc		hl
	ld		h,(hl)
	ld		l,a

  	ld		de,dfile+$300
	ld		bc,16
	ldir

_nochangetext:
	ld		  a,(frames)
	and		  16
	jr		  nz,_noflash

	ld		  hl,dfile+$300
	ld		  b,16
_ilop:
	ld		  a,(hl)
	xor		 $80
	ld		  (hl),a
	inc		 hl
	djnz	_ilop

_noflash:
	call	readtitleinput

	ld		a,(redef)
	and		3
	cp		1
	jr		nz,{+}

	call	redefinekeys			; redefine keys and copy any altered fire/start key
	ld		hl,(fire-3)
	ld		(begin-3),hl
	jr		titlescn

+:	ld		a,(begin)
	and		3
	cp		1
	ret		z

	ld		a,(insts)
	and		3
	cp		1
	jr		nz,{+}

	call	instructions
	jr		titlescn

+:	ld		a,(jsbegin)
	and		3
	cp		1
	jr		nz,_titleloop

	ret
