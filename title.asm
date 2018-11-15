titleInit:
    call    prepTitleInputs

    ld      a,50
    ld      (tcd),a
    ret



titleUpdate:
    ld      a,(tcd)
    dec     a
    ld      (tcd),a
    ret     nz

    ld      a,50
    ld      (tcd),a

    ld      a,(tt)
    xor     $10
    ld      (tt),a

    ld      hl,tts
    add     a,l
    ld      l,a
    ld      de,$0817
    ld      b,16
    jp      textOutN

    .align  16
tts:
    .asc    "FIRE: START GAME"
    .asc    "R: REDEFINE KEYS"
