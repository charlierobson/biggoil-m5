


function addentry {
    eps+='--entry:0x'
    eps+=$1
    eps+=' '
}


eps=''
addentry 2081
addentry 2007
addentry 209c
addentry 20c1
addentry 23e3
addentry 2B6B
addentry 2B75
addentry 2B88
addentry 2B9B
addentry 2BAE
addentry 2BC1
addentry 2BCD
addentry 2BE0

yazd --addr:0x2000 $eps ../m5multi/cart-binaries/ola/PowerPac\ \(PAL\).rom > pp.asm
