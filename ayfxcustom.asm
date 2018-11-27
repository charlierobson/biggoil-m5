initsfx:
    ld      hl,smfx
    jp      AYFX.INIT

resettone:
initdrone:
generatetone:
drone:
longplay:
    ret


smfx:
    .incbin    "data/0.smfx"
