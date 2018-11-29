initdrone:
    ld      hl,drone1
    ld      (afxChDesc+CHAN3+CHAN_ADDR),hl
    ret

drone:
    ld      a,(frames)
    and     64
    jr      z,{+}
    ld      a,$0f
+:  ld      (drone1+1),a
    ret




resettone:
generatetone:

longplay:
    ret


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
