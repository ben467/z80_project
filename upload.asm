;Initialization program
;Reads data from an Arduino and stores it in memory location $8000 
start:
	;usart start
    ld a, $40
    out ($03),a
    nop
    nop
    
    ld a, $40
    out ($03),a
    nop
    nop
    
    ld a, $40
    out ($03),a
    nop
    nop
    
    ld a, $4d
    out ($03),a
    nop
    nop
    
    ld a, $37
    out ($03),a
    nop
    nop
    
    ;lcd init
    
	ld a,$38
    out ($00),a
    ld a,$0e
    out ($00),a
    ld a,$01
    out ($00),a
    ld a,$80
    out ($00),a
    
main:
	ld a, 'Z'
    out ($01),a
    ld a, '>'
    out ($01),a
    ld b, 'h'
    
loop:
	in a,($02)
    bit 7,a
    jp z, loop
test:
    cp b
    jp nz,loop
    out ($01),a
    jp main
