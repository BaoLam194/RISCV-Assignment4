.eqv MMIO_BASE 0xFFFF0000
.eqv LED_OFF 0x60
.eqv DIP_OFF 0x64
.eqv SEVENSEG_OFF 0x80

.text
.globl main
main:
    lui s0, 0xffff0
    nop
    nop
    nop
    sw zero, LED_OFF(s0)
    nop
    nop
    nop
    sw zero, SEVENSEG_OFF(s0)
    nop
    nop
    nop
    lui s5, 0x10010
    nop
    nop
    nop
    sw zero, 384(s5)
    nop
    nop
    nop
    sw zero, 388(s5)
    nop
    nop
    nop
    addi s1, s5, 0
    nop
    nop
    nop
    addi s2, zero, 16
    nop
    nop
    nop
    addi s3, zero, 1
    nop
    nop
    nop
run_case:
    lw t0, 0(s1)
    nop
    nop
    nop
    lw t1, 4(s1)
    nop
    nop
    nop
    lw t2, 8(s1)
    nop
    nop
    nop
    addi t3, zero, 1
    nop
    nop
    nop
    beq t0, t3, do_mul
    nop
    nop
    nop
    addi t3, zero, 2
    nop
    nop
    nop
    beq t0, t3, do_div
    nop
    nop
    nop
    divu t4, t1, t2
    nop
    nop
    nop
    jal zero, check_result
    nop
    nop
    nop
do_mul:
    mul t4, t1, t2
    nop
    nop
    nop
    jal zero, check_result
    nop
    nop
    nop
do_div:
    div t4, t1, t2
    nop
    nop
    nop
check_result:
    sw t4, 16(s1)
    nop
    nop
    nop
    lw t5, 12(s1)
    nop
    nop
    nop
    xor t6, t4, t5
    nop
    nop
    nop
    sltiu t6, t6, 1
    nop
    nop
    nop
    sw t6, 20(s1)
    nop
    nop
    nop
    and s3, s3, t6
    nop
    nop
    nop
    addi s1, s1, 24
    nop
    nop
    nop
    addi s2, s2, -1
    nop
    nop
    nop
    bne s2, zero, run_case
    nop
    nop
    nop
    sw s3, 384(s5)
    nop
    nop
    nop
    addi t0, zero, 1
    nop
    nop
    nop
    sw t0, 388(s5)
    nop
    nop
    nop
display:
    lw s4, DIP_OFF(s0)
    nop
    nop
    nop
    andi t0, s4, 15
    nop
    nop
    nop
    slli t1, t0, 4
    nop
    nop
    nop
    slli t2, t0, 3
    nop
    nop
    nop
    add t1, t1, t2
    nop
    nop
    nop
    add s1, s5, t1
    nop
    nop
    nop
    srli t2, s4, 4
    nop
    nop
    nop
    andi t2, t2, 3
    nop
    nop
    nop
    slli t2, t2, 2
    nop
    nop
    nop
    bne t2, zero, load_view
    nop
    nop
    nop
    addi t2, zero, 16
    nop
    nop
    nop
load_view:
    add t2, s1, t2
    nop
    nop
    nop
    lw t3, 0(t2)
    nop
    nop
    nop
    sw t3, SEVENSEG_OFF(s0)
    nop
    nop
    nop
    lw t1, 0(s1)
    nop
    nop
    nop
    slli t1, t1, 4
    nop
    nop
    nop
    or t1, t1, t0
    nop
    nop
    nop
    lw t2, 20(s1)
    nop
    nop
    nop
    slli t2, t2, 6
    nop
    nop
    nop
    or t1, t1, t2
    nop
    nop
    nop
    slli t2, s3, 7
    nop
    nop
    nop
    or t1, t1, t2
    nop
    nop
    nop
    sw t1, LED_OFF(s0)
    nop
    nop
    nop
    jal zero, display
    nop
    nop
    nop

.data
.align 2
cases:
    .word 1, 7, 3, 21, 0, 0
    .word 1, -7, 3, -21, 0, 0
    .word 1, -7, -3, 21, 0, 0
    .word 1, 0, 123, 0, 0, 0
    .word 1, 0x80000000, -1, 0x80000000, 0, 0
    .word 1, 546540564, 456546541, 0x88F78E84, 0, 0
    .word 2, 7, 3, 2, 0, 0
    .word 2, -7, 3, -2, 0, 0
    .word 2, 7, -3, -2, 0, 0
    .word 2, -7, -3, 2, 0, 0
    .word 2, 0, 3, 0, 0, 0
    .word 2, 0x80000000, -1, 0x80000000, 0, 0
    .word 3, 7, 3, 2, 0, 0
    .word 3, 0xFFFFFFFF, 3, 0x55555555, 0, 0
    .word 3, 0x80000000, 2, 0x40000000, 0, 0
    .word 3, 5, 7, 0, 0, 0
suite_pass:
    .word 0
suite_done:
    .word 0
