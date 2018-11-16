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

	.align 16
reversetab:
	.word   33,-1,-33,0,1

	.align 16
enemyanims:
	.byte   $10,$13     ;ENEMY,ENEMY|128 ; enemyanim0
	.byte   $11,$12     ;ENEMY-1,ENEMY-1|128 ; enemyanim1 etc

	.align	64
leveldata:
	.word	level1, level2, level3, level4

	.align  16
winchanim:
	.byte   $00,$01
	.byte   $00,$04
	.byte   $87,$00
	.byte   $02,$00


scoreline:
	.byte	$38, $28, $34, $37, $2a, $0e, $1c, $1c, $1c, $1c, $1c, $00, $2d, $2e, $0e, $1c, $1c, $1c, $1c, $1c, $00, $31, $3b, $31, $0e, $1d, $00, $32, $2a, $33, $0e, $20



	.align  128
clouds:
	.byte	$00, $0a, $08, $09, $00, $00, $00, $00, $00, $00, $00, $0a, $0a, $09, $09, $00, $00, $00, $08, $08, $0a, $00, $00, $00, $00, $00, $00, $09, $08, $08, $0a, $00
	.byte	$00, $00, $00, $09, $09, $00, $00, $00, $00, $0a, $08, $00, $00, $00, $00, $09, $0a, $00, $00, $00, $09, $09, $08, $00, $00, $00, $00, $00, $00, $0a, $09, $00
	.byte	$00, $0a, $08, $09, $00, $00, $00, $00, $00, $00, $00, $0a, $0a, $09, $09, $00, $00, $00, $08, $08, $0a, $00, $00, $00, $00, $00, $00, $09, $08, $08, $0a, $00
