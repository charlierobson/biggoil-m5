initsfx:
    ld      hl,afxsoundbank
    jp      AYFX.INIT

resettone:
initdrone:
generatetone:
drone:
longplay:
    ret


afxsoundbank:
    .dw fx01,fx02,fx03,fx04
    .dw fx05,fx06,fx07,fx08
    .dw fx09,fx10,fx11,fx12
    .dw fx13,fx14,fx15,fx16
    .dw fx17,fx18

fx01:   .incbin data/0.tfx
fx02:   .incbin data/1.tfx
fx03:   .incbin data/2.tfx
fx04:   .incbin data/3.tfx
fx05:   .incbin data/4.tfx
fx06:   .incbin data/5.tfx
fx07:   .incbin data/6.tfx
fx08:   .incbin data/7.tfx
fx09:   .incbin data/8.tfx
fx10:   .incbin data/9.tfx
fx11:   .incbin data/10.tfx
fx12:   .incbin data/11.tfx
fx13:   .incbin data/12.tfx
fx14:   .incbin data/13.tfx
fx15:   .incbin data/14.tfx
fx16:   .incbin data/15.tfx
fx17:   .incbin data/16.tfx
fx18:   .incbin data/17.tfx
