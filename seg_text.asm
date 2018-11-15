scnLevel1:
	.incbin data/lvl1.binlz

scnLevel2:
	.incbin	data/lvl2.binlz

scnLevel3:
	.incbin	data/lvl3.binlz

scnLevel4:
	.incbin	data/lvl4.binlz

scnTitle:
	.incbin data/title.binlz

scnEnd:
	.incbin data/end.binlz

	.align 256
turntable:
	.byte   $3f,$3f,$00,$00,$3e,$00,$00,$00
	.byte   $36,$36,$3e,$00,$00,$00,$00,$00
	.byte   $00,$3d,$3f,$00,$36,$00,$00,$00
	.byte   $00,$00,$00,$00,$00,$00,$00,$00
	.byte   $3d,$00,$3f,$00,$36,$00,$00,$00
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
	.word	scnLevel1, scnLevel2, scnLevel3, scnLevel4

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
