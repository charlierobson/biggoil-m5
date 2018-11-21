
        ORG     2000h

        DB      02h
        DB      07h
        DB      " {-{-"

        ; Entry Point
        ; --- START PROC L2007 ---
L2007:  DI
        LD      SP,7300h
        LD      HL,208Ch
        LD      BC,1011h
        OTIR
        LD      HL,2081h
        LD      (7006h),HL
        CALL    L27BF
        CALL    L2AF4
        LD      HL,7300h
        LD      DE,7301h
        LD      BC,00FFh
        LD      (HL),00h
        LDIR
        LD      HL,20D2h
        LD      DE,7300h
        LD      BC,0030h
        LDIR
        CALL    L3EEF
        CALL    L2CD8
        CALL    L22EA
        LD      A,0FFh
        LD      (733Dh),A
        LD      HL,0301h
        LD      (733Eh),HL
        LD      A,01h
        LD      (7335h),A
        LD      HL,2DF0h
        LD      (7400h),HL
L2056:  EI
        LD      HL,(7330h)
        DEC     L
        JR      NZ,L2056
        INC     H
        LD      (7330h),HL
        LD      HL,7F00h
        LD      DE,7F00h
        LD      BC,0080h
        CALL    L3EF8
        CALL    L2C57
        CALL    L2D29
        CALL    L33BC
        CALL    L3E37
        CALL    L3D60
        CALL    L2315
        JR      L2056

        ; Entry Point
        ; --- START PROC L2081 ---
L2081:  EX      AF,AF'
        IN      A,(11h)
        LD      A,01h
        LD      (7330h),A
        EX      AF,AF'
        RETI

L208C:  DB      01h
        DB      80h
        DB      0E2h
        DB      81h
        DB      0Fh
        DB      82h
        DB      0FEh
        DB      83h
        DB      05h
        DB      84h
        DB      7Eh             ; '~'
        DB      85h
        DB      04h
        DB      86h
        DB      01h
        DB      87h

        ; Entry Point
        ; --- START PROC L209C ---
L209C:  CALL    L20A6
        PUSH    AF
        CALL    L20A6
        POP     HL
        LD      L,A
        RET

        ; --- START PROC L20A6 ---
L20A6:  LD      HL,(737Eh)
        LD      A,L
        ADD     A,A
        ADD     A,A
        LD      A,L
        INC     A
        LD      L,A
        LD      A,H
        AND     90h
        JR      Z,L20B8
        XOR     90h
        JR      NZ,L20B9
L20B8:  SCF
L20B9:  LD      A,H
        RLA
        LD      H,A
        LD      (737Eh),HL
        ADD     A,L
        RET

        ; Entry Point
        ; --- START PROC L20C1 ---
L20C1:  IN      A,(50h)         ; 'P'
        RLCA
        LD      HL,7378h
        LD      A,(HL)
        RLA
        LD      (HL),A
        AND     03h
        DEC     A
        RET     NZ
        LD      (7392h),A
        RET

L20D2:  DB      0EBh
        DB      0BEh
        DB      82h
        DB      28h             ; '('
        DB      0C3h
        DB      3Ch             ; '<'
        DB      0AAh
        DB      0AAh
        DB      0C5h
        DB      3Ah             ; ':'
        DB      00h
        DB      3Ch             ; '<'
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0AAh
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      0F0h
        DB      60h             ; '`'
        DB      50h             ; 'P'
        DB      0D0h
        DB      0A0h
        DB      20h             ; ' '
        DB      20h             ; ' '
        DB      0B0h
        DB      90h
        DB      50h             ; 'P'
        DB      50h             ; 'P'
        DB      90h
        DB      "PPP<B"
        DB      99h
        DB      0A1h
        DB      0A1h
        DB      99h
        DB      42h             ; 'B'
        DB      3Ch             ; '<'
        DB      00h
        DB      00h
        DB      00h
        DB      0Fh
        DB      3Fh             ; '?'
        DB      70h             ; 'p'
        DB      40h             ; '@'
        DB      70h             ; 'p'
        DB      00h
        DB      00h
        DB      00h
        DB      80h
        DB      0E0h
        DB      76h             ; 'v'
        DB      19h
        DB      71h             ; 'q'
        DB      7Fh
        DB      7Fh
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      1Fh
        DB      0Fh
        DB      07h
        DB      00h
        DB      0F1h
        DB      0F6h
        DB      0F8h
        DB      0E0h
        DB      0C0h
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      1Dh
        DB      3Eh             ; '>'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      00h
        DB      00h
        DB      00h
        DB      70h             ; 'p'
        DB      0F8h
        DB      0FCh
        DB      0FCh
        DB      0FCh
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      1Fh
        DB      1Fh
        DB      0Fh
        DB      06h
        DB      00h
        DB      00h
        DB      0ECh
        DB      0ECh
        DB      0D8h
        DB      0F8h
        DB      0F0h
        DB      0E0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      1Eh
        DB      3Bh             ; ';'
        DB      00h
        DB      00h
        DB      0Ch
        DB      3Ch             ; '<'
        DB      0D0h
        DB      10h
        DB      " @>-5"
        DB      1Dh
        DB      01h
        DB      00h
        DB      00h
        DB      00h
        DB      0B0h
        DB      0B8h
        DB      0F8h
        DB      78h             ; 'x'
        DB      98h
        DB      0F0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      1Fh
        DB      3Fh             ; '?'
        DB      72h             ; 'r'
        DB      72h             ; 'r'
        DB      07h
        DB      0Ch
        DB      00h
        DB      00h
        DB      0F8h
        DB      0FCh
        DB      4Eh             ; 'N'
        DB      4Eh             ; 'N'
        DB      0E0h
        DB      30h             ; '0'
        DB      08h
        DB      19h
        DB      19h
        DB      38h             ; '8'
        DB      3Ch             ; '<'
        DB      3Fh             ; '?'
        DB      00h
        DB      00h
        DB      10h
        DB      98h
        DB      98h
        DB      5Ch             ; '\'
        DB      3Ch             ; '<'
        DB      0FCh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      02h
        DB      07h
        DB      01h
        DB      02h
        DB      02h
        DB      00h
        DB      78h             ; 'x'
        DB      84h
        DB      8Ch
        DB      7Ch             ; '|'
        DB      9Eh
        DB      7Eh             ; '~'
        DB      0FEh
        DB      0Dh
        DB      1Dh
        DB      3Fh             ; '?'
        DB      7Fh
        DB      7Fh
        DB      7Fh
        DB      3Fh             ; '?'
        DB      00h
        DB      0FEh
        DB      0FEh
        DB      0FCh
        DB      0F0h
        DB      0C0h
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      03h
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      3Eh             ; '>'
        DB      3Fh             ; '?'
        DB      00h
        DB      00h
        DB      0C0h
        DB      0F0h
        DB      0F8h
        DB      0F8h
        DB      0FCh
        DB      7Ch             ; '|'
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      1Fh
        DB      0Ch
        DB      03h
        DB      07h
        DB      00h
        DB      00h
        DB      7Ch             ; '|'
        DB      7Ch             ; '|'
        DB      78h             ; 'x'
        DB      0B0h
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      00h
        DB      19h
        DB      3Fh             ; '?'
        DB      37h             ; '7'
        DB      19h
        DB      06h
        DB      20h             ; ' '
        DB      0C0h
        DB      00h
        DB      98h
        DB      0FCh
        DB      74h             ; 't'
        DB      98h
        DB      60h             ; '`'
        DB      0Fh
        DB      0Dh
        DB      06h
        DB      01h
        DB      03h
        DB      03h
        DB      01h
        DB      00h
        DB      0F0h
        DB      0D0h
        DB      60h             ; '`'
        DB      80h
        DB      0C0h
        DB      40h             ; '@'
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      03h
        DB      06h
        DB      06h
        DB      0Fh
        DB      00h
        DB      18h
        DB      0F4h
        DB      0F8h
        DB      38h             ; '8'
        DB      7Ch             ; '|'
        DB      0FCh
        DB      0FCh
        DB      0Fh
        DB      1Fh
        DB      30h             ; '0'
        DB      38h             ; '8'
        DB      1Dh
        DB      03h
        DB      03h
        DB      00h
        DB      0FCh
        DB      0FCh
        DB      8Eh
        DB      86h
        DB      9Ch
        DB      78h             ; 'x'
        DB      00h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0FFh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      80h
        DB      40h             ; '@'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      07h
        DB      0Fh
        DB      0Fh
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      0Fh
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      00h
        DB      03h
        DB      0Fh
        DB      1Fh
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      7Fh
        DB      7Fh
        DB      00h
        DB      00h
        DB      03h
        DB      07h
        DB      03h
        DB      01h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0F0h
        DB      0F8h
        DB      0F8h
        DB      0FCh
        DB      7Ch             ; '|'
        DB      07h
        DB      1Fh
        DB      0Fh
        DB      07h
        DB      03h
        DB      01h
        DB      00h
        DB      00h
        DB      0E0h
        DB      0F8h
        DB      0FCh
        DB      0FEh
        DB      0FEh
        DB      0FFh
        DB      0FFh
        DB      7Fh
        DB      00h
        DB      00h
        DB      03h
        DB      0Fh
        DB      1Fh
        DB      0Fh
        DB      03h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0F0h
        DB      0F8h
        DB      0F8h
        DB      0FCh
        DB      0FCh
        DB      07h
        DB      1Fh
        DB      3Fh             ; '?'
        DB      7Fh
        DB      3Fh             ; '?'
        DB      0Fh
        DB      03h
        DB      00h
        DB      0E0h
        DB      0F8h
        DB      0FCh
        DB      0FEh
        DB      0FEh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      00h
        DB      00h
        DB      03h
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      "??????6"
        DB      22h             ; '"'
        DB      00h
        DB      00h
        DB      "????;"
        DB      11h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      0C1h
        DB      0C1h
        DB      0CFh
        DB      0C7h
        DB      0C3h
        DB      0C7h
        DB      0C6h
        DB      0C4h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      0C0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      07h
        DB      1Fh
        DB      3Fh             ; '?'
        DB      3Fh             ; '?'
        DB      7Fh
        DB      7Fh
        DB      7Fh
        DB      66h             ; 'f'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      7Fh
        DB      7Fh
        DB      7Fh
        DB      39h             ; '9'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      07h
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      16h
        DB      12h
        DB      00h
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      1Dh
        DB      09h
        DB      00h

        ; --- START PROC L22EA ---
L22EA:  LD      HL,2482h
        LD      DE,7610h
        LD      BC,000Bh
        LDIR
        LD      HL,7620h
        LD      BC,1800h
L22FB:  LD      (HL),C
        INC     L
        DJNZ    L22FB
        LD      DE,2020h
        LD      (7640h),DE
        LD      (7642h),DE
        LD      HL,7600h
        LD      BC,1000h
L2310:  LD      (HL),C
        INC     L
        DJNZ    L2310
        RET

        ; --- START PROC L2315 ---
L2315:  LD      HL,7610h
        LD      BC,0B20h
        OTIR
        LD      HL,7640h
        LD      DE,7600h
        LD      BC,0606h
        CALL    L2351
        BIT     5,(HL)
        JR      NZ,L2330
        JP      L2344

L2330:  INC     L
        LD      DE,7606h
        LD      BC,040Ah
        CALL    L2351
        INC     L
        LD      DE,760Ah
        LD      BC,0610h
        CALL    L2351
L2344:  LD      HL,7600h
        LD      BC,0B00h
L234A:  LD      (HL),C
        INC     L
        DJNZ    L234A
        JP      L236B

        ; --- START PROC L2351 ---
L2351:  LD      A,(DE)
        AND     A
        JR      NZ,L2359
        INC     E
        DJNZ    L2351
        RET

L2359:  LD      A,C
        SUB     B
        LD      B,A
        LD      A,(HL)
        BIT     5,A
        JR      NZ,L2366
        AND     1Fh
        CP      B
        RET     C
        RET     Z
L2366:  LD      A,B
        ADD     A,80h
        LD      (HL),A
        RET

        ; --- START PROC L236B ---
L236B:  LD      HL,7640h
        LD      DE,7610h
        LD      IX,7620h
        LD      BC,0200h
        LD      A,(HL)
        BIT     5,A
        JR      NZ,L23A2
        BIT     7,A
        JR      Z,L239E
        LD      A,20h           ; ' '
        LD      (7641h),A
        LD      (7642h),A
        LD      (7643h),A
        LD      A,9Fh
        LD      (7612h),A
        LD      A,0BFh
        LD      (7615h),A
        LD      A,0DFh
        LD      (7618h),A
        CALL    L23BF
L239E:  CALL    L23E7
        RET

L23A2:  INC     L
L23A3:  LD      A,(HL)
        BIT     7,A
        CALL    NZ,L23BF
        LD      A,(HL)
        BIT     6,A
        CALL    NZ,L23E7
        PUSH    HL
        EX      DE,HL
        LD      DE,0003h
        ADD     HL,DE
        LD      E,08h
        ADD     IX,DE
        EX      DE,HL
        POP     HL
        INC     L
        DJNZ    L23A3
        RET

        ; --- START PROC L23BF ---
L23BF:  PUSH    BC
        PUSH    HL
        PUSH    DE
        LD      A,(HL)
        SUB     40h             ; '@'
        LD      (HL),A
        ADD     A,A
        ADD     A,A
        LD      C,A
        LD      A,B
        ADD     A,A
        LD      E,A
        LD      D,00h
        LD      HL,23E1h
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      B,00h
        LD      HL,24A5h
        ADD     HL,BC
        LD      C,04h
        LDIR
        POP     DE
        POP     HL
        POP     BC
        RET

        ; Entry Point
        ; --- START PROC L23E3 ---
L23E3:  JR      Z,L245B
        JR      NZ,L245D
        ; --- START PROC L23E7 ---
L23E7:  PUSH    BC
        PUSH    HL
        PUSH    DE
        LD      A,(IX+06h)
        AND     A
        JP      NZ,L244F
        LD      L,(IX+00h)
        LD      H,(IX+01h)
        INC     HL
        LD      A,(HL)
        LD      (IX+06h),A
        INC     HL
        LD      (IX+00h),L
        LD      (IX+01h),H
        DEC     HL
        DEC     HL
        LD      A,(HL)
        INC     A
        JP      Z,L246E
        DEC     A
        LD      C,A
        AND     0Fh
        JP      Z,L2449
        DEC     A
        LD      B,A
        LD      A,C
        AND     0F0h
        RRCA
        RRCA
        RRCA
        LD      E,A
        LD      D,00h
        LD      HL,248Dh
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
L2424:  ADD     HL,HL
        DJNZ    L2424
        LD      A,L
        RRCA
        RRCA
        RRCA
        RRCA
        AND     0Fh
        LD      B,A
        POP     DE
        PUSH    DE
        LD      A,(DE)
        AND     0F0h
        ADD     A,B
        LD      (DE),A
        INC     E
        LD      A,H
        LD      (DE),A
        DEC     E
        LD      A,(IX+02h)
        LD      (IX+04h),A
        LD      A,(IX+03h)
        LD      (IX+05h),A
        JP      L244F

L2449:  LD      (IX+04h),0E5h
        POP     DE
        PUSH    DE
L244F:  INC     E
        INC     E
        LD      A,(DE)
        AND     0F0h
        LD      B,A
        LD      L,(IX+04h)
        LD      H,(IX+05h)
        ; --- START PROC L245B ---
L245B:  LD      A,(HL)
        AND     0Fh
        ; --- START PROC L245D ---
L245D:  RRCA
        ADD     A,B
        LD      (DE),A
        INC     HL
        LD      (IX+04h),L
        LD      (IX+05h),H
        DEC     (IX+06h)
        POP     DE
        POP     HL
        POP     BC
        RET

        ; --- START PROC L246E ---
L246E:  POP     DE
        POP     HL
        LD      A,(HL)
        SUB     20h             ; ' '
        LD      (HL),A
        INC     E
        INC     E
        LD      A,(DE)
        OR      0Fh
        LD      (DE),A
        DEC     E
        DEC     E
        XOR     A
        LD      (IX+06h),A
        POP     BC
        RET

L2482:  DB      80h
        DB      00h
        DB      9Fh
        DB      0A0h
        DB      00h
        DB      0BFh
        DB      0C0h
        DB      00h
        DB      0DFh
        DB      0E0h
        DB      0FFh
        DB      0FCh
        DB      01h
        DB      0DEh
        DB      01h
        DB      0C4h
        DB      01h
        DB      0ABh
        DB      01h
        DB      93h
        DB      01h
        DB      7Dh             ; '}'
        DB      01h
        DB      67h             ; 'g'
        DB      01h
        DB      53h             ; 'S'
        DB      01h
        DB      40h             ; '@'
        DB      01h
        DB      2Eh             ; '.'
        DB      01h
        DB      1Dh
        DB      01h
        DB      0Dh
        DB      01h
        DB      25h             ; '%'
        DB      25h             ; '%'
        DB      0F5h
        DB      24h             ; '$'
        DB      5Ch             ; '\'
        DB      25h             ; '%'
        DB      0F5h
        DB      24h             ; '$'
        DB      7Dh             ; '}'
        DB      25h             ; '%'
        DB      0F5h
        DB      24h             ; '$'
        DB      0E8h
        DB      25h             ; '%'
        DB      05h
        DB      25h             ; '%'
        DB      5Fh             ; '_'
        DB      26h             ; '&'
        DB      05h
        DB      25h             ; '%'
        DB      70h             ; 'p'
        DB      26h             ; '&'
        DB      05h
        DB      25h             ; '%'
        DB      0B1h
        DB      26h             ; '&'
        DB      05h
        DB      25h             ; '%'
        DB      0D0h
        DB      26h             ; '&'
        DB      05h
        DB      25h             ; '%'
        DB      0E5h
        DB      26h             ; '&'
        DB      05h
        DB      25h             ; '%'
        DB      0FEh
        DB      26h             ; '&'
        DB      05h
        DB      25h             ; '%'
        DB      1Bh
        DB      27h             ; '''
        DB      05h
        DB      25h             ; '%'
        DB      3Ch             ; '<'
        DB      27h             ; '''
        DB      15h
        DB      25h             ; '%'
        DB      4Fh             ; 'O'
        DB      27h             ; '''
        DB      15h
        DB      25h             ; '%'
        DB      5Ah             ; 'Z'
        DB      27h             ; '''
        DB      15h
        DB      25h             ; '%'
        DB      73h             ; 's'
        DB      27h             ; '''
        DB      15h
        DB      25h             ; '%'
        DB      94h
        DB      27h             ; '''
        DB      15h
        DB      25h             ; '%'
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      00h
        DB      01h
        DB      02h
        DB      03h
        DB      04h
        DB      05h
        DB      06h
        DB      07h
        DB      07h
        DB      07h
        DB      07h
        DB      07h
        DB      07h
        DB      07h
        DB      07h
        DB      07h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      02h
        DB      94h
        DB      0Ch
        DB      0A4h
        DB      04h
        DB      33h             ; '3'
        DB      08h
        DB      73h             ; 's'
        DB      08h
        DB      0A3h
        DB      08h
        DB      0A3h
        DB      08h
        DB      0A3h
        DB      10h
        DB      0A4h
        DB      0Ch
        DB      0B4h
        DB      04h
        DB      43h             ; 'C'
        DB      08h
        DB      83h
        DB      08h
        DB      0B3h
        DB      08h
        DB      0B3h
        DB      08h
        DB      0B3h
        DB      10h
        DB      94h
        DB      0Ch
        DB      0A4h
        DB      04h
        DB      33h             ; '3'
        DB      08h
        DB      73h             ; 's'
        DB      08h
        DB      0A3h
        DB      08h
        DB      0A3h
        DB      08h
        DB      0A3h
        DB      10h
        DB      83h
        DB      08h
        DB      63h             ; 'c'
        DB      10h
        DB      43h             ; 'C'
        DB      08h
        DB      33h             ; '3'
        DB      08h
        DB      33h             ; '3'
        DB      08h
        DB      33h             ; '3'
        DB      10h
        DB      0FFh
        DB      34h             ; '4'
        DB      08h
        DB      34h             ; '4'
        DB      08h
        DB      34h             ; '4'
        DB      08h
        DB      04h
        DB      04h
        DB      0A5h
        DB      04h
        DB      34h             ; '4'
        DB      08h
        DB      64h             ; 'd'
        DB      08h
        DB      84h
        DB      08h
        DB      94h
        DB      08h
        DB      83h
        DB      08h
        DB      63h             ; 'c'
        DB      08h
        DB      33h             ; '3'
        DB      08h
        DB      63h             ; 'c'
        DB      08h
        DB      33h             ; '3'
        DB      08h
        DB      0C0h
        DB      08h
        DB      35h             ; '5'
        DB      08h
        DB      0FFh
        DB      34h             ; '4'
        DB      08h
        DB      34h             ; '4'
        DB      08h
        DB      34h             ; '4'
        DB      08h
        DB      04h
        DB      04h
        DB      0A5h
        DB      04h
        DB      34h             ; '4'
        DB      08h
        DB      64h             ; 'd'
        DB      08h
        DB      84h
        DB      08h
        DB      94h
        DB      08h
        DB      0A3h
        DB      02h
        DB      0B3h
        DB      02h
        DB      0A3h
        DB      02h
        DB      93h
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      93h
        DB      02h
        DB      0A3h
        DB      02h
        DB      93h
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      83h
        DB      02h
        DB      93h
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      23h             ; '#'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      84h
        DB      08h
        DB      74h             ; 't'
        DB      08h
        DB      0C0h
        DB      08h
        DB      35h             ; '5'
        DB      08h
        DB      0FFh
        DB      0A3h
        DB      02h
        DB      0B3h
        DB      02h
        DB      0A3h
        DB      02h
        DB      93h
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      93h
        DB      02h
        DB      0A3h
        DB      02h
        DB      93h
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      83h
        DB      02h
        DB      93h
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      83h
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      73h             ; 's'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      63h             ; 'c'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      23h             ; '#'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      43h             ; 'C'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      23h             ; '#'
        DB      02h
        DB      13h
        DB      02h
        DB      85h
        DB      01h
        DB      04h
        DB      01h
        DB      44h             ; 'D'
        DB      01h
        DB      84h
        DB      01h
        DB      03h
        DB      01h
        DB      43h             ; 'C'
        DB      01h
        DB      83h
        DB      01h
        DB      02h
        DB      01h
        DB      0C0h
        DB      02h
        DB      85h
        DB      01h
        DB      04h
        DB      01h
        DB      44h             ; 'D'
        DB      01h
        DB      84h
        DB      01h
        DB      03h
        DB      01h
        DB      43h             ; 'C'
        DB      01h
        DB      83h
        DB      01h
        DB      02h
        DB      01h
        DB      0FFh
        DB      33h             ; '3'
        DB      06h
        DB      32h             ; '2'
        DB      06h
        DB      0A3h
        DB      06h
        DB      73h             ; 's'
        DB      06h
        DB      32h             ; '2'
        DB      06h
        DB      0A3h
        DB      06h
        DB      0C0h
        DB      06h
        DB      12h
        DB      10h
        DB      0FFh
        DB      05h
        DB      01h
        DB      45h             ; 'E'
        DB      01h
        DB      85h
        DB      01h
        DB      0A5h
        DB      01h
        DB      05h
        DB      01h
        DB      25h             ; '%'
        DB      01h
        DB      45h             ; 'E'
        DB      01h
        DB      65h             ; 'e'
        DB      01h
        DB      85h
        DB      01h
        DB      0A5h
        DB      01h
        DB      04h
        DB      01h
        DB      14h
        DB      01h
        DB      24h             ; '$'
        DB      01h
        DB      34h             ; '4'
        DB      01h
        DB      44h             ; 'D'
        DB      01h
        DB      54h             ; 'T'
        DB      01h
        DB      64h             ; 'd'
        DB      01h
        DB      74h             ; 't'
        DB      01h
        DB      84h
        DB      01h
        DB      94h
        DB      01h
        DB      0A4h
        DB      01h
        DB      0B4h
        DB      01h
        DB      03h
        DB      01h
        DB      23h             ; '#'
        DB      01h
        DB      43h             ; 'C'
        DB      01h
        DB      63h             ; 'c'
        DB      01h
        DB      83h
        DB      01h
        DB      0A3h
        DB      01h
        DB      02h
        DB      01h
        DB      32h             ; '2'
        DB      01h
        DB      62h             ; 'b'
        DB      01h
        DB      92h
        DB      01h
        DB      0FFh
        DB      74h             ; 't'
        DB      02h
        DB      84h
        DB      02h
        DB      0A4h
        DB      02h
        DB      03h
        DB      02h
        DB      23h             ; '#'
        DB      02h
        DB      84h
        DB      02h
        DB      0A4h
        DB      02h
        DB      03h
        DB      02h
        DB      23h             ; '#'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      0A4h
        DB      02h
        DB      03h
        DB      02h
        DB      23h             ; '#'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      53h             ; 'S'
        DB      02h
        DB      0FFh
        DB      04h
        DB      01h
        DB      12h
        DB      02h
        DB      24h             ; '$'
        DB      03h
        DB      32h             ; '2'
        DB      01h
        DB      44h             ; 'D'
        DB      02h
        DB      52h             ; 'R'
        DB      03h
        DB      44h             ; 'D'
        DB      01h
        DB      32h             ; '2'
        DB      02h
        DB      24h             ; '$'
        DB      03h
        DB      12h
        DB      01h
        DB      0FFh
        DB      0B6h
        DB      02h
        DB      0B3h
        DB      02h
        DB      05h
        DB      04h
        DB      63h             ; 'c'
        DB      02h
        DB      15h
        DB      02h
        DB      13h
        DB      04h
        DB      25h             ; '%'
        DB      02h
        DB      84h
        DB      02h
        DB      35h             ; '5'
        DB      04h
        DB      34h             ; '4'
        DB      02h
        DB      45h             ; 'E'
        DB      02h
        DB      95h
        DB      04h
        DB      0FFh
        DB      04h
        DB      01h
        DB      44h             ; 'D'
        DB      01h
        DB      74h             ; 't'
        DB      01h
        DB      0A4h
        DB      01h
        DB      03h
        DB      01h
        DB      23h             ; '#'
        DB      01h
        DB      0C0h
        DB      02h
        DB      23h             ; '#'
        DB      01h
        DB      03h
        DB      01h
        DB      0A4h
        DB      01h
        DB      74h             ; 't'
        DB      01h
        DB      44h             ; 'D'
        DB      01h
        DB      04h
        DB      01h
        DB      0C0h
        DB      01h
        DB      0FFh
        DB      33h             ; '3'
        DB      08h
        DB      53h             ; 'S'
        DB      08h
        DB      73h             ; 's'
        DB      08h
        DB      83h
        DB      08h
        DB      0A3h
        DB      08h
        DB      02h
        DB      08h
        DB      22h             ; '"'
        DB      08h
        DB      32h             ; '2'
        DB      08h
        DB      33h             ; '3'
        DB      08h
        DB      53h             ; 'S'
        DB      08h
        DB      73h             ; 's'
        DB      08h
        DB      83h
        DB      08h
        DB      0A3h
        DB      08h
        DB      02h
        DB      08h
        DB      22h             ; '"'
        DB      08h
        DB      32h             ; '2'
        DB      08h
        DB      0FFh
        DB      02h
        DB      04h
        DB      83h
        DB      04h
        DB      12h
        DB      04h
        DB      93h
        DB      04h
        DB      22h             ; '"'
        DB      04h
        DB      0A3h
        DB      04h
        DB      32h             ; '2'
        DB      04h
        DB      0B3h
        DB      04h
        DB      0C0h
        DB      03h
        DB      0FFh
        DB      35h             ; '5'
        DB      02h
        DB      25h             ; '%'
        DB      02h
        DB      0A5h
        DB      02h
        DB      0B5h
        DB      02h
        DB      0C0h
        DB      03h
        DB      0FFh
        DB      84h
        DB      01h
        DB      0A4h
        DB      01h
        DB      03h
        DB      01h
        DB      33h             ; '3'
        DB      01h
        DB      53h             ; 'S'
        DB      01h
        DB      73h             ; 's'
        DB      01h
        DB      53h             ; 'S'
        DB      01h
        DB      33h             ; '3'
        DB      01h
        DB      03h
        DB      01h
        DB      0A4h
        DB      01h
        DB      84h
        DB      01h
        DB      0C0h
        DB      02h
        DB      0FFh
        DB      84h
        DB      01h
        DB      94h
        DB      01h
        DB      0B4h
        DB      01h
        DB      03h
        DB      01h
        DB      13h
        DB      01h
        DB      33h             ; '3'
        DB      01h
        DB      43h             ; 'C'
        DB      01h
        DB      53h             ; 'S'
        DB      01h
        DB      33h             ; '3'
        DB      01h
        DB      23h             ; '#'
        DB      01h
        DB      13h
        DB      01h
        DB      0B4h
        DB      01h
        DB      0A4h
        DB      01h
        DB      94h
        DB      01h
        DB      74h             ; 't'
        DB      01h
        DB      0C0h
        DB      03h
        DB      0FFh
        DB      84h
        DB      01h
        DB      94h
        DB      01h
        DB      0A4h
        DB      01h
        DB      0B4h
        DB      01h
        DB      03h
        DB      01h
        DB      13h
        DB      01h
        DB      23h             ; '#'
        DB      01h
        DB      33h             ; '3'
        DB      01h
        DB      43h             ; 'C'
        DB      01h
        DB      53h             ; 'S'
        DB      01h
        DB      43h             ; 'C'
        DB      01h
        DB      33h             ; '3'
        DB      01h
        DB      23h             ; '#'
        DB      01h
        DB      13h
        DB      01h
        DB      03h
        DB      01h
        DB      0B4h
        DB      01h
        DB      0A4h
        DB      01h
        DB      94h
        DB      01h
        DB      84h
        DB      01h
        DB      74h             ; 't'
        DB      01h
        DB      0C0h
        DB      04h
        DB      0FFh

        ; --- START PROC L27BF ---
L27BF:  LD      C,40h           ; '@'
        LD      DE,7800h
L27C4:  LD      B,10h
        LD      HL,2824h
        CALL    L2B29
        LD      A,C
        ADD     A,10h
        LD      C,A
        CP      80h
        JR      NZ,L27C4
        LD      BC,1000h
        CALL    L2B29
        LD      HL,7A40h
        LD      BC,0100h
        LDIR
        LD      HL,2844h
        LD      BC,1000h
        CALL    L2B29
        LD      HL,7B80h
        LD      BC,0080h
        LDIR
        LD      HL,2874h
        LD      BC,0280h
        LDIR
        LD      DE,7A40h
        LD      HL,2854h
        LD      C,09h
L2803:  CALL    L2815
        DEC     C
        JR      NZ,L2803
        LD      HL,7800h
        LD      DE,6000h
        LD      BC,0800h
        JP      L3EF8

        ; --- START PROC L2815 ---
L2815:  PUSH    HL
        CALL    L281A
        POP     HL
        ; --- START PROC L281A ---
L281A:  LD      B,20h           ; ' '
L281C:  LD      A,(DE)
        XOR     (HL)
        LD      (DE),A
        INC     DE
        INC     HL
        DJNZ    L281C
        RET

L2824:  DB      0Ch
        DB      0Ah
        DB      04h
        DB      02h
        DB      07h
        DB      0Ah
        DB      03h
        DB      0Dh
        DB      00h
        DB      05h
        DB      08h
        DB      0Dh
        DB      0Ch
        DB      01h
        DB      08h
        DB      06h
        DB      "ljhm|zx}"
        DB      80h
        DB      88h
        DB      84h
        DB      8Ch
        DB      80h
        DB      90h
        DB      84h
        DB      94h
        DB      0B0h
        DB      0B8h
        DB      0B4h
        DB      0BCh
        DB      0B0h
        DB      0C0h
        DB      0B4h
        DB      0C4h
        DB      0C8h
        DB      0D0h
        DB      0CCh
        DB      0D4h
        DB      0C8h
        DB      0D8h
        DB      0CCh
        DB      0DCh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      04h
        DB      00h
        DB      00h
        DB      09h
        DB      16h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      20h             ; ' '
        DB      00h
        DB      00h
        DB      90h
        DB      68h             ; 'h'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      04h
        DB      05h
        DB      05h
        DB      02h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      60h             ; '`'
        DB      90h
        DB      0B0h
        DB      0B0h
        DB      40h             ; '@'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      06h
        DB      0Fh
        DB      09h
        DB      06h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0E0h
        DB      20h             ; ' '
        DB      0C0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      06h
        DB      09h
        DB      0Dh
        DB      0Dh
        DB      02h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      20h             ; ' '
        DB      0A0h
        DB      0A0h
        DB      40h             ; '@'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      04h
        DB      07h
        DB      03h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      60h             ; '`'
        DB      90h
        DB      0F0h
        DB      60h             ; '`'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      03h
        DB      05h
        DB      05h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      30h             ; '0'
        DB      0D8h
        DB      18h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      06h
        DB      06h
        DB      05h
        DB      05h
        DB      02h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0C0h
        DB      40h             ; '@'
        DB      40h             ; '@'
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0Ch
        DB      1Bh
        DB      19h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C0h
        DB      0A0h
        DB      0A0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      02h
        DB      02h
        DB      03h
        DB      03h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      40h             ; '@'
        DB      0A0h
        DB      0A0h
        DB      60h             ; '`'
        DB      60h             ; '`'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      31h             ; '1'
        DB      4Ah             ; 'J'
        DB      0Ah
        DB      12h
        DB      22h             ; '"'
        DB      42h             ; 'B'
        DB      79h             ; 'y'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      8Ch
        DB      "RRRRR"
        DB      8Ch
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      11h
        DB      32h             ; '2'
        DB      52h             ; 'R'
        DB      92h
        DB      0FAh
        DB      12h
        DB      11h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      8Ch
        DB      "RRRRR"
        DB      8Ch
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      "1JJ2JJ1"
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      8Ch
        DB      "RRRRR"
        DB      8Ch
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      88h
        DB      91h
        DB      0A1h
        DB      0B9h
        DB      0A5h
        DB      0A5h
        DB      98h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0C6h
        DB      ")))))"
        DB      0C6h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      67h             ; 'g'
        DB      95h
        DB      15h
        DB      25h             ; '%'
        DB      45h             ; 'E'
        DB      85h
        DB      0F7h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      "wUUUUUw"
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0F7h
        DB      85h
        DB      85h
        DB      0E5h
        DB      15h
        DB      15h
        DB      15h
        DB      0E7h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      "wUUUUUUw"
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      "`px|~??"
        DB      1Fh
        DB      07h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0Ch
        DB      1Ch
        DB      3Ch             ; '<'
        DB      7Ch             ; '|'
        DB      0FCh
        DB      0F8h
        DB      0F8h
        DB      0F0h
        DB      0C0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0F0h
        DB      0FCh
        DB      0FFh
        DB      7Fh
        DB      3Fh             ; '?'
        DB      0Eh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0Eh
        DB      7Eh             ; '~'
        DB      0FEh
        DB      0FCh
        DB      0F8h
        DB      0E0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0Fh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      7Fh
        DB      1Eh
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0E0h
        DB      0FEh
        DB      0FEh
        DB      0FCh
        DB      0F0h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      03h
        DB      0Fh
        DB      1Fh
        DB      7Fh
        DB      7Eh             ; '~'
        DB      3Ch             ; '<'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      80h
        DB      0E0h
        DB      0F0h
        DB      0FCh
        DB      0FCh
        DB      78h             ; 'x'
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      01h
        DB      03h
        DB      03h
        DB      03h
        DB      07h
        DB      02h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      80h
        DB      80h
        DB      80h
        DB      0C0h
        DB      80h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      04h
        DB      02h
        DB      10h
        DB      08h
        DB      00h
        DB      30h             ; '0'
        DB      00h
        DB      08h
        DB      12h
        DB      04h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      40h             ; '@'
        DB      90h
        DB      20h             ; ' '
        DB      00h
        DB      18h
        DB      00h
        DB      20h             ; ' '
        DB      10h
        DB      80h
        DB      40h             ; '@'
        DB      00h
        DB      00h

        ; --- START PROC L2AF4 ---
L2AF4:  LD      HL,2102h
        LD      DE,7C58h
        LD      BC,0108h
        LDIR
        LD      HL,2BF3h
        LD      BC,4400h
        CALL    L2B29
        LD      HL,7E80h
L2B0B:  LD      DE,2C37h
        LD      B,20h           ; ' '
L2B10:  LD      A,(DE)
        OR      (HL)
        INC     H
        LD      (HL),A
        DEC     H
        INC     L
        INC     DE
        DJNZ    L2B10
        LD      A,L
        AND     A
        JR      NZ,L2B0B
        LD      HL,7C58h
        LD      DE,6C58h
        LD      BC,03A8h
        JP      L3EF8

        ; --- START PROC L2B29 ---
L2B29:  PUSH    BC
        PUSH    HL
        PUSH    DE
        CALL    L2B3E
        POP     DE
        LD      HL,7300h
        LD      BC,0008h
        LDIR
        POP     HL
        POP     BC
        INC     HL
        DJNZ    L2B29
        RET

        ; --- START PROC L2B3E ---
L2B3E:  LD      A,(HL)
        AND     0F8h
        ADD     A,C
        LD      DE,220Ah
        ADD     A,E
        LD      E,A
        JR      NC,L2B4A
        INC     D
L2B4A:  LD      A,(HL)
        AND     07h
        ADD     A,A
        LD      HL,2B5Bh
        ADD     A,L
        LD      L,A
        JR      NC,L2B56
        INC     H
L2B56:  LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        JP      (HL)

L2B5B:  DB      6Bh             ; 'k'
        DB      2Bh             ; '+'
        DB      75h             ; 'u'
        DB      2Bh             ; '+'
        DB      88h
        DB      2Bh             ; '+'
        DB      9Bh
        DB      2Bh             ; '+'
        DB      0AEh
        DB      2Bh             ; '+'
        DB      0C1h
        DB      2Bh             ; '+'
        DB      0CDh
        DB      2Bh             ; '+'
        DB      0E0h
        DB      2Bh             ; '+'

        ; Entry Point
        ; --- START PROC L2B6B ---
L2B6B:  EX      DE,HL
        LD      DE,7300h
        LD      BC,0008h
        LDIR
        RET

        ; Entry Point
        ; --- START PROC L2B75 ---
L2B75:  LD      C,08h
L2B77:  LD      HL,7300h
        LD      A,(DE)
        LD      B,08h
L2B7D:  RRCA
        RL      (HL)
        INC     HL
        DJNZ    L2B7D
        INC     DE
        DEC     C
        JR      NZ,L2B77
        RET

        ; Entry Point
        ; --- START PROC L2B88 ---
L2B88:  LD      C,08h
        LD      HL,7307h
L2B8D:  LD      A,(DE)
        LD      B,08h
L2B90:  RLCA
        RR      (HL)
        DJNZ    L2B90
        INC     DE
        DEC     HL
        DEC     C
        JR      NZ,L2B8D
        RET

        ; Entry Point
        ; --- START PROC L2B9B ---
L2B9B:  LD      C,08h
L2B9D:  LD      HL,7300h
        LD      A,(DE)
        LD      B,08h
L2BA3:  RLCA
        RR      (HL)
        INC     HL
        DJNZ    L2BA3
        INC     DE
        DEC     C
        JR      NZ,L2B9D
        RET

        ; Entry Point
        ; --- START PROC L2BAE ---
L2BAE:  LD      C,08h
        LD      HL,7300h
L2BB3:  LD      A,(DE)
        LD      B,08h
L2BB6:  RLCA
        RR      (HL)
        DJNZ    L2BB6
        INC     HL
        INC     DE
        DEC     C
        JR      NZ,L2BB3
        RET

        ; Entry Point
        ; --- START PROC L2BC1 ---
L2BC1:  LD      B,08h
        LD      HL,7307h
L2BC6:  LD      A,(DE)
        LD      (HL),A
        DEC     HL
        INC     DE
        DJNZ    L2BC6
        RET

        ; Entry Point
        ; --- START PROC L2BCD ---
L2BCD:  LD      C,08h
L2BCF:  LD      HL,7300h
        LD      A,(DE)
        LD      B,08h
L2BD5:  RRCA
        RR      (HL)
        INC     HL
        DJNZ    L2BD5
        INC     DE
        DEC     C
        JR      NZ,L2BCF
        RET

        ; Entry Point
        ; --- START PROC L2BE0 ---
L2BE0:  LD      C,08h
L2BE2:  LD      HL,7300h
        LD      A,(DE)
        LD      B,08h
L2BE8:  RLCA
        RL      (HL)
        INC     HL
        DJNZ    L2BE8
        INC     DE
        DEC     C
        JR      NZ,L2BE2
        RET

L2BF3:  DB      40h             ; '@'
        DB      48h             ; 'H'
        DB      45h             ; 'E'
        DB      4Dh             ; 'M'
        DB      0Ah
        DB      0Dh
        DB      0Ch
        DB      08h
        DB      "(,-*04528<=:"
        DB      98h
        DB      98h
        DB      98h
        DB      98h
        DB      "(,-* $'!%"
        DB      22h             ; '"'
        DB      23h             ; '#'
        DB      26h             ; '&'
        DB      00h
        DB      04h
        DB      05h
        DB      02h
        DB      08h
        DB      0Ch
        DB      0Dh
        DB      0Ah
        DB      10h
        DB      10h
        DB      15h
        DB      15h
        DB      11h
        DB      13h
        DB      11h
        DB      13h
        DB      18h
        DB      19h
        DB      1Dh
        DB      1Bh
        DB      1Dh
        DB      1Dh
        DB      98h
        DB      98h
        DB      11h
        DB      13h
        DB      11h
        DB      13h
        DB      0A0h
        DB      0A4h
        DB      0A8h
        DB      0ACh
        DB      00h
        DB      00h
        DB      00h
        DB      01h
        DB      06h
        DB      07h
        DB      07h
        DB      01h
        DB      00h
        DB      00h
        DB      00h
        DB      80h
        DB      60h             ; '`'
        DB      0E0h
        DB      0E0h
        DB      80h
        DB      01h
        DB      01h
        DB      01h
        DB      01h
        DB      01h
        DB      00h
        DB      00h
        DB      00h
        DB      80h
        DB      0C0h
        DB      80h
        DB      0C0h
        DB      80h
        DB      00h
        DB      00h
        DB      00h

        ; --- START PROC L2C57 ---
L2C57:  LD      C,00h
        LD      HL,(7332h)
        CALL    L2CB7
        CALL    L2CC8
        LD      A,C
        LD      (733Ch),A
        CALL    L2C87
        IN      A,(37h)         ; '7'
        OR      E
        LD      C,A
        LD      A,(7332h)
        AND     A
        LD      A,C
        JR      Z,L2C78
        RRCA
        RRCA
        RRCA
        RRCA
L2C78:  LD      B,04h
L2C7A:  RRCA
        JR      C,L2C80
        DJNZ    L2C7A
        RET

L2C80:  LD      A,04h
        SUB     B
        LD      (7458h),A
        RET

        ; --- START PROC L2C87 ---
L2C87:  LD      E,01h
        LD      HL,2CA7h
L2C8C:  LD      C,(HL)
        INC     HL
        LD      B,(HL)
        INC     HL
        IN      A,(C)
        AND     B
        JR      Z,L2C96
        SCF
L2C96:  RL      E
        JR      NC,L2C8C
        LD      A,(7333h)
        AND     A
        RET     NZ
        LD      A,E
        RLCA
        RLCA
        RLCA
        RLCA
        OR      E
        LD      E,A
        RET

L2CA7:  DB      "5 6 6"
        DB      04h
        DB      36h             ; '6'
        DB      40h             ; '@'
        DB      34h             ; '4'
        DB      02h
        DB      33h             ; '3'
        DB      02h
        DB      32h             ; '2'
        DB      04h
        DB      33h             ; '3'
        DB      04h

        ; --- START PROC L2CB7 ---
L2CB7:  LD      A,L
        AND     H
        RET     NZ
        IN      A,(30h)         ; '0'
        AND     05h
        JR      NZ,L2CC5
        IN      A,(31h)         ; '1'
        AND     03h
        RET     Z
        ; --- START PROC L2CC5 ---
L2CC5:  LD      C,01h
        RET

        ; --- START PROC L2CC8 ---
L2CC8:  LD      A,L
        XOR     H
        RET     NZ
        IN      A,(30h)         ; '0'
        AND     48h             ; 'H'
        JR      NZ,L2CC5
        IN      A,(31h)         ; '1'
        AND     30h             ; '0'
        JR      NZ,L2CC5
        RET

        ; --- START PROC L2CD8 ---
L2CD8:  LD      HL,7F00h
        LD      DE,7F80h
        LD      BC,0080h
        LDIR
        LD      HL,7F00h
        LD      HL,00F0h
        LD      (7F00h),HL
        LD      L,00h
        LD      (7F02h),HL
        LD      HL,7F00h
        LD      DE,7F04h
        LD      BC,007Ch
        LDIR
        LD      HL,7400h
        LD      DE,7500h
        LD      BC,0100h
        LDIR
        LD      HL,7400h
        LD      BC,0604h
        CALL    L2D16
        LD      HL,7440h
        LD      BC,0E06h
        ; --- START PROC L2D16 ---
L2D16:  PUSH    BC
        LD      DE,2D7Bh
        LD      (HL),E
        INC     L
        LD      (HL),D
        INC     L
        LD      C,00h
L2D20:  LD      (HL),C
        INC     L
        DJNZ    L2D20
        POP     BC
        DEC     C
        JR      NZ,L2D16
        RET

        ; --- START PROC L2D29 ---
L2D29:  LD      IX,7400h
        LD      B,04h
L2D2F:  PUSH    BC
        PUSH    HL
        CALL    L2D6A
        LD      BC,0008h
        ADD     IX,BC
        POP     HL
        POP     BC
        DJNZ    L2D2F
        LD      IX,7440h
        LD      IY,7F00h
        LD      HL,7450h
        LD      B,05h
L2D4A:  PUSH    BC
        PUSH    HL
        LD      DE,7440h
        LD      BC,0010h
        LDIR
        CALL    L2D6A
        POP     DE
        LD      HL,7440h
        LD      BC,0010h
        LDIR
        EX      DE,HL
        LD      BC,0004h
        ADD     IY,BC
        POP     BC
        DJNZ    L2D4A
        RET

        ; --- START PROC L2D6A ---
L2D6A:  LD      L,(IX+00h)
        LD      H,(IX+01h)
        JP      (HL)

L2D71:  DB      0E1h
        DB      31h             ; '1'
        DB      0F8h
        DB      72h             ; 'r'
        DB      0DDh
        DB      75h             ; 'u'
        DB      00h
        DB      0DDh
        DB      74h             ; 't'
        DB      01h
        DB      0C9h
        DB      0DDh
        DB      75h             ; 'u'
        DB      02h
        DB      0DDh
        DB      74h             ; 't'
        DB      03h
        DB      0E1h
        DB      31h             ; '1'
        DB      0F8h
        DB      72h             ; 'r'
        DB      0DDh
        DB      75h             ; 'u'
        DB      00h
        DB      0DDh
        DB      74h             ; 't'
        DB      01h
        DB      0E9h
        DB      0DDh
        DB      6Eh             ; 'n'
        DB      02h
        DB      0DDh
        DB      66h             ; 'f'
        DB      03h
        DB      2Bh             ; '+'
        DB      0DDh
        DB      75h             ; 'u'
        DB      02h
        DB      0DDh
        DB      74h             ; 't'
        DB      03h
        DB      7Dh             ; '}'
        DB      0B4h
        DB      28h             ; '('
        DB      0D3h
        DB      33h             ; '3'
        DB      33h             ; '3'
        DB      0C9h
        DB      0E1h
        DB      31h             ; '1'
        DB      0F8h
        DB      72h             ; 'r'
        DB      0DDh
        DB      75h             ; 'u'
        DB      04h
        DB      0DDh
        DB      74h             ; 't'
        DB      05h
        DB      0AFh
        DB      0DDh
        DB      77h             ; 'w'
        DB      02h
        DB      0DDh
        DB      77h             ; 'w'
        DB      03h
        DB      21h             ; '!'
        DB      0BBh
        DB      2Dh             ; '-'
        DB      0DDh
        DB      75h             ; 'u'
        DB      00h
        DB      0DDh
        DB      74h             ; 't'
        DB      01h
        DB      0DDh
        DB      6Eh             ; 'n'
        DB      04h
        DB      0DDh
        DB      66h             ; 'f'
        DB      05h
        DB      4Eh             ; 'N'
        DB      23h             ; '#'
        DB      46h             ; 'F'
        DB      23h             ; '#'
        DB      03h
        DB      79h             ; 'y'
        DB      0B0h
        DB      28h             ; '('
        DB      0ABh
        DB      0Bh
        DB      5Eh             ; '^'
        DB      23h             ; '#'
        DB      56h             ; 'V'
        DB      23h             ; '#'
        DB      0E5h
        DB      0DDh
        DB      6Eh             ; 'n'
        DB      02h
        DB      0DDh
        DB      66h             ; 'f'
        DB      03h
        DB      0A7h
        DB      0EDh
        DB      42h             ; 'B'
        DB      09h
        DB      23h             ; '#'
        DB      0DDh
        DB      75h             ; 'u'
        DB      02h
        DB      0DDh
        DB      74h             ; 't'
        DB      03h
        DB      20h             ; ' '
        DB      0BBh
        DB      0CDh
        DB      0EEh
        DB      2Dh             ; '-'
        DB      0E1h
        DB      0DDh
        DB      75h             ; 'u'
        DB      04h
        DB      0DDh
        DB      74h             ; 't'
        DB      05h
        DB      0C9h
        DB      0EBh
        DB      0E9h
        DB      3Eh             ; '>'
        DB      80h
        DB      "24s2;s"
        DB      0CDh
        DB      0A2h
        DB      2Fh             ; '/'
        DB      0CDh
        DB      71h             ; 'q'
        DB      2Dh             ; '-'
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      0DBh
        DB      31h             ; '1'
        DB      0E6h
        DB      11h
        DB      20h             ; ' '
        DB      06h
        DB      0DBh
        DB      31h             ; '1'
        DB      0E6h
        DB      22h             ; '"'
        DB      0C8h
        DB      24h             ; '$'
        DB      22h             ; '"'
        DB      32h             ; '2'
        DB      73h             ; 's'
        DB      0AFh
        DB      21h             ; '!'
        DB      8Eh
        DB      "sw,w,w2"
        DB      99h
        DB      "s<24s2;s2"
        DB      00h
        DB      "v:>s2"
        DB      9Ah
        DB      73h             ; 's'
        DB      3Eh             ; '>'
        DB      03h
        DB      32h             ; '2'
        DB      91h
        DB      73h             ; 's'
        DB      0CDh
        DB      94h
        DB      3Eh             ; '>'
        DB      0CDh
        DB      53h             ; 'S'
        DB      30h             ; '0'
        DB      21h             ; '!'
        DB      80h
        DB      73h             ; 's'
        DB      11h
        DB      0C0h
        DB      73h             ; 's'
        DB      01h
        DB      40h             ; '@'
        DB      00h
        DB      0EDh
        DB      0B0h
        DB      0CDh
        DB      3Fh             ; '?'
        DB      2Fh             ; '/'
        DB      0CDh
        DB      6Ah             ; 'j'
        DB      2Fh             ; '/'
        DB      21h             ; '!'
        DB      0B4h
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0CDh
        DB      58h             ; 'X'
        DB      2Fh             ; '/'
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Fh             ; '/'
        DB      21h             ; '!'
        DB      91h
        DB      73h             ; 's'
        DB      35h             ; '5'
        DB      0CDh
        DB      99h
        DB      30h             ; '0'
        DB      21h             ; '!'
        DB      3Eh             ; '>'
        DB      35h             ; '5'
        DB      22h             ; '"'
        DB      50h             ; 'P'
        DB      74h             ; 't'
        DB      21h             ; '!'
        DB      0FDh
        DB      33h             ; '3'
        DB      22h             ; '"'
        DB      08h
        DB      74h             ; 't'
        DB      0CDh
        DB      71h             ; 'q'
        DB      2Dh             ; '-'
        DB      3Ah             ; ':'
        DB      92h
        DB      73h             ; 's'
        DB      0A7h
        DB      0C0h
        DB      0CDh
        DB      66h             ; 'f'
        DB      36h             ; '6'
        DB      3Ch             ; '<'
        DB      32h             ; '2'
        DB      01h
        DB      76h             ; 'v'
        DB      0CDh
        DB      0D8h
        DB      2Ch             ; ','
        DB      2Ah             ; '*'
        DB      80h
        DB      7Fh
        DB      22h             ; '"'
        DB      00h
        DB      7Fh
        DB      2Ah             ; '*'
        DB      82h
        DB      7Fh
        DB      22h             ; '"'
        DB      02h
        DB      7Fh
        DB      21h             ; '!'
        DB      78h             ; 'x'
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      08h
        DB      3Fh             ; '?'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      21h             ; '!'
        DB      0F0h
        DB      00h
        DB      22h             ; '"'
        DB      00h
        DB      7Fh
        DB      0CDh
        DB      0A2h
        DB      3Eh             ; '>'
        DB      0CDh
        DB      53h             ; 'S'
        DB      30h             ; '0'
        DB      21h             ; '!'
        DB      3Ch             ; '<'
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      18h
        DB      0B3h
        DB      3Ah             ; ':'
        DB      33h             ; '3'
        DB      73h             ; 's'
        DB      0A7h
        DB      20h             ; ' '
        DB      1Ah
        DB      3Ah             ; ':'
        DB      91h
        DB      73h             ; 's'
        DB      0A7h
        DB      20h             ; ' '
        DB      23h             ; '#'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      02h
        DB      76h             ; 'v'
        DB      0CDh
        DB      8Eh
        DB      2Fh             ; '/'
        DB      21h             ; '!'
        DB      0F0h
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0C3h
        DB      0F0h
        DB      2Dh             ; '-'
        DB      3Ah             ; ':'
        DB      91h
        DB      73h             ; 's'
        DB      0A7h
        DB      28h             ; '('
        DB      1Eh
        DB      3Ah             ; ':'
        DB      0D1h
        DB      73h             ; 's'
        DB      0A7h
        DB      28h             ; '('
        DB      03h
        DB      0CDh
        DB      25h             ; '%'
        DB      2Fh             ; '/'
        DB      0CDh
        DB      62h             ; 'b'
        DB      30h             ; '0'
        DB      0CDh
        DB      3Fh             ; '?'
        DB      2Fh             ; '/'
        DB      0CDh
        DB      6Ah             ; 'j'
        DB      2Fh             ; '/'
        DB      21h             ; '!'
        DB      3Ch             ; '<'
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0C3h
        DB      51h             ; 'Q'
        DB      2Eh             ; '.'
        DB      0CDh
        DB      3Fh             ; '?'
        DB      2Fh             ; '/'
        DB      0CDh
        DB      8Eh
        DB      2Fh             ; '/'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      02h
        DB      76h             ; 'v'
        DB      21h             ; '!'
        DB      0B4h
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0CDh
        DB      58h             ; 'X'
        DB      2Fh             ; '/'
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Fh             ; '/'
        DB      3Ah             ; ':'
        DB      0D1h
        DB      73h             ; 's'
        DB      0A7h
        DB      20h             ; ' '
        DB      0C8h
        DB      0CDh
        DB      8Eh
        DB      2Fh             ; '/'
        DB      21h             ; '!'
        DB      3Ch             ; '<'
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      3Ah             ; ':'
        DB      32h             ; '2'
        DB      73h             ; 's'
        DB      0A7h
        DB      0C4h
        DB      25h             ; '%'
        DB      2Fh             ; '/'
        DB      0C3h
        DB      0F0h
        DB      2Dh             ; '-'
        DB      3Ah             ; ':'
        DB      32h             ; '2'
        DB      73h             ; 's'
        DB      0EEh
        DB      01h
        DB      32h             ; '2'
        DB      32h             ; '2'
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      80h
        DB      73h             ; 's'
        DB      11h
        DB      0C0h
        DB      73h             ; 's'
        DB      06h
        DB      40h             ; '@'
        DB      4Eh             ; 'N'
        DB      1Ah
        DB      77h             ; 'w'
        DB      79h             ; 'y'
        DB      12h
        DB      23h             ; '#'
        DB      13h
        DB      10h
        DB      0F7h
        DB      0C9h
        DB      21h             ; '!'
        DB      69h             ; 'i'
        DB      01h
        DB      11h
        DB      50h             ; 'P'
        DB      2Fh             ; '/'
        DB      0CDh
        DB      7Fh
        DB      3Eh             ; '>'
        DB      3Ah             ; ':'
        DB      32h             ; '2'
        DB      73h             ; 's'
        DB      0C6h
        DB      31h             ; '1'
        DB      0C3h
        DB      0FBh
        DB      "=PLAYER "
        DB      00h
        DB      21h             ; '!'
        DB      69h             ; 'i'
        DB      01h
        DB      11h
        DB      61h             ; 'a'
        DB      2Fh             ; '/'
        DB      0C3h
        DB      7Fh
        DB      3Eh             ; '>'
        DB      0D5h
        DB      0D8h
        DB      0D8h
        DB      0D8h
        DB      0D8h
        DB      0D8h
        DB      0D8h
        DB      0D4h
        DB      00h
        DB      21h             ; '!'
        DB      89h
        DB      01h
        DB      11h
        DB      73h             ; 's'
        DB      2Fh             ; '/'
        DB      0C3h
        DB      7Fh
        DB      "> READY! "
        DB      00h
        DB      21h             ; '!'
        DB      89h
        DB      01h
        DB      11h
        DB      85h
        DB      2Fh             ; '/'
        DB      0C3h
        DB      7Fh
        DB      3Eh             ; '>'
        DB      0D7h
        DB      0DAh
        DB      0DAh
        DB      0D6h
        DB      0D7h
        DB      0DAh
        DB      0DAh
        DB      0D6h
        DB      00h
        DB      21h             ; '!'
        DB      88h
        DB      01h
        DB      11h
        DB      97h
        DB      2Fh             ; '/'
        DB      0C3h
        DB      7Fh
        DB      ">GAME  OVER"
        DB      00h
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      0CDh
        DB      0F9h
        DB      3Dh             ; '='
        DB      7Ch             ; '|'
        DB      0FEh
        DB      03h
        DB      20h             ; ' '
        DB      0F8h
        DB      21h             ; '!'
        DB      20h             ; ' '
        DB      00h
        DB      11h
        DB      0DFh
        DB      2Fh             ; '/'
        DB      1Ah
        DB      4Fh             ; 'O'
        DB      06h
        DB      08h
        DB      0CBh
        DB      21h             ; '!'
        DB      3Eh             ; '>'
        DB      20h             ; ' '
        DB      30h             ; '0'
        DB      02h
        DB      3Eh             ; '>'
        DB      80h
        DB      0CDh
        DB      0FBh
        DB      3Dh             ; '='
        DB      10h
        DB      0F3h
        DB      13h
        DB      7Ch             ; '|'
        DB      0FEh
        DB      02h
        DB      20h             ; ' '
        DB      0E9h
        DB      11h
        DB      1Bh
        DB      30h             ; '0'
        DB      21h             ; '!'
        DB      28h             ; '('
        DB      02h
        DB      0CDh
        DB      7Fh
        DB      3Eh             ; '>'
        DB      21h             ; '!'
        DB      87h
        DB      02h
        DB      0CDh
        DB      7Fh
        DB      3Eh             ; '>'
        DB      21h             ; '!'
        DB      0C7h
        DB      02h
        DB      0C3h
        DB      7Fh
        DB      3Eh             ; '>'
        DB      3Ch             ; '<'
        DB      72h             ; 'r'
        DB      2Fh             ; '/'
        DB      0BCh
        DB      22h             ; '"'
        DB      8Ah
        DB      28h             ; '('
        DB      22h             ; '"'
        DB      22h             ; '"'
        DB      8Ah
        DB      28h             ; '('
        DB      22h             ; '"'
        DB      3Ch             ; '<'
        DB      8Ah
        DB      0AFh
        DB      3Ch             ; '<'
        DB      20h             ; ' '
        DB      8Ah
        DB      0A8h
        DB      28h             ; '('
        DB      20h             ; ' '
        DB      8Bh
        DB      "h$ r/"
        DB      0A2h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      00h
        DB      0F0h
        DB      87h
        DB      00h
        DB      00h
        DB      89h
        DB      48h             ; 'H'
        DB      80h
        DB      00h
        DB      8Ah
        DB      28h             ; '('
        DB      00h
        DB      00h
        DB      0F2h
        DB      28h             ; '('
        DB      00h
        DB      00h
        DB      83h
        DB      0E8h
        DB      00h
        DB      00h
        DB      82h
        DB      28h             ; '('
        DB      80h
        DB      00h
        DB      82h
        DB      27h             ; '''
        DB      00h
        DB      8Bh
        DB      " 1982 NAMCO LTD."
        DB      00h
        DB      "1 PLAYER   "
        DB      22h             ; '"'
        DB      31h             ; '1'
        DB      22h             ; '"'
        DB      20h             ; ' '
        DB      4Bh             ; 'K'
        DB      45h             ; 'E'
        DB      59h             ; 'Y'
        DB      00h
        DB      "2 PLAYERS  "
        DB      22h             ; '"'
        DB      32h             ; '2'
        DB      22h             ; '"'
        DB      20h             ; ' '
        DB      4Bh             ; 'K'
        DB      45h             ; 'E'
        DB      59h             ; 'Y'
        DB      00h
        DB      21h             ; '!'
        DB      80h
        DB      73h             ; 's'
        DB      01h
        DB      0FFh
        DB      0Eh
        DB      71h             ; 'q'
        DB      2Ch             ; ','
        DB      10h
        DB      0FCh
        DB      3Eh             ; '>'
        DB      23h             ; '#'
        DB      32h             ; '2'
        DB      92h
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      0CDh
        DB      0F9h
        DB      3Dh             ; '='
        DB      7Ch             ; '|'
        DB      0FEh
        DB      03h
        DB      20h             ; ' '
        DB      0F8h
        DB      0CDh
        DB      0F6h
        DB      30h             ; '0'
        DB      0CDh
        DB      0E0h
        DB      31h             ; '1'
        DB      0CDh
        DB      0A3h
        DB      32h             ; '2'
        DB      0CDh
        DB      28h             ; '('
        DB      33h             ; '3'
        DB      11h
        DB      0D9h
        DB      30h             ; '0'
        DB      21h             ; '!'
        DB      19h
        DB      00h
        DB      0CDh
        DB      7Fh
        DB      3Eh             ; '>'
        DB      21h             ; '!'
        DB      3Ah             ; ':'
        DB      00h
        DB      0CDh
        DB      7Fh
        DB      3Eh             ; '>'
        DB      21h             ; '!'
        DB      0B9h
        DB      02h
        DB      0CDh
        DB      7Fh
        DB      3Eh             ; '>'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      38h             ; '8'
        DB      73h             ; 's'
        DB      0CDh
        DB      60h             ; '`'
        DB      3Dh             ; '='
        DB      0CDh
        DB      0EAh
        DB      30h             ; '0'

        ; --- START PROC L3099 ---
L3099:  LD      B,06h
L309B:  CALL    L30A1
        DJNZ    L309B
        RET

        ; --- START PROC L30A1 ---
L30A1:  LD      HL,01F7h
        LD      DE,0040h
        LD      A,B
        DEC     A
L30A9:  ADD     HL,DE
        SUB     03h
        JR      NC,L30A9
L30AE:  INC     L
        INC     L
        INC     A
        JR      NZ,L30AE
        LD      A,(7391h)
        CP      B
        JR      NC,L30C8
        ; --- START PROC L30B9 ---
L30B9:  LD      A,20h           ; ' '
        CALL    L30C2
        LD      DE,001Eh
        ADD     HL,DE
        ; --- START PROC L30C2 ---
L30C2:  CALL    L3DFB
        JP      L3DFB

        ; --- START PROC L30C8 ---
L30C8:  LD      A,0ACh
        ; --- START PROC L30CA ---
L30CA:  CALL    L30D1
        LD      DE,001Eh
        ADD     HL,DE
        ; --- START PROC L30D1 ---
L30D1:  CALL    L30D4
        ; --- START PROC L30D4 ---
L30D4:  CALL    L3DFB
        INC     A
        RET

L30D9:  DB      "HIGH"
        DB      00h
        DB      "SCORE"
        DB      00h
        DB      "ROUND"
        DB      00h
        DB      21h             ; '!'
        DB      0DDh
        DB      02h
        DB      11h
        DB      98h
        DB      73h             ; 's'
        DB      01h
        DB      00h
        DB      01h
        DB      0C3h
        DB      0D1h
        DB      3Dh             ; '='
        DB      11h
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      21h             ; '!'
        DB      01h
        DB      00h
        DB      1Ah
        DB      07h
        DB      07h
        DB      07h
        DB      0E6h
        DB      07h
        DB      3Ch             ; '<'
        DB      47h             ; 'G'
        DB      1Ah
        DB      0E6h
        DB      1Fh
        DB      3Ch             ; '<'
        DB      0FEh
        DB      1Fh
        DB      0C8h
        DB      30h             ; '0'
        DB      28h             ; '('
        DB      0C6h
        DB      0CFh
        DB      4Fh             ; 'O'
        DB      79h             ; 'y'
        DB      0CDh
        DB      0FBh
        DB      3Dh             ; '='
        DB      0E5h
        DB      7Dh             ; '}'
        DB      0EEh
        DB      1Fh
        DB      0D6h
        DB      05h
        DB      6Fh             ; 'o'
        DB      79h             ; 'y'
        DB      0EEh
        DB      01h
        DB      0CDh
        DB      0FBh
        DB      3Dh             ; '='
        DB      0E1h
        DB      10h
        DB      0ECh
        DB      7Dh             ; '}'
        DB      0E6h
        DB      1Fh
        DB      0FEh
        DB      0Dh
        DB      20h             ; ' '
        DB      07h
        DB      3Eh             ; '>'
        DB      14h
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      13h
        DB      18h
        DB      0C7h
        DB      78h             ; 'x'
        DB      85h
        DB      6Fh             ; 'o'
        DB      18h
        DB      0EAh
        DB      07h
        DB      0EAh
        DB      4Ah             ; 'J'
        DB      0Dh
        DB      00h
        DB      0E8h
        DB      28h             ; '('
        DB      0Dh
        DB      0Ch
        DB      07h
        DB      3Fh             ; '?'
        DB      06h
        DB      07h
        DB      6Ah             ; 'j'
        DB      1Fh
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0BFh
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0BFh
        DB      0Dh
        DB      0Ch
        DB      05h
        DB      3Fh             ; '?'
        DB      04h
        DB      05h
        DB      88h
        DB      0Dh
        DB      0Ch
        DB      07h
        DB      3Fh             ; '?'
        DB      2Ah             ; '*'
        DB      06h
        DB      07h
        DB      2Ah             ; '*'
        DB      14h
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      7Fh
        DB      0Ch
        DB      0Dh
        DB      5Fh             ; '_'
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      7Fh
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      16h
        DB      0Dh
        DB      0Ch
        DB      05h
        DB      08h
        DB      01h
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0Dh
        DB      5Fh             ; '_'
        DB      03h
        DB      02h
        DB      0Bh
        DB      06h
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0Dh
        DB      5Fh             ; '_'
        DB      0FFh
        DB      05h
        DB      48h             ; 'H'
        DB      0FFh
        DB      07h
        DB      2Ah             ; '*'
        DB      06h
        DB      01h
        DB      00h
        DB      08h
        DB      04h
        DB      05h
        DB      28h             ; '('
        DB      04h
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0Dh
        DB      0Ch
        DB      07h
        DB      3Fh             ; '?'
        DB      06h
        DB      07h
        DB      0Ah
        DB      03h
        DB      2Ah             ; '*'
        DB      0Ch
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0BFh
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0BFh
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      00h
        DB      08h
        DB      04h
        DB      0Dh
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      0Dh
        DB      3Fh             ; '?'
        DB      0Ch
        DB      07h
        DB      1Fh
        DB      0Dh
        DB      0Ch
        DB      05h
        DB      3Fh             ; '?'
        DB      04h
        DB      05h
        DB      3Fh             ; '?'
        DB      04h
        DB      0Dh
        DB      1Fh
        DB      0Dh
        DB      0Ch
        DB      07h
        DB      2Ah             ; '*'
        DB      06h
        DB      07h
        DB      4Ah             ; 'J'
        DB      03h
        DB      1Fh
        DB      0Dh
        DB      0Ch
        DB      0FFh
        DB      3Fh             ; '?'
        DB      0Dh
        DB      0Ch
        DB      0FFh
        DB      3Fh             ; '?'
        DB      05h
        DB      0E8h
        DB      48h             ; 'H'
        DB      1Eh
        DB      06h
        DB      21h             ; '!'
        DB      0CDh
        DB      0EAh
        DB      31h             ; '1'
        DB      05h
        DB      0F2h
        DB      0E2h
        DB      31h             ; '1'
        DB      0C9h
        DB      0CDh
        DB      31h             ; '1'
        DB      32h             ; '2'
        DB      0A6h
        DB      28h             ; '('
        DB      1Ah
        DB      0CDh
        DB      48h             ; 'H'
        DB      32h             ; '2'
        DB      0C6h
        DB      0E0h
        DB      0CBh
        DB      47h             ; 'G'
        DB      0CAh
        DB      0C2h
        DB      30h             ; '0'
        DB      0CDh
        DB      0FBh
        DB      3Dh             ; '='
        DB      11h
        DB      1Fh
        DB      00h
        DB      19h
        DB      0C3h
        DB      0FBh
        DB      3Dh             ; '='
        DB      0CDh
        DB      31h             ; '1'
        DB      32h             ; '2'
        DB      2Fh             ; '/'
        DB      0A6h
        DB      77h             ; 'w'
        DB      0CDh
        DB      48h             ; 'H'
        DB      32h             ; '2'
        DB      0CBh
        DB      47h             ; 'G'
        DB      3Eh             ; '>'
        DB      20h             ; ' '
        DB      0CAh
        DB      0C2h
        DB      30h             ; '0'
        DB      18h
        DB      0E4h
        DB      0CDh
        DB      31h             ; '1'
        DB      32h             ; '2'
        DB      2Fh             ; '/'
        DB      0A6h
        DB      77h             ; 'w'
        DB      0CDh
        DB      48h             ; 'H'
        DB      32h             ; '2'
        DB      87h
        DB      0C6h
        DB      0C8h
        DB      0CBh
        DB      4Fh             ; 'O'
        DB      0CAh
        DB      0D1h
        DB      30h             ; '0'
        DB      0CDh
        DB      0D4h
        DB      30h             ; '0'
        DB      11h
        DB      1Fh
        DB      00h
        DB      19h
        DB      0C3h
        DB      0D4h
        DB      30h             ; '0'
        DB      21h             ; '!'
        DB      80h
        DB      73h             ; 's'

        ; --- START PROC L3234 ---
L3234:  LD      A,B
        AND     0F8h
        RRCA
        RRCA
        RRCA
        ADD     A,L
        LD      L,A
        LD      A,B
        AND     07h
        LD      C,A
        LD      A,01h
        RET     Z
L3243:  ADD     A,A
        DEC     C
        JR      NZ,L3243
        RET

L3248:  DB      21h             ; '!'
        DB      5Fh             ; '_'
        DB      32h             ; '2'

        ; --- START PROC L324B ---
L324B:  LD      A,B
        ADD     A,A
        ADD     A,L
        LD      L,A
        JR      NC,L3252
        INC     H
L3252:  LD      E,(HL)
        INC     HL
        LD      A,(HL)
        AND     03h
        LD      D,A
        LD      A,(HL)
        SRL     A
        SRL     A
        EX      DE,HL
        RET

L325F:  DB      44h             ; 'D'
        DB      08h
        DB      4Ch             ; 'L'
        DB      08h
        DB      54h             ; 'T'
        DB      08h
        DB      0A4h
        DB      00h
        DB      67h             ; 'g'
        DB      0Ch
        DB      72h             ; 'r'
        DB      04h
        DB      0B4h
        DB      00h
        DB      0C4h
        DB      08h
        DB      0D4h
        DB      08h
        DB      61h             ; 'a'
        DB      0Dh
        DB      64h             ; 'd'
        DB      05h
        DB      65h             ; 'e'
        DB      0Dh
        DB      68h             ; 'h'
        DB      05h
        DB      71h             ; 'q'
        DB      0Dh
        DB      74h             ; 't'
        DB      05h
        DB      75h             ; 'u'
        DB      0Dh
        DB      78h             ; 'x'
        DB      05h
        DB      0C4h
        DB      09h
        DB      0E7h
        DB      0Dh
        DB      0ECh
        DB      05h
        DB      0EDh
        DB      0Dh
        DB      0F2h
        DB      05h
        DB      0D4h
        DB      09h
        DB      64h             ; 'd'
        DB      02h
        DB      68h             ; 'h'
        DB      02h
        DB      4Ch             ; 'L'
        DB      0Ah
        DB      70h             ; 'p'
        DB      02h
        DB      74h             ; 't'
        DB      02h
        DB      0A3h
        DB      0Eh
        DB      0A6h
        DB      06h
        DB      0A7h
        DB      0Eh
        DB      0B2h
        DB      06h
        DB      0B3h
        DB      0Eh
        DB      0B6h
        DB      06h
        DB      06h
        DB      0Dh
        DB      0CDh
        DB      0ADh
        DB      32h             ; '2'
        DB      05h
        DB      0F2h
        DB      0A5h
        DB      32h             ; '2'
        DB      0C9h
        DB      0CDh
        DB      0D9h
        DB      32h             ; '2'
        DB      0A6h
        DB      28h             ; '('
        DB      1Fh
        DB      0CDh
        DB      0DFh
        DB      32h             ; '2'
        DB      0Eh
        DB      20h             ; ' '
        DB      0CDh
        DB      0C2h
        DB      32h             ; '2'
        DB      3Eh             ; '>'
        DB      1Eh
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      0CDh
        DB      0C5h
        DB      32h             ; '2'
        DB      1Ah
        DB      81h
        DB      0CDh
        DB      0FBh
        DB      3Dh             ; '='
        DB      13h
        DB      0C9h
        DB      0CDh
        DB      0D9h
        DB      32h             ; '2'
        DB      2Fh             ; '/'
        DB      0A6h
        DB      77h             ; 'w'
        DB      0CDh
        DB      0DFh
        DB      32h             ; '2'
        DB      0Eh
        DB      00h
        DB      18h
        DB      0DFh
        DB      21h             ; '!'
        DB      86h
        DB      73h             ; 's'
        DB      0C3h
        DB      34h             ; '4'
        DB      32h             ; '2'
        DB      21h             ; '!'
        DB      0Ch
        DB      33h             ; '3'
        DB      0CDh
        DB      4Bh             ; 'K'
        DB      32h             ; '2'
        DB      87h
        DB      87h
        DB      11h
        DB      0F0h
        DB      32h             ; '2'
        DB      83h
        DB      5Fh             ; '_'
        DB      30h             ; '0'
        DB      01h
        DB      14h
        DB      0C9h
        DB      0D0h
        DB      0D9h
        DB      0DEh
        DB      0D7h
        DB      0D8h
        DB      0D1h
        DB      0D6h
        DB      0DFh
        DB      0D4h
        DB      0D5h
        DB      0DAh
        DB      0DBh
        DB      0DCh
        DB      0D5h
        DB      0D2h
        DB      0DBh
        DB      0D4h
        DB      0DDh
        DB      0DAh
        DB      0D3h
        DB      0DCh
        DB      0D5h
        DB      0DEh
        DB      0D7h
        DB      0D4h
        DB      0DDh
        DB      0D6h
        DB      0DFh
        DB      22h             ; '"'
        DB      00h
        DB      36h             ; '6'
        DB      04h
        DB      0A6h
        DB      08h
        DB      0B2h
        DB      08h
        DB      22h             ; '"'
        DB      0Dh
        DB      36h             ; '6'
        DB      11h
        DB      0A2h
        DB      01h
        DB      0A8h
        DB      11h
        DB      0B0h
        DB      0Dh
        DB      0B6h
        DB      05h
        DB      62h             ; 'b'
        DB      16h
        DB      6Ah             ; 'j'
        DB      12h
        DB      6Eh             ; 'n'
        DB      0Eh
        DB      76h             ; 'v'
        DB      1Ah
        DB      06h
        DB      1Ch
        DB      0CDh
        DB      32h             ; '2'
        DB      33h             ; '3'
        DB      05h
        DB      0F2h
        DB      2Ah             ; '*'
        DB      33h             ; '3'
        DB      0C9h
        DB      0CDh
        DB      56h             ; 'V'
        DB      33h             ; '3'
        DB      0A6h
        DB      28h             ; '('
        DB      18h
        DB      0CDh
        DB      5Ch             ; '\'
        DB      33h             ; '3'
        DB      3Ah             ; ':'
        DB      94h
        DB      73h             ; 's'
        DB      11h
        DB      9Ch
        DB      33h             ; '3'
        DB      83h
        DB      5Fh             ; '_'
        DB      30h             ; '0'
        DB      01h
        DB      14h
        DB      1Ah
        DB      0C3h
        DB      0CAh
        DB      30h             ; '0'
        DB      0CDh
        DB      56h             ; 'V'
        DB      33h             ; '3'
        DB      2Fh             ; '/'
        DB      0A6h
        DB      77h             ; 'w'
        DB      0CDh
        DB      5Ch             ; '\'
        DB      33h             ; '3'
        DB      0C3h
        DB      0B9h
        DB      30h             ; '0'
        DB      21h             ; '!'
        DB      88h
        DB      73h             ; 's'
        DB      0C3h
        DB      "42!b3"
        DB      0C3h
        DB      4Bh             ; 'K'
        DB      32h             ; '2'
        DB      68h             ; 'h'
        DB      00h
        DB      6Ah             ; 'j'
        DB      00h
        DB      6Ch             ; 'l'
        DB      00h
        DB      6Eh             ; 'n'
        DB      00h
        DB      70h             ; 'p'
        DB      00h
        DB      0E4h
        DB      00h
        DB      0E6h
        DB      00h
        DB      0F2h
        DB      00h
        DB      0F4h
        DB      00h
        DB      26h             ; '&'
        DB      01h
        DB      32h             ; '2'
        DB      01h
        DB      62h             ; 'b'
        DB      01h
        DB      66h             ; 'f'
        DB      01h
        DB      72h             ; 'r'
        DB      01h
        DB      76h             ; 'v'
        DB      01h
        DB      0E4h
        DB      01h
        DB      0EAh
        DB      01h
        DB      0EEh
        DB      01h
        DB      0F4h
        DB      01h
        DB      24h             ; '$'
        DB      02h
        DB      28h             ; '('
        DB      02h
        DB      30h             ; '0'
        DB      02h
        DB      34h             ; '4'
        DB      02h
        DB      6Ch             ; 'l'
        DB      02h
        DB      0A8h
        DB      02h
        DB      0AAh
        DB      02h
        DB      0ACh
        DB      02h
        DB      0AEh
        DB      02h
        DB      0B0h
        DB      02h
        DB      90h
        DB      0A8h
        DB      0A0h
        DB      9Ch
        DB      94h
        DB      0A4h
        DB      98h
        DB      8Ch
        DB      0CDh
        DB      0B0h
        DB      33h             ; '3'
        DB      2Fh             ; '/'
        DB      0A6h
        DB      77h             ; 'w'

        ; --- START PROC L33AA ---
L33AA:  CALL    L33B6
        JP      L30B9

        ; --- START PROC L33B0 ---
L33B0:  LD      HL,738Dh
        JP      L3234

        ; --- START PROC L33B6 ---
L33B6:  LD      HL,33F1h
        JP      L324B

        ; --- START PROC L33BC ---
L33BC:  LD      A,(733Bh)
        AND     A
        RET     M
        LD      A,(7331h)
        AND     07h
        SUB     02h
        RET     C
        LD      B,A
        CALL    L33B0
        AND     (HL)
        JP      Z,L33AA
        CALL    L33B6
        LD      A,(733Bh)
        DEC     A
        JR      NZ,L33DD
        LD      A,(7331h)
L33DD:  AND     18h
        RRCA
        ADD     A,0B0h
        LD      C,A
        LD      A,B
        CP      02h
        LD      A,C
        JP      C,L30CA
        ADD     A,10h
        AND     0F7h
        JP      L30CA

L33F1:  DB      0E8h
        DB      01h
        DB      0F0h
        DB      01h
        DB      64h             ; 'd'
        DB      00h
        DB      74h             ; 't'
        DB      00h
        DB      0A4h
        DB      02h
        DB      0B4h
        DB      02h
        DB      21h             ; '!'
        DB      62h             ; 'b'
        DB      39h             ; '9'
        DB      22h             ; '"'
        DB      "`t!e9"
        DB      22h             ; '"'
        DB      "pt!i9"
        DB      22h             ; '"'
        DB      80h
        DB      74h             ; 't'
        DB      21h             ; '!'
        DB      6Dh             ; 'm'
        DB      39h             ; '9'
        DB      22h             ; '"'
        DB      90h
        DB      74h             ; 't'
        DB      0CDh
        DB      0A1h
        DB      2Dh             ; '-'
        DB      00h
        DB      00h
        DB      5Eh             ; '^'
        DB      34h             ; '4'
        DB      0A4h
        DB      01h
        DB      53h             ; 'S'
        DB      34h             ; '4'
        DB      0C2h
        DB      01h
        DB      47h             ; 'G'
        DB      34h             ; '4'
        DB      0DCh
        DB      05h
        DB      4Ch             ; 'L'
        DB      34h             ; '4'
        DB      0FAh
        DB      05h
        DB      6Ch             ; 'l'
        DB      34h             ; '4'
        DB      08h
        DB      07h
        DB      58h             ; 'X'
        DB      34h             ; '4'
        DB      26h             ; '&'
        DB      07h
        DB      47h             ; 'G'
        DB      34h             ; '4'
        DB      0B8h
        DB      0Bh
        DB      58h             ; 'X'
        DB      34h             ; '4'
        DB      0D6h
        DB      0Bh
        DB      6Ch             ; 'l'
        DB      34h             ; '4'
        DB      0E4h
        DB      0Ch
        DB      58h             ; 'X'
        DB      34h             ; '4'
        DB      02h
        DB      0Dh
        DB      47h             ; 'G'
        DB      34h             ; '4'
        DB      0FFh
        DB      0FFh
        DB      0C9h
        DB      0AFh
        DB      32h             ; '2'
        DB      39h             ; '9'
        DB      73h             ; 's'
        DB      0C9h
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      96h
        DB      74h             ; 't'
        DB      18h
        DB      05h
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      86h
        DB      74h             ; 't'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      39h             ; '9'
        DB      73h             ; 's'
        DB      0C9h
        DB      0AFh
        DB      32h             ; '2'
        DB      96h
        DB      74h             ; 't'
        DB      32h             ; '2'
        DB      86h
        DB      "t<2vt2ft>"
        DB      02h
        DB      32h             ; '2'
        DB      39h             ; '9'
        DB      73h             ; 's'
        DB      0C9h
        DB      2Ah             ; '*'
        DB      46h             ; 'F'
        DB      73h             ; 's'
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0DDh
        DB      6Eh             ; 'n'
        DB      02h
        DB      0DDh
        DB      66h             ; 'f'
        DB      03h
        DB      01h
        DB      3Ch             ; '<'
        DB      00h
        DB      0A7h
        DB      0EDh
        DB      42h             ; 'B'
        DB      3Eh             ; '>'
        DB      02h
        DB      30h             ; '0'
        DB      01h
        DB      3Dh             ; '='
        DB      32h             ; '2'
        DB      56h             ; 'V'
        DB      74h             ; 't'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0AFh
        DB      32h             ; '2'
        DB      56h             ; 'V'
        DB      74h             ; 't'
        DB      0CDh
        DB      71h             ; 'q'
        DB      2Dh             ; '-'
        DB      0C9h
        DB      0CDh
        DB      0EAh
        DB      34h             ; '4'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      0Bh
        DB      76h             ; 'v'
        DB      21h             ; '!'
        DB      78h             ; 'x'
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      0Fh
        DB      35h             ; '5'
        DB      0CDh
        DB      07h
        DB      35h             ; '5'
        DB      0CDh
        DB      0D5h
        DB      34h             ; '4'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      21h             ; '!'
        DB      0E0h
        DB      01h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      07h
        DB      35h             ; '5'
        DB      0CDh
        DB      0D5h
        DB      34h             ; '4'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0AFh
        DB      32h             ; '2'
        DB      0Bh
        DB      76h             ; 'v'
        DB      0CDh
        DB      0D1h
        DB      34h             ; '4'
        DB      0CDh
        DB      29h             ; ')'
        DB      35h             ; '5'
        DB      0CDh
        DB      24h             ; '$'
        DB      35h             ; '5'
        DB      0CDh
        DB      71h             ; 'q'
        DB      2Dh             ; '-'
        DB      0C9h
        DB      3Eh             ; '>'
        DB      0DCh
        DB      18h
        DB      0Fh
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      07h
        DB      3Dh             ; '='
        DB      0C0h
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      08h
        DB      0Fh
        DB      0C6h
        DB      0E8h
        DB      21h             ; '!'
        DB      0ACh
        DB      01h
        DB      0C3h
        DB      0CAh
        DB      30h             ; '0'
        DB      0CDh
        DB      0A6h
        DB      20h             ; ' '
        DB      0E6h
        DB      07h
        DB      32h             ; '2'
        DB      72h             ; 'r'
        DB      73h             ; 's'
        DB      0CDh
        DB      0A6h
        DB      20h             ; ' '
        DB      0E6h
        DB      07h
        DB      32h             ; '2'
        DB      76h             ; 'v'
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      10h
        DB      10h
        DB      22h             ; '"'
        DB      70h             ; 'p'
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      15h
        DB      15h
        DB      22h             ; '"'
        DB      74h             ; 't'
        DB      73h             ; 's'
        DB      0C9h
        DB      21h             ; '!'
        DB      74h             ; 't'
        DB      73h             ; 's'
        DB      11h
        DB      0AEh
        DB      01h
        DB      18h
        DB      06h
        DB      21h             ; '!'
        DB      70h             ; 'p'
        DB      73h             ; 's'
        DB      11h
        DB      0AAh
        DB      01h
        DB      7Eh             ; '~'
        DB      2Ch             ; ','
        DB      35h             ; '5'
        DB      0C0h
        DB      77h             ; 'w'
        DB      2Ch             ; ','
        DB      7Eh             ; '~'
        DB      3Ch             ; '<'
        DB      0E6h
        DB      07h
        DB      77h             ; 'w'
        DB      0EBh
        DB      0C3h
        DB      3Eh             ; '>'
        DB      33h             ; '3'
        DB      21h             ; '!'
        DB      0AEh
        DB      01h
        DB      18h
        DB      03h
        DB      21h             ; '!'
        DB      0AAh
        DB      01h
        DB      0CDh
        DB      0F9h
        DB      3Dh             ; '='
        DB      0CDh
        DB      0FBh
        DB      3Dh             ; '='
        DB      11h
        DB      1Eh
        DB      00h
        DB      19h
        DB      3Eh             ; '>'
        DB      0DAh
        DB      0CDh
        DB      0FBh
        DB      3Dh             ; '='
        DB      0C3h
        DB      0FBh
        DB      3Dh             ; '='
        DB      0CDh
        DB      0A2h
        DB      35h             ; '5'
        DB      0CDh
        DB      71h             ; 'q'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      0B7h
        DB      35h             ; '5'
        DB      0CDh
        DB      0F9h
        DB      35h             ; '5'
        DB      21h             ; '!'
        DB      87h
        DB      36h             ; '6'
        DB      22h             ; '"'
        DB      "|s*Jt:Lt"
        DB      85h
        DB      "2Lt:Mt"
        DB      8Ch
        DB      0C8h
        DB      32h             ; '2'
        DB      4Dh             ; 'M'
        DB      74h             ; 't'
        DB      0CDh
        DB      6Fh             ; 'o'
        DB      35h             ; '5'
        DB      0CDh
        DB      "s5!Mt5 "
        DB      0F4h
        DB      0C9h
        DB      2Ah             ; '*'
        DB      7Ch             ; '|'
        DB      73h             ; 's'
        DB      0E9h
        DB      3Ah             ; ':'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0A7h
        DB      0F8h
        DB      28h             ; '('
        DB      0Ah
        DB      0FEh
        DB      02h
        DB      38h             ; '8'
        DB      13h
        DB      28h             ; '('
        DB      15h
        DB      0FDh
        DB      34h             ; '4'
        DB      00h
        DB      0C9h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      3Ch             ; '<'
        DB      0FEh
        DB      0C0h
        DB      38h             ; '8'
        DB      01h
        DB      0AFh
        DB      0FDh
        DB      77h             ; 'w'
        DB      01h
        DB      0C9h
        DB      0FDh
        DB      35h             ; '5'
        DB      00h
        DB      0C9h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0D6h
        DB      01h
        DB      30h             ; '0'
        DB      02h
        DB      3Eh             ; '>'
        DB      0BFh
        DB      0FDh
        DB      77h             ; 'w'
        DB      01h
        DB      0C9h
        DB      21h             ; '!'
        DB      58h             ; 'X'
        DB      60h             ; '`'
        DB      22h             ; '"'
        DB      00h
        DB      7Fh
        DB      0AFh
        DB      "2Ftog"
        DB      22h             ; '"'
        DB      4Ch             ; 'L'
        DB      74h             ; 't'
        DB      21h             ; '!'
        DB      02h
        DB      02h
        DB      22h             ; '"'
        DB      "Ht:Ft=>"
        DB      0Ah
        DB      20h             ; ' '
        DB      09h
        DB      2Ah             ; '*'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0CBh
        DB      5Eh             ; '^'
        DB      28h             ; '('
        DB      02h
        DB      3Eh             ; '>'
        DB      0Fh
        DB      32h             ; '2'
        DB      03h
        DB      7Fh
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      07h
        DB      21h             ; '!'
        DB      0F1h
        DB      35h             ; '5'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      3Ah             ; ':'
        DB      46h             ; 'F'
        DB      74h             ; 't'
        DB      0A7h
        DB      7Eh             ; '~'
        DB      28h             ; '('
        DB      01h
        DB      3Ch             ; '<'
        DB      0FEh
        DB      10h
        DB      30h             ; '0'
        DB      07h
        DB      87h
        DB      87h
        DB      4Fh             ; 'O'
        DB      3Ah             ; ':'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      81h
        DB      87h
        DB      87h
        DB      32h             ; '2'
        DB      02h
        DB      7Fh
        DB      0C9h
        DB      02h
        DB      02h
        DB      00h
        DB      00h
        DB      00h
        DB      02h
        DB      10h
        DB      10h
        DB      3Ah             ; ':'
        DB      46h             ; 'F'
        DB      74h             ; 't'
        DB      0A7h
        DB      28h             ; '('
        DB      10h
        DB      3Ah             ; ':'
        DB      3Ch             ; '<'
        DB      73h             ; 's'
        DB      0A7h
        DB      21h             ; '!'
        DB      80h
        DB      01h
        DB      28h             ; '('
        DB      03h
        DB      21h             ; '!'
        DB      00h
        DB      02h
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      21h             ; '!'
        DB      44h             ; 'D'
        DB      73h             ; 's'
        DB      3Ah             ; ':'
        DB      92h
        DB      73h             ; 's'
        DB      0BDh
        DB      30h             ; '0'
        DB      11h
        DB      0BCh
        DB      30h             ; '0'
        DB      07h
        DB      2Ah             ; '*'
        DB      56h             ; 'V'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      2Ah             ; '*'
        DB      54h             ; 'T'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      2Ah             ; '*'
        DB      50h             ; 'P'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      0CDh
        DB      66h             ; 'f'
        DB      36h             ; '6'
        DB      3Ch             ; '<'
        DB      32h             ; '2'
        DB      03h
        DB      76h             ; 'v'
        DB      21h             ; '!'
        DB      78h             ; 'x'
        DB      00h
        DB      0CDh
        DB      "|-:Bt"
        DB      0E6h
        DB      0F8h
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      21h             ; '!'
        DB      78h             ; 'x'
        DB      36h             ; '6'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      6Eh             ; 'n'
        DB      26h             ; '&'
        DB      0Ah
        DB      22h             ; '"'
        DB      02h
        DB      7Fh
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      21h             ; '!'
        DB      0F0h
        DB      00h
        DB      22h             ; '"'
        DB      00h
        DB      7Fh
        DB      21h             ; '!'
        DB      0ABh
        DB      2Eh             ; '.'
        DB      22h             ; '"'
        DB      00h
        DB      74h             ; 't'
        DB      0CDh
        DB      71h             ; 'q'
        DB      2Dh             ; '-'
        DB      0C9h
        DB      0AFh
        DB      32h             ; '2'
        DB      0Bh
        DB      76h             ; 'v'
        DB      0AFh
        DB      32h             ; '2'
        DB      0Ch
        DB      76h             ; 'v'
        DB      32h             ; '2'
        DB      0Dh
        DB      76h             ; 'v'
        DB      32h             ; '2'
        DB      0Eh
        DB      76h             ; 'v'
        DB      32h             ; '2'
        DB      0Fh
        DB      76h             ; 'v'
        DB      0C9h
        DB      0DCh
        DB      0DCh
        DB      0DCh
        DB      0DCh
        DB      0DCh
        DB      0DCh
        DB      0DCh
        DB      0D8h
        DB      0D4h
        DB      0D0h
        DB      0CCh
        DB      0C8h
        DB      04h
        DB      24h             ; '$'
        DB      40h             ; '@'
        DB      0CDh
        DB      0D0h
        DB      "8*Ht}"
        DB      0EEh
        DB      02h
        DB      0BCh
        DB      28h             ; '('
        DB      3Bh             ; ';'
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0E6h
        DB      0Fh
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0D6h
        DB      08h
        DB      0E6h
        DB      0Fh
        DB      0C0h
        DB      0AFh
        DB      32h             ; '2'
        DB      0Bh
        DB      73h             ; 's'
        DB      3Ah             ; ':'
        DB      46h             ; 'F'
        DB      74h             ; 't'
        DB      0A7h
        DB      28h             ; '('
        DB      06h
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      22h             ; '"'
        DB      08h
        DB      73h             ; 's'
        DB      0CDh
        DB      0F0h
        DB      36h             ; '6'
        DB      3Eh             ; '>'
        DB      3Ch             ; '<'
        DB      32h             ; '2'
        DB      0Bh
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      0C5h
        DB      3Ah             ; ':'
        DB      22h             ; '"'
        DB      08h
        DB      73h             ; 's'
        DB      0CDh
        DB      84h
        DB      "7*Ht}"
        DB      0BCh
        DB      28h             ; '('
        DB      11h
        DB      0CDh
        DB      0E7h
        DB      36h             ; '6'
        DB      38h             ; '8'
        DB      07h
        DB      ":Ht2It"
        DB      0C9h
        DB      3Ah             ; ':'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0A7h
        DB      0F8h
        DB      0CDh
        DB      0E7h
        DB      36h             ; '6'
        DB      0D0h
        DB      3Ah             ; ':'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0F6h
        DB      80h
        DB      32h             ; '2'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0C9h
        DB      47h             ; 'G'
        DB      04h
        DB      3Ah             ; ':'
        DB      79h             ; 'y'
        DB      73h             ; 's'
        DB      0Fh
        DB      10h
        DB      0FDh
        DB      0C9h
        DB      21h             ; '!'
        DB      08h
        DB      0Fh
        DB      0CDh
        DB      44h             ; 'D'
        DB      37h             ; '7'
        DB      21h             ; '!'
        DB      08h
        DB      10h
        DB      0CDh
        DB      39h             ; '9'
        DB      37h             ; '7'
        DB      21h             ; '!'
        DB      00h
        DB      08h
        DB      0CDh
        DB      44h             ; 'D'
        DB      37h             ; '7'
        DB      21h             ; '!'
        DB      0FFh
        DB      08h
        DB      0CDh
        DB      39h             ; '9'
        DB      37h             ; '7'
        DB      21h             ; '!'
        DB      08h
        DB      00h
        DB      0CDh
        DB      44h             ; 'D'
        DB      37h             ; '7'
        DB      21h             ; '!'
        DB      08h
        DB      0FFh
        DB      0CDh
        DB      39h             ; '9'
        DB      37h             ; '7'
        DB      21h             ; '!'
        DB      0Fh
        DB      08h
        DB      0CDh
        DB      44h             ; 'D'
        DB      37h             ; '7'
        DB      21h             ; '!'
        DB      10h
        DB      08h
        DB      0CDh
        DB      39h             ; '9'
        DB      37h             ; '7'
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0FEh
        DB      78h             ; 'x'
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0FEh
        DB      50h             ; 'P'
        DB      28h             ; '('
        DB      03h
        DB      0FEh
        DB      70h             ; 'p'
        DB      0C0h
        DB      3Ah             ; ':'
        DB      79h             ; 'y'
        DB      73h             ; 's'
        DB      0F6h
        DB      02h
        DB      32h             ; '2'
        DB      79h             ; 'y'
        DB      73h             ; 's'
        DB      0C9h
        DB      0D4h
        DB      "D7:ys"
        DB      17h
        DB      32h             ; '2'
        DB      79h             ; 'y'
        DB      73h             ; 's'
        DB      0C9h
        DB      0CDh
        DB      5Bh             ; '['
        DB      37h             ; '7'
        DB      0C6h
        DB      30h             ; '0'
        DB      0D0h
        DB      0E6h
        DB      1Fh
        DB      1Fh
        DB      "o&s~8"
        DB      04h
        DB      07h
        DB      10h
        DB      0FDh
        DB      0C9h
        DB      0Fh
        DB      10h
        DB      0FDh
        DB      0C9h
        DB      06h
        DB      00h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      85h
        DB      0FEh
        DB      08h
        DB      30h             ; '0'
        DB      02h
        DB      0C6h
        DB      0C0h
        DB      6Fh             ; 'o'
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      84h
        DB      1Fh
        DB      1Fh
        DB      1Fh
        DB      0CBh
        DB      10h
        DB      1Fh
        DB      0CBh
        DB      1Dh
        DB      1Fh
        DB      0CBh
        DB      1Dh
        DB      1Fh
        DB      0CBh
        DB      1Dh
        DB      0CBh
        DB      10h
        DB      04h
        DB      0E6h
        DB      03h
        DB      0C6h
        DB      7Ch             ; '|'
        DB      67h             ; 'g'
        DB      7Eh             ; '~'
        DB      0C9h
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      0CDh
        DB      5Bh             ; '['
        DB      37h             ; '7'
        DB      0FEh
        DB      0F0h
        DB      0D2h
        DB      0A2h
        DB      37h             ; '7'
        DB      0FEh
        DB      0E8h
        DB      0D2h
        DB      0B9h
        DB      37h             ; '7'
        DB      0FEh
        DB      0C8h
        DB      0D0h
        DB      0FEh
        DB      0B0h
        DB      0D2h
        DB      20h             ; ' '
        DB      38h             ; '8'
        DB      0FEh
        DB      8Ch
        DB      0D2h
        DB      8Dh
        DB      38h             ; '8'
        DB      0C9h
        DB      11h
        DB      0Ch
        DB      33h             ; '3'
        DB      0CDh
        DB      0Ah
        DB      39h             ; '9'
        DB      0CDh
        DB      0CCh
        DB      32h             ; '2'
        DB      0CDh
        DB      1Ch
        DB      39h             ; '9'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      08h
        DB      76h             ; 'v'
        DB      11h
        DB      50h             ; 'P'
        DB      00h
        DB      0C3h
        DB      3Bh             ; ';'
        DB      3Dh             ; '='
        DB      0CDh
        DB      66h             ; 'f'
        DB      36h             ; '6'
        DB      0CDh
        DB      0D1h
        DB      34h             ; '4'
        DB      21h             ; '!'
        DB      7Bh             ; '{'
        DB      2Dh             ; '-'
        DB      22h             ; '"'
        DB      18h
        DB      74h             ; 't'
        DB      0CDh
        DB      0D8h
        DB      2Ch             ; ','
        DB      21h             ; '!'
        DB      80h
        DB      7Fh
        DB      11h
        DB      00h
        DB      7Fh
        DB      01h
        DB      80h
        DB      00h
        DB      0EDh
        DB      0B0h
        DB      3Ah             ; ':'
        DB      96h
        DB      73h             ; 's'
        DB      0E6h
        DB      0FCh
        DB      0C6h
        DB      0B0h
        DB      6Fh             ; 'o'
        DB      0Eh
        DB      "<:rsG:vs"
        DB      0B8h
        DB      20h             ; ' '
        DB      11h
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      0Ah
        DB      76h             ; 'v'
        DB      0Eh
        DB      78h             ; 'x'
        DB      2Eh             ; '.'
        DB      0C0h
        DB      3Ah             ; ':'
        DB      94h
        DB      73h             ; 's'
        DB      0B8h
        DB      20h             ; ' '
        DB      02h
        DB      2Eh             ; '.'
        DB      0C4h
        DB      26h             ; '&'
        DB      0Fh
        DB      22h             ; '"'
        DB      02h
        DB      7Fh
        DB      7Dh             ; '}'
        DB      0D6h
        DB      0B0h
        DB      0Fh
        DB      0Fh
        DB      0CDh
        DB      30h             ; '0'
        DB      3Dh             ; '='
        DB      69h             ; 'i'
        DB      26h             ; '&'
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0CDh
        DB      29h             ; ')'
        DB      35h             ; '5'
        DB      0CDh
        DB      24h             ; '$'
        DB      35h             ; '5'
        DB      21h             ; '!'
        DB      00h
        DB      75h             ; 'u'
        DB      11h
        DB      00h
        DB      74h             ; 't'
        DB      01h
        DB      00h
        DB      01h
        DB      0EDh
        DB      0B0h
        DB      0C9h
        DB      11h
        DB      0F1h
        DB      33h             ; '3'
        DB      0CDh
        DB      0Ah
        DB      39h             ; '9'
        DB      0CDh
        DB      0A4h
        DB      33h             ; '3'
        DB      0CDh
        DB      39h             ; '9'
        DB      38h             ; '8'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      06h
        DB      76h             ; 'v'
        DB      11h
        DB      00h
        DB      01h
        DB      0CDh
        DB      3Bh             ; ';'
        DB      3Dh             ; '='
        DB      18h
        DB      74h             ; 't'
        DB      78h             ; 'x'
        DB      0FEh
        DB      02h
        DB      30h             ; '0'
        DB      0Ch
        DB      3Eh             ; '>'
        DB      02h
        DB      "2Ft!r4"
        DB      22h             ; '"'
        DB      10h
        DB      74h             ; 't'
        DB      0C9h
        DB      0AFh
        DB      "2:s!it"
        DB      11h
        DB      10h
        DB      00h
        DB      06h
        DB      04h
        DB      7Eh             ; '~'
        DB      0EEh
        DB      02h
        DB      77h             ; 'w'
        DB      19h
        DB      10h
        DB      0F9h
        DB      21h             ; '!'
        DB      13h
        DB      3Ah             ; ':'
        DB      0CDh
        DB      80h
        DB      38h             ; '8'
        DB      2Ah             ; '*'
        DB      48h             ; 'H'
        DB      73h             ; 's'
        DB      0EDh
        DB      5Bh             ; '['
        DB      12h
        DB      74h             ; 't'
        DB      0A7h
        DB      0EDh
        DB      52h             ; 'R'
        DB      19h
        DB      38h             ; '8'
        DB      03h
        DB      22h             ; '"'
        DB      12h
        DB      74h             ; 't'
        DB      22h             ; '"'
        DB      62h             ; 'b'
        DB      74h             ; 't'
        DB      22h             ; '"'
        DB      72h             ; 'r'
        DB      74h             ; 't'
        DB      22h             ; '"'
        DB      82h
        DB      74h             ; 't'
        DB      22h             ; '"'
        DB      92h
        DB      74h             ; 't'
        DB      0C9h
        DB      22h             ; '"'
        DB      60h             ; '`'
        DB      74h             ; 't'
        DB      22h             ; '"'
        DB      70h             ; 'p'
        DB      74h             ; 't'
        DB      22h             ; '"'
        DB      80h
        DB      74h             ; 't'
        DB      22h             ; '"'
        DB      90h
        DB      74h             ; 't'
        DB      0C9h
        DB      11h
        DB      62h             ; 'b'
        DB      33h             ; '3'
        DB      0CDh
        DB      0Ah
        DB      39h             ; '9'
        DB      0CDh
        DB      4Ah             ; 'J'
        DB      33h             ; '3'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      09h
        DB      76h             ; 'v'
        DB      3Ah             ; ':'
        DB      97h
        DB      73h             ; 's'
        DB      87h
        DB      21h             ; '!'
        DB      0BEh
        DB      38h             ; '8'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      5Eh             ; '^'
        DB      23h             ; '#'
        DB      56h             ; 'V'
        DB      0CDh
        DB      3Bh             ; ';'
        DB      3Dh             ; '='
        DB      3Ah             ; ':'
        DB      92h
        DB      73h             ; 's'
        DB      3Dh             ; '='
        DB      32h             ; '2'
        DB      92h
        DB      73h             ; 's'
        DB      0FEh
        DB      14h
        DB      0C0h
        DB      21h             ; '!'
        DB      97h
        DB      34h             ; '4'
        DB      22h             ; '"'
        DB      18h
        DB      74h             ; 't'
        DB      0C9h
        DB      10h
        DB      00h
        DB      20h             ; ' '
        DB      00h
        DB      30h             ; '0'
        DB      00h
        DB      40h             ; '@'
        DB      00h
        DB      50h             ; 'P'
        DB      00h
        DB      60h             ; '`'
        DB      00h
        DB      70h             ; 'p'
        DB      00h
        DB      80h
        DB      00h
        DB      00h
        DB      01h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0E6h
        DB      07h
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0E6h
        DB      07h
        DB      0C0h
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      0CDh
        DB      5Bh             ; '['
        DB      37h             ; '7'
        DB      0E6h
        DB      0FEh
        DB      0FEh
        DB      0E2h
        DB      28h             ; '('
        DB      0Eh
        DB      23h             ; '#'
        DB      7Eh             ; '~'
        DB      0FEh
        DB      0E1h
        DB      28h             ; '('
        DB      08h
        DB      11h
        DB      1Fh
        DB      00h
        DB      19h
        DB      7Eh             ; '~'
        DB      0FEh
        DB      0E0h
        DB      0C0h
        DB      11h
        DB      5Fh             ; '_'
        DB      32h             ; '2'
        DB      0CDh
        DB      0Ah
        DB      39h             ; '9'
        DB      0CDh
        DB      16h
        DB      32h             ; '2'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      07h
        DB      76h             ; 'v'
        DB      11h
        DB      00h
        DB      02h
        DB      0C3h
        DB      3Bh             ; ';'
        DB      3Dh             ; '='
        DB      06h
        DB      00h
        DB      1Ah
        DB      0BDh
        DB      20h             ; ' '
        DB      07h
        DB      13h
        DB      1Ah
        DB      1Bh
        DB      0ACh
        DB      0E6h
        DB      03h
        DB      0C8h
        DB      13h
        DB      13h
        DB      04h
        DB      18h
        DB      0F0h
        DB      78h             ; 'x'
        DB      87h
        DB      80h
        DB      21h             ; '!'
        DB      38h             ; '8'
        DB      39h             ; '9'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      06h
        DB      03h
        DB      7Eh             ; '~'
        DB      23h             ; '#'
        DB      0A7h
        DB      0F8h
        DB      0E5h
        DB      0C5h
        DB      47h             ; 'G'
        DB      0CDh
        DB      04h
        DB      32h             ; '2'
        DB      0C1h
        DB      0E1h
        DB      10h
        DB      0F2h
        DB      0C9h
        DB      00h
        DB      03h
        DB      80h
        DB      02h
        DB      06h
        DB      80h
        DB      01h
        DB      04h
        DB      80h
        DB      05h
        DB      19h
        DB      80h
        DB      07h
        DB      0Bh
        DB      0Ah
        DB      08h
        DB      0Eh
        DB      0Fh
        DB      11h
        DB      17h
        DB      80h
        DB      0Ch
        DB      12h
        DB      13h
        DB      0Dh
        DB      14h
        DB      15h
        DB      16h
        DB      1Bh
        DB      80h
        DB      1Ch
        DB      1Dh
        DB      80h
        DB      09h
        DB      18h
        DB      1Eh
        DB      10h
        DB      1Ah
        DB      1Fh
        DB      21h             ; '!'
        DB      20h             ; ' '
        DB      80h
        DB      0AFh
        DB      18h
        DB      0Ah
        DB      3Eh             ; '>'
        DB      01h
        DB      18h
        DB      06h
        DB      3Eh             ; '>'
        DB      02h
        DB      18h
        DB      02h
        DB      3Eh             ; '>'
        DB      03h
        DB      0CDh
        DB      9Ah
        DB      39h             ; '9'
        DB      0CDh
        DB      71h             ; 'q'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      0BCh
        DB      39h             ; '9'
        DB      0CDh
        DB      5Bh             ; '['
        DB      3Ah             ; ':'
        DB      0AFh
        DB      32h             ; '2'
        DB      0Dh
        DB      76h             ; 'v'
        DB      32h             ; '2'
        DB      0Eh
        DB      76h             ; 'v'
        DB      32h             ; '2'
        DB      0Fh
        DB      76h             ; 'v'
        DB      11h
        DB      0Fh
        DB      "v*Ds:"
        DB      92h
        DB      73h             ; 's'
        DB      0BDh
        DB      30h             ; '0'
        DB      05h
        DB      1Bh
        DB      0BCh
        DB      30h             ; '0'
        DB      01h
        DB      1Bh
        DB      3Eh             ; '>'
        DB      01h
        DB      12h
        DB      0C9h
        DB      21h             ; '!'
        DB      47h             ; 'G'
        DB      74h             ; 't'
        DB      77h             ; 'w'
        DB      87h
        DB      86h
        DB      21h             ; '!'
        DB      07h
        DB      3Ah             ; ':'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      "$~#2It~#"
        DB      0FDh
        DB      77h             ; 'w'
        DB      01h
        DB      7Eh             ; '~'
        DB      0FDh
        DB      77h             ; 'w'
        DB      00h
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      22h             ; '"'
        DB      "Lt:9s=(0:It"
        DB      87h
        DB      87h
        DB      87h
        DB      4Fh             ; 'O'
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      04h
        DB      81h
        DB      0C6h
        DB      "PO:Vt"
        DB      0A7h
        DB      79h             ; 'y'
        DB      28h             ; '('
        DB      02h
        DB      0C6h
        DB      20h             ; ' '
        DB      0FDh
        DB      77h             ; 'w'
        DB      02h
        DB      3Ah             ; ':'
        DB      47h             ; 'G'
        DB      74h             ; 't'
        DB      21h             ; '!'
        DB      0EEh
        DB      39h             ; '9'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      7Eh             ; '~'
        DB      0FDh
        DB      77h             ; 'w'
        DB      03h
        DB      0C9h
        DB      06h
        DB      0Dh
        DB      07h
        DB      09h
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      01h
        DB      4Fh             ; 'O'
        DB      87h
        DB      87h
        DB      81h
        DB      4Fh             ; 'O'
        DB      3Ah             ; ':'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0E6h
        DB      01h
        DB      87h
        DB      81h
        DB      87h
        DB      87h
        DB      18h
        DB      0C8h
        DB      00h
        DB      5Ch             ; '\'
        DB      28h             ; '('
        DB      00h
        DB      53h             ; 'S'
        DB      38h             ; '8'
        DB      02h
        DB      6Ah             ; 'j'
        DB      38h             ; '8'
        DB      02h
        DB      61h             ; 'a'
        DB      48h             ; 'H'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      0Ch
        DB      76h             ; 'v'
        DB      2Ah             ; '*'
        DB      42h             ; 'B'
        DB      74h             ; 't'
        DB      11h
        DB      3Ch             ; '<'
        DB      00h
        DB      0AFh
        DB      0A7h
        DB      0EDh
        DB      52h             ; 'R'
        DB      30h             ; '0'
        DB      01h
        DB      3Ch             ; '<'
        DB      32h             ; '2'
        DB      46h             ; 'F'
        DB      74h             ; 't'
        DB      0CDh
        DB      3Ch             ; '<'
        DB      3Ah             ; ':'
        DB      0CDh
        DB      7Eh             ; '~'
        DB      3Ah             ; ':'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      0AFh
        DB      32h             ; '2'
        DB      0Ch
        DB      76h             ; 'v'
        DB      21h             ; '!'
        DB      75h             ; 'u'
        DB      39h             ; '9'
        DB      22h             ; '"'
        DB      40h             ; '@'
        DB      74h             ; 't'
        DB      0E9h
        DB      3Ah             ; ':'
        DB      46h             ; 'F'
        DB      74h             ; 't'
        DB      0A7h
        DB      28h             ; '('
        DB      09h
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      08h
        DB      3Eh             ; '>'
        DB      0Fh
        DB      20h             ; ' '
        DB      02h
        DB      3Eh             ; '>'
        DB      04h
        DB      0FDh
        DB      77h             ; 'w'
        DB      03h
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      04h
        DB      0C6h
        DB      48h             ; 'H'
        DB      0FDh
        DB      77h             ; 'w'
        DB      02h
        DB      0C9h
        DB      0CDh
        DB      63h             ; 'c'
        DB      3Ch             ; '<'
        DB      0CDh
        DB      0Dh
        DB      3Ch             ; '<'
        DB      3Ah             ; ':'
        DB      46h             ; 'F'
        DB      74h             ; 't'
        DB      0A7h
        DB      "():9s"
        DB      0FEh
        DB      01h
        DB      0C8h
        DB      21h             ; '!'
        DB      45h             ; 'E'
        DB      3Bh             ; ';'
        DB      38h             ; '8'
        DB      03h
        DB      21h             ; '!'
        DB      29h             ; ')'
        DB      3Bh             ; ';'
        DB      22h             ; '"'
        DB      7Ah             ; 'z'
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      0A9h
        DB      3Ah             ; ':'
        DB      0C3h
        DB      "M5! ;"
        DB      22h             ; '"'
        DB      7Ah             ; 'z'
        DB      73h             ; 's'
        DB      0CDh
        DB      83h
        DB      3Ch             ; '<'
        DB      0CDh
        DB      3Ch             ; '<'
        DB      3Ch             ; '<'
        DB      21h             ; '!'
        DB      0A9h
        DB      3Ah             ; ':'
        DB      0C3h
        DB      4Dh             ; 'M'
        DB      35h             ; '5'
        DB      21h             ; '!'
        DB      1Ah
        DB      3Bh             ; ';'
        DB      22h             ; '"'
        DB      7Ah             ; 'z'
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      00h
        DB      00h
        DB      2Ah             ; '*'
        DB      08h
        DB      73h             ; 's'
        DB      21h             ; '!'
        DB      0A9h
        DB      3Ah             ; ':'
        DB      0CDh
        DB      4Dh             ; 'M'
        DB      35h             ; '5'
        DB      21h             ; '!'
        DB      0C5h
        DB      3Ah             ; ':'
        DB      22h             ; '"'
        DB      08h
        DB      73h             ; 's'
        DB      0C9h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0E6h
        DB      0Fh
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0D6h
        DB      08h
        DB      0E6h
        DB      0Fh
        DB      0C0h
        DB      0CDh
        DB      0F0h
        DB      36h             ; '6'
        DB      0CDh
        DB      0EBh
        DB      3Ah             ; ':'
        DB      0CDh
        DB      16h
        DB      3Bh             ; ';'
        DB      0CDh
        DB      0D0h
        DB      3Bh             ; ';'
        DB      3Ah             ; ':'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0EEh
        DB      02h
        DB      4Fh             ; 'O'
        DB      06h
        DB      04h
        DB      3Ah             ; ':'
        DB      48h             ; 'H'
        DB      74h             ; 't'
        DB      0E6h
        DB      03h
        DB      0B9h
        DB      28h             ; '('
        DB      09h
        DB      32h             ; '2'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0C5h
        DB      0CDh
        DB      0E7h
        DB      36h             ; '6'
        DB      0C1h
        DB      0D0h
        DB      3Ah             ; ':'
        DB      48h             ; 'H'
        DB      74h             ; 't'
        DB      0Fh
        DB      0Fh
        DB      32h             ; '2'
        DB      48h             ; 'H'
        DB      74h             ; 't'
        DB      10h
        DB      0E5h
        DB      79h             ; 'y'
        DB      32h             ; '2'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0C9h
        DB      3Ah             ; ':'
        DB      39h             ; '9'
        DB      73h             ; 's'
        DB      0A7h
        DB      0C0h
        DB      21h             ; '!'
        DB      79h             ; 'y'
        DB      73h             ; 's'
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0FEh
        DB      58h             ; 'X'
        DB      20h             ; ' '
        DB      09h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0FEh
        DB      60h             ; '`'
        DB      0C0h
        DB      0CBh
        DB      0DEh
        DB      0C9h
        DB      0FEh
        DB      98h
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0FEh
        DB      30h             ; '0'
        DB      20h             ; ' '
        DB      03h
        DB      0CBh
        DB      0D6h
        DB      0C9h
        DB      0FEh
        DB      90h
        DB      0C0h
        DB      0CBh
        DB      0C6h
        DB      0C9h
        DB      2Ah             ; '*'
        DB      7Ah             ; 'z'
        DB      73h             ; 's'
        DB      0E9h
        DB      21h             ; '!'
        DB      60h             ; '`'
        DB      48h             ; 'H'
        DB      0Eh
        DB      00h
        DB      0C9h
        DB      2Ah             ; '*'
        DB      00h
        DB      7Fh
        DB      7Dh             ; '}'
        DB      6Ch             ; 'l'
        DB      65h             ; 'e'
        DB      0Eh
        DB      04h
        DB      0C9h
        DB      0Eh
        DB      00h
        DB      3Ah             ; ':'
        DB      47h             ; 'G'
        DB      74h             ; 't'
        DB      87h
        DB      21h             ; '!'
        DB      3Dh             ; '='
        DB      3Bh             ; ';'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      "$~#fo"
        DB      18h
        DB      65h             ; 'e'
        DB      08h
        DB      0B0h
        DB      08h
        DB      10h
        DB      0A8h
        DB      0B0h
        DB      0A8h
        DB      10h
        DB      0Eh
        DB      00h
        DB      "!X;:Gt"
        DB      87h
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      "$~#fo"
        DB      0E9h
        DB      9Fh
        DB      3Bh             ; ';'
        DB      60h             ; '`'
        DB      3Bh             ; ';'
        DB      82h
        DB      3Bh             ; ';'
        DB      93h
        DB      3Bh             ; ';'
        DB      3Ah             ; ':'
        DB      59h             ; 'Y'
        DB      74h             ; 't'
        DB      87h
        DB      21h             ; '!'
        DB      7Ah             ; 'z'
        DB      3Bh             ; ';'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      "$^#V*"
        DB      00h
        DB      7Fh
        DB      7Dh             ; '}'
        DB      83h
        DB      6Fh             ; 'o'
        DB      7Ch             ; '|'
        DB      82h
        DB      67h             ; 'g'
        DB      18h
        DB      28h             ; '('
        DB      00h
        DB      20h             ; ' '
        DB      0E0h
        DB      00h
        DB      00h
        DB      0E0h
        DB      20h             ; ' '
        DB      00h
        DB      2Ah             ; '*'
        DB      04h
        DB      7Fh
        DB      3Ah             ; ':'
        DB      00h
        DB      7Fh
        DB      87h
        DB      95h
        DB      6Fh             ; 'o'
        DB      3Ah             ; ':'
        DB      01h
        DB      7Fh
        DB      87h
        DB      94h
        DB      67h             ; 'g'
        DB      18h
        DB      0Fh
        DB      0CDh
        DB      17h
        DB      3Dh             ; '='
        DB      0FEh
        DB      21h             ; '!'
        DB      30h             ; '0'
        DB      05h
        DB      0CDh
        DB      9Ch
        DB      20h             ; ' '
        DB      18h
        DB      03h
        DB      2Ah             ; '*'
        DB      00h
        DB      7Fh
        DB      7Dh             ; '}'
        DB      6Ch             ; 'l'
        DB      67h             ; 'g'
        DB      0CDh
        DB      0BBh
        DB      3Bh             ; ';'
        DB      7Ch             ; '|'
        DB      0FEh
        DB      58h             ; 'X'
        DB      0C0h
        DB      7Dh             ; '}'
        DB      0FEh
        DB      28h             ; '('
        DB      38h             ; '8'
        DB      06h
        DB      0FEh
        DB      0A0h
        DB      0D8h
        DB      2Eh             ; '.'
        DB      00h
        DB      0C9h
        DB      3Eh             ; '>'
        DB      0C0h
        DB      6Fh             ; 'o'
        DB      0C9h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0FEh
        DB      38h             ; '8'
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0FEh
        DB      60h             ; '`'
        DB      0C0h
        DB      3Ah             ; ':'
        DB      49h             ; 'I'
        DB      74h             ; 't'
        DB      0Fh
        DB      0D8h
        DB      21h             ; '!'
        DB      60h             ; '`'
        DB      28h             ; '('
        DB      0C9h
        DB      7Ch             ; '|'
        DB      0FDh
        DB      96h
        DB      00h
        DB      0CBh
        DB      1Bh
        DB      0F2h
        DB      0DBh
        DB      3Bh             ; ';'
        DB      0EDh
        DB      44h             ; 'D'
        DB      57h             ; 'W'
        DB      7Dh             ; '}'
        DB      0FDh
        DB      96h
        DB      01h
        DB      0CBh
        DB      1Bh
        DB      0F2h
        DB      0E7h
        DB      3Bh             ; ';'
        DB      0EDh
        DB      44h             ; 'D'
        DB      0BAh
        DB      3Eh             ; '>'
        DB      00h
        DB      17h
        DB      0CBh
        DB      13h
        DB      30h             ; '0'
        DB      02h
        DB      0EEh
        DB      03h
        DB      0CBh
        DB      13h
        DB      30h             ; '0'
        DB      02h
        DB      0EEh
        DB      07h
        DB      0A9h
        DB      21h             ; '!'
        DB      05h
        DB      3Ch             ; '<'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      "$~2Ht"
        DB      0C9h
        DB      9Ch
        DB      63h             ; 'c'
        DB      4Bh             ; 'K'
        DB      1Eh
        DB      36h             ; '6'
        DB      0C9h
        DB      0E1h
        DB      0B4h
        DB      0CDh
        DB      "O<06:Gt!Cs"
        DB      0BEh
        DB      30h             ; '0'
        DB      1Ah
        DB      2Ah             ; '*'
        DB      44h             ; 'D'
        DB      73h             ; 's'
        DB      3Ah             ; ':'
        DB      92h
        DB      73h             ; 's'
        DB      0BDh
        DB      30h             ; '0'
        DB      11h
        DB      0BCh
        DB      30h             ; '0'
        DB      07h
        DB      2Ah             ; '*'
        DB      56h             ; 'V'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      2Ah             ; '*'
        DB      54h             ; 'T'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      2Ah             ; '*'
        DB      52h             ; 'R'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      0CDh
        DB      4Fh             ; 'O'
        DB      3Ch             ; '<'
        DB      30h             ; '0'
        DB      07h
        DB      2Ah             ; '*'
        DB      5Ah             ; 'Z'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      2Ah             ; '*'
        DB      58h             ; 'X'
        DB      73h             ; 's'
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0C9h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0FEh
        DB      58h             ; 'X'
        DB      37h             ; '7'
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0D6h
        DB      11h
        DB      0FEh
        DB      3Fh             ; '?'
        DB      0D8h
        DB      0D6h
        DB      60h             ; '`'
        DB      0FEh
        DB      3Fh             ; '?'
        DB      0C9h
        DB      3Ah             ; ':'
        DB      56h             ; 'V'
        DB      74h             ; 't'
        DB      0A7h
        DB      0C0h
        DB      3Ah             ; ':'
        DB      92h
        DB      73h             ; 's'
        DB      0A7h
        DB      0C8h
        DB      0CDh
        DB      17h
        DB      3Dh             ; '='
        DB      0FEh
        DB      05h
        DB      0D0h
        DB      0CDh
        DB      0D8h
        DB      2Ch             ; ','
        DB      2Ah             ; '*'
        DB      80h
        DB      7Fh
        DB      22h             ; '"'
        DB      00h
        DB      7Fh
        DB      21h             ; '!'
        DB      30h             ; '0'
        DB      36h             ; '6'
        DB      22h             ; '"'
        DB      50h             ; 'P'
        DB      74h             ; 't'
        DB      0C9h
        DB      0CDh
        DB      17h
        DB      3Dh             ; '='
        DB      0FEh
        DB      09h
        DB      0D0h
        DB      0CDh
        DB      6Ah             ; 'j'
        DB      36h             ; '6'
        DB      3Ch             ; '<'
        DB      32h             ; '2'
        DB      05h
        DB      76h             ; 'v'
        DB      0CDh
        DB      0D8h
        DB      2Ch             ; ','
        DB      0FDh
        DB      0E5h
        DB      0D1h
        DB      7Bh             ; '{'
        DB      0C6h
        DB      80h
        DB      6Fh             ; 'o'
        DB      62h             ; 'b'
        DB      01h
        DB      04h
        DB      00h
        DB      0EDh
        DB      0B0h
        DB      3Ah             ; ':'
        DB      3Ah             ; ':'
        DB      73h             ; 's'
        DB      87h
        DB      87h
        DB      0C6h
        DB      0B0h
        DB      0FDh
        DB      77h             ; 'w'
        DB      02h
        DB      3Eh             ; '>'
        DB      0Fh
        DB      0FDh
        DB      77h             ; 'w'
        DB      03h
        DB      3Ah             ; ':'
        DB      3Ah             ; ':'
        DB      73h             ; 's'
        DB      0CDh
        DB      "0=!:s4!<"
        DB      00h
        DB      0CDh
        DB      7Ch             ; '|'
        DB      2Dh             ; '-'
        DB      0CDh
        DB      8Dh
        DB      2Dh             ; '-'
        DB      21h             ; '!'
        DB      80h
        DB      7Fh
        DB      11h
        DB      00h
        DB      7Fh
        DB      01h
        DB      80h
        DB      00h
        DB      0EDh
        DB      0B0h
        DB      21h             ; '!'
        DB      00h
        DB      75h             ; 'u'
        DB      11h
        DB      00h
        DB      74h             ; 't'
        DB      01h
        DB      00h
        DB      01h
        DB      0EDh
        DB      0B0h
        DB      21h             ; '!'
        DB      00h
        DB      03h
        DB      22h             ; '"'
        DB      4Ah             ; 'J'
        DB      74h             ; 't'
        DB      0CDh
        DB      "q-:It"
        DB      87h
        DB      87h
        DB      0C6h
        DB      90h
        DB      4Fh             ; 'O'
        DB      3Ah             ; ':'
        DB      56h             ; 'V'
        DB      74h             ; 't'
        DB      0A7h
        DB      79h             ; 'y'
        DB      28h             ; '('
        DB      02h
        DB      0C6h
        DB      10h
        DB      0FDh
        DB      77h             ; 'w'
        DB      02h
        DB      3Eh             ; '>'
        DB      04h
        DB      0FDh
        DB      77h             ; 'w'
        DB      03h
        DB      0CDh
        DB      90h
        DB      3Ah             ; ':'
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      0FEh
        DB      48h             ; 'H'
        DB      0C0h
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      0D6h
        DB      5Ch             ; '\'
        DB      0FEh
        DB      09h
        DB      0D0h
        DB      3Eh             ; '>'
        DB      01h
        DB      "2Ft!u9"
        DB      22h             ; '"'
        DB      40h             ; '@'
        DB      74h             ; 't'
        DB      0C9h
        DB      2Ah             ; '*'
        DB      00h
        DB      7Fh
        DB      0FDh
        DB      7Eh             ; '~'
        DB      00h
        DB      95h
        DB      30h             ; '0'
        DB      02h
        DB      0EDh
        DB      44h             ; 'D'
        DB      6Fh             ; 'o'
        DB      0FDh
        DB      7Eh             ; '~'
        DB      01h
        DB      94h
        DB      30h             ; '0'
        DB      02h
        DB      0EDh
        DB      44h             ; 'D'
        DB      85h
        DB      0D0h
        DB      0AFh
        DB      3Dh             ; '='
        DB      0C9h
        DB      21h             ; '!'
        DB      5Ah             ; 'Z'
        DB      3Dh             ; '='
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      56h             ; 'V'
        DB      1Eh
        DB      00h
        DB      3Ah             ; ':'
        DB      90h
        DB      73h             ; 's'
        DB      83h
        DB      27h             ; '''
        DB      32h             ; '2'
        DB      90h
        DB      73h             ; 's'
        DB      3Ah             ; ':'
        DB      8Fh
        DB      73h             ; 's'
        DB      8Ah
        DB      27h             ; '''
        DB      32h             ; '2'
        DB      8Fh
        DB      73h             ; 's'
        DB      3Ah             ; ':'
        DB      8Eh
        DB      73h             ; 's'
        DB      0CEh
        DB      00h
        DB      27h             ; '''
        DB      32h             ; '2'
        DB      8Eh
        DB      73h             ; 's'
        DB      3Eh             ; '>'
        DB      01h
        DB      32h             ; '2'
        DB      38h             ; '8'
        DB      73h             ; 's'
        DB      0C9h
        DB      02h
        DB      04h
        DB      08h
        DB      16h
        DB      20h             ; ' '
        DB      50h             ; 'P'

        ; --- START PROC L3D60 ---
L3D60:  LD      A,(7338h)
        DEC     A
        RET     NZ
        LD      (7338h),A
        CALL    L3E1E
        LD      DE,7335h
        LD      HL,0059h
        CALL    L3DCE
        CALL    L3DB0
        LD      A,(7399h)
        LD      HL,733Dh
        CP      (HL)
        RET     Z
        LD      A,(738Eh)
        LD      HL,739Ah
        CP      (HL)
        RET     C
        LD      A,(7399h)
        AND     A
        JR      NZ,L3D8E
        LD      (HL),A
L3D8E:  INC     A
        CP      0FFh
        JR      Z,L3D96
        LD      (7399h),A
L3D96:  LD      A,(733Fh)
        ADD     A,(HL)
        DAA
        LD      (HL),A
        JR      NC,L3DA0
        LD      (HL),0FFh
L3DA0:  LD      A,(7391h)
        INC     A
        RET     Z
        LD      (7391h),A
        LD      A,01h
        LD      (7604h),A
        JP      L3099

        ; --- START PROC L3DB0 ---
L3DB0:  LD      DE,738Eh
        LD      HL,73CEh
        LD      A,(7332h)
        AND     A
        JR      Z,L3DBD
        EX      DE,HL
L3DBD:  PUSH    HL
        LD      HL,00B9h
        CALL    L3DCE
        POP     DE
        LD      HL,0119h
        LD      A,(7333h)
        AND     A
        JR      Z,L3E14
        ; --- START PROC L3DCE ---
L3DCE:  LD      BC,0304h
L3DD1:  LD      A,(DE)
        CALL    L3DE3
        CALL    L3DF1
        LD      A,(DE)
        INC     E
        CALL    L3DE7
        CALL    L3DF1
        DJNZ    L3DD1
        RET

        ; --- START PROC L3DE3 ---
L3DE3:  RRCA
        RRCA
        RRCA
        RRCA
        ; --- START PROC L3DE7 ---
L3DE7:  AND     0Fh
        ADD     A,30h           ; '0'
        CP      3Ah             ; ':'
        RET     C
        ADD     A,07h
        RET

        ; --- START PROC L3DF1 ---
L3DF1:  CP      30h             ; '0'
        JR      NZ,L3E10
        DEC     C
        JP      M,L3E10
        LD      A,20h           ; ' '
        ; --- START PROC L3DFB ---
L3DFB:  PUSH    BC
        LD      C,A
        LD      A,L
        OUT     (11h),A
        LD      A,H
        ADD     A,7Ch           ; '|'
        LD      H,A
        LD      (HL),C
        OUT     (11h),A
        SUB     7Ch             ; '|'
        LD      H,A
        INC     HL
        LD      A,C
        POP     BC
        OUT     (10h),A
        RET

        ; --- START PROC L3E10 ---
L3E10:  LD      C,00h
        JR      L3DFB

        ; --- START PROC L3E14 ---
L3E14:  LD      B,06h
        LD      A,20h           ; ' '
L3E18:  CALL    L3DFB
        DJNZ    L3E18
        RET

        ; --- START PROC L3E1E ---
L3E1E:  LD      DE,738Eh
        LD      HL,7335h
        LD      B,03h
L3E26:  LD      A,(DE)
        CP      (HL)
        RET     C
        JR      NZ,L3E30
        INC     E
        INC     L
        DJNZ    L3E26
        RET

L3E30:  LD      A,(DE)
        LD      (HL),A
        INC     E
        INC     L
        DJNZ    L3E30
        RET

        ; --- START PROC L3E37 ---
L3E37:  LD      A,(7334h)
        AND     A
        RET     M
        LD      A,(7331h)
        LD      C,A
        AND     0Fh
        RET     NZ
        LD      A,C
        RRCA
        RRCA
        RRCA
        RRCA
        LD      C,A
        LD      HL,0099h
        LD      DE,00F9h
        LD      A,(7332h)
        AND     A
        JR      Z,L3E56
        EX      DE,HL
L3E56:  PUSH    DE
        LD      A,(7334h)
        AND     C
        LD      A,(7332h)
        JR      Z,L3E62
        LD      A,02h
L3E62:  CALL    L3E75
        POP     HL
        LD      A,(7333h)
        AND     A
        JR      Z,L3E73
        LD      A,(7332h)
        XOR     01h
        JR      L3E75

        ; --- START PROC L3E73 ---
L3E73:  LD      A,02h
        ; --- START PROC L3E75 ---
L3E75:  ADD     A,A
        ADD     A,A
        LD      DE,3E88h
        ADD     A,E
        LD      E,A
        JR      NC,L3E7F
        INC     D
L3E7F:  LD      A,(DE)
        INC     DE
        AND     A
        RET     Z
        CALL    L3DFB
        JR      L3E7F

L3E88:  DB      31h             ; '1'
        DB      55h             ; 'U'
        DB      50h             ; 'P'
        DB      00h
        DB      32h             ; '2'
        DB      55h             ; 'U'
        DB      50h             ; 'P'
        DB      00h
        DB      20h             ; ' '
        DB      20h             ; ' '
        DB      20h             ; ' '
        DB      00h
        DB      01h
        DB      00h
        DB      05h
        DB      21h             ; '!'
        DB      93h
        DB      73h             ; 's'
        DB      71h             ; 'q'
        DB      2Ch             ; ','
        DB      10h
        DB      0FCh
        DB      36h             ; '6'
        DB      01h
        DB      18h
        DB      2Ah             ; '*'
        DB      21h             ; '!'
        DB      93h
        DB      73h             ; 's'
        DB      7Eh             ; '~'
        DB      3Ch             ; '<'
        DB      0FEh
        DB      08h
        DB      38h             ; '8'
        DB      02h
        DB      3Eh             ; '>'
        DB      05h
        DB      77h             ; 'w'
        DB      2Ch             ; ','
        DB      7Eh             ; '~'
        DB      3Ch             ; '<'
        DB      0E6h
        DB      07h
        DB      "w,4,~<"
        DB      0FEh
        DB      10h
        DB      30h             ; '0'
        DB      01h
        DB      77h             ; 'w'
        DB      2Ch             ; ','
        DB      7Eh             ; '~'
        DB      3Ch             ; '<'
        DB      0FEh
        DB      09h
        DB      30h             ; '0'
        DB      01h
        DB      77h             ; 'w'
        DB      2Ch             ; ','
        DB      7Eh             ; '~'
        DB      0C6h
        DB      01h
        DB      27h             ; '''
        DB      77h             ; 'w'
        DB      0CDh
        DB      1Dh
        DB      3Fh             ; '?'
        DB      3Ah             ; ':'
        DB      95h
        DB      73h             ; 's'
        DB      0E6h
        DB      18h
        DB      0Fh
        DB      0Fh
        DB      0Fh
        DB      21h             ; '!'
        DB      19h
        DB      3Fh             ; '?'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      "$~2*s2+s2-s2.s2/s"

        ; --- START PROC L3EEF ---
L3EEF:  LD      HL,7310h
        LD      DE,7F80h
        LD      BC,0020h
        ; --- START PROC L3EF8 ---
L3EF8:  LD      A,E
        OUT     (11h),A
        LD      A,D
        OUT     (11h),A
L3EFE:  DEC     BC
        LD      A,C
        OR      B
        LD      A,(HL)
        INC     HL
        OUT     (10h),A
        JR      NZ,L3EFE
        RET

L3F08:  DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      07h
        DB      0C0h
        DB      3Ah             ; ':'
        DB      31h             ; '1'
        DB      73h             ; 's'
        DB      0E6h
        DB      08h
        DB      20h             ; ' '
        DB      0BAh
        DB      3Eh             ; '>'
        DB      0F0h
        DB      18h
        DB      0C7h
        DB      50h             ; 'P'
        DB      30h             ; '0'
        DB      0E0h
        DB      0B0h
        DB      21h             ; '!'
        DB      93h
        DB      73h             ; 's'
        DB      7Eh             ; '~'
        DB      87h
        DB      87h
        DB      87h
        DB      86h
        DB      21h             ; '!'
        DB      4Eh             ; 'N'
        DB      3Fh             ; '?'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      11h
        DB      41h             ; 'A'
        DB      73h             ; 's'
        DB      01h
        DB      09h
        DB      00h
        DB      0EDh
        DB      0B0h
        DB      21h             ; '!'
        DB      41h             ; 'A'
        DB      73h             ; 's'
        DB      7Eh             ; '~'
        DB      87h
        DB      86h
        DB      87h
        DB      87h
        DB      21h             ; '!'
        DB      96h
        DB      3Fh             ; '?'
        DB      85h
        DB      6Fh             ; 'o'
        DB      30h             ; '0'
        DB      01h
        DB      24h             ; '$'
        DB      11h
        DB      50h             ; 'P'
        DB      73h             ; 's'
        DB      01h
        DB      0Ch
        DB      00h
        DB      0EDh
        DB      0B0h
        DB      0C9h
        DB      00h
        DB      00h
        DB      01h
        DB      09h
        DB      05h
        DB      0E0h
        DB      01h
        DB      68h             ; 'h'
        DB      01h
        DB      00h
        DB      01h
        DB      02h
        DB      0Bh
        DB      05h
        DB      90h
        DB      01h
        DB      68h             ; 'h'
        DB      01h
        DB      01h
        DB      00h
        DB      02h
        DB      0Bh
        DB      05h
        DB      68h             ; 'h'
        DB      01h
        DB      2Ch             ; ','
        DB      01h
        DB      01h
        DB      01h
        DB      03h
        DB      0Dh
        DB      07h
        DB      2Ch             ; ','
        DB      01h
        DB      0F0h
        DB      00h
        DB      02h
        DB      02h
        DB      03h
        DB      0Bh
        DB      05h
        DB      0F0h
        DB      00h
        DB      0B4h
        DB      00h
        DB      01h
        DB      02h
        DB      04h
        DB      11h
        DB      09h
        DB      0F0h
        DB      00h
        DB      78h             ; 'x'
        DB      00h
        DB      02h
        DB      03h
        DB      03h
        DB      0Dh
        DB      07h
        DB      78h             ; 'x'
        DB      00h
        DB      01h
        DB      00h
        DB      03h
        DB      03h
        DB      04h
        DB      11h
        DB      09h
        DB      3Ch             ; '<'
        DB      00h
        DB      3Ch             ; '<'
        DB      00h
        DB      0F0h
        DB      00h
        DB      0E0h
        DB      00h
        DB      0F0h
        DB      00h
        DB      00h
        DB      01h
        DB      80h
        DB      00h
        DB      80h
        DB      00h
        DB      0F0h
        DB      00h
        DB      0F0h
        DB      00h
        DB      00h
        DB      01h
        DB      10h
        DB      01h
        DB      90h
        DB      00h
        DB      90h
        DB      00h
        DB      00h
        DB      01h
        DB      00h
        DB      01h
        DB      10h
        DB      01h
        DB      20h             ; ' '
        DB      01h
        DB      0A0h
        DB      00h
        DB      0A0h
        DB      00h
        DB      10h
        DB      01h
        DB      00h
        DB      01h
        DB      20h             ; ' '
        DB      01h
        DB      40h             ; '@'
        DB      01h
        DB      0B0h
        DB      00h
        DB      0B0h
        DB      00h
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
        DB      0FFh
