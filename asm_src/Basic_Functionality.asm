#----------------------------------------------------------------------------------
#-- (c) Rajesh Panicker
#--	License terms :
#--	You are free to use this code as long as you
#--		(i) DO NOT post it on any public repository;
#--		(ii) use it only for educational purposes;
#--		(iii) accept the responsibility to ensure that your implementation does not violate anyone's intellectual property.
#--		(iv) accept that the program is provided "as is" without warranty of any kind or assurance regarding its suitability for any particular purpose;
#--		(v) send an email to rajesh<dot>panicker<at>ieee.org briefly mentioning its use (except when used for the course CG3207 at the National University of Singapore);
#--		(vi) retain this notice in this file and any files derived from this.
#----------------------------------------------------------------------------------

.eqv MMIO_BASE 0xFFFF0000
.eqv UART_RX_VALID_OFF 			0x00
.eqv UART_RX_OFF			0x04
.eqv UART_TX_READY_OFF			0x08
.eqv UART_TX_OFF			0x0C
.eqv OLED_COL_OFF			0x20
.eqv OLED_ROW_OFF			0x24
.eqv OLED_DATA_OFF			0x28
.eqv OLED_CTRL_OFF			0x2C
.eqv OLED_STATUS_OFF		0x30
.eqv ACCEL_DATA_OFF			0x40
.eqv ACCEL_DREADY_OFF			0x44
.eqv DIP_OFF				0x64
.eqv PB_OFF				0x68
.eqv LED_OFF				0x60
.eqv SEVENSEG_OFF			0x80
.eqv CYCLECOUNT_OFF			0xA0
.text
main:
    addi s7, zero, 0
    nop
    nop
    nop
    lui s0, 0xffff0
    nop
    nop
    nop
    addi a0, zero, 100
    nop
    nop
    nop
    addi a1, zero, 67
    nop
    nop
    nop
    addi a2, zero, -8
    nop
    nop
    nop
    addi a3, zero, 1024
    nop
    nop
    nop
    and a4, a0, a1
    nop
    nop
    nop
    andi a5, a2, 89
    nop
    nop
    nop
    or a6, a2, a3
    nop
    nop
    nop
    ori a7, a3, 4
    nop
    nop
    nop
    slt s8, a2, a3
    nop
    nop
    nop
    slt s9, a3, a0
    nop
    nop
    nop
    sltu s10, a3, a2
    nop
    nop
    nop
    sltu s11, a0, a1
    nop
    nop
    nop
    lui s1, 0x10010
    nop
    nop
    nop
    lw s2, 0(s1)
    nop
    nop
    nop
    sub s2, s2, s8
    nop
    nop
    nop
    sw s2, 0(s1)
    nop
    nop
    nop
    slti s3, s2, 1
    nop
    nop
    nop
    sltiu s4, s2, -8
    nop
    nop
    nop
    xor s5, s2, s4
    nop
    nop
    nop
    xori s6, s2, 7
    nop
    nop
    nop
    beq s3, s4, finish
    nop
    nop
    nop
    beq s2, s2, beq_skip
    nop
    nop
    nop
    addi s0, s0, 1
    nop
    nop
    nop
beq_skip:
    bne s2, s2, finish
    nop
    nop
    nop
    bne s3, s4, bne_skip
    nop
    nop
    nop
    addi s0, s0, 1
    nop
    nop
    nop
bne_skip:
    blt s3, a2, finish
    nop
    nop
    nop
    blt a2, s3, blt_skip
    nop
    nop
    nop
    addi s0, s0, 1
    nop
    nop
    nop
blt_skip:
    bge a2, s3, finish
    nop
    nop
    nop
    bge s4, s3, bge_skip
    nop
    nop
    nop
    addi s0, s0, 1
    nop
    nop
    nop
bge_skip:
    bltu a2, s3, finish
    nop
    nop
    nop
    bltu s3, a2, bltu_skip
    nop
    nop
    nop
    addi s0, s0, 1
    nop
    nop
    nop
bltu_skip:
    bgeu s3, a2, finish
    nop
    nop
    nop
    bgeu a2, s3, bgeu_skip
    nop
    nop
    nop
    addi s0, s0, 1
    nop
    nop
    nop
bgeu_skip:
    addi t0, zero, 1
    nop
    nop
    nop
    addi t1, zero, 4
    nop
    nop
    nop
    sll t2, t0, t1
    nop
    nop
    nop
    addi t3, zero, 16
    nop
    nop
    nop
    bne t2, t3, finish
    nop
    nop
    nop
    srl t2, t2, t1
    nop
    nop
    nop
    bne t2, t0, finish
    nop
    nop
    nop
    addi t2, zero, -8
    nop
    nop
    nop
    sra t2, t2, t1
    nop
    nop
    nop
    addi t3, zero, -1
    nop
    nop
    nop
    bne t2, t3, finish
    nop
    nop
    nop
    slli t2, t0, 3
    nop
    nop
    nop
    addi t3, zero, 8
    nop
    nop
    nop
    bne t2, t3, finish
    nop
    nop
    nop
    srli t2, t2, 2
    nop
    nop
    nop
    addi t3, zero, 2
    nop
    nop
    nop
    bne t2, t3, finish
    nop
    nop
    nop
    addi t2, zero, -8
    nop
    nop
    nop
    srai t2, t2, 2
    nop
    nop
    nop
    addi t3, zero, -2
    nop
    nop
    nop
    bne t2, t3, finish
    nop
    nop
    nop
    auipc t4, 0
    nop
    nop
    nop
    auipc t5, 0
    nop
    nop
    nop
    sub t6, t5, t4
    nop
    nop
    nop
    addi t3, zero, 16
    nop
    nop
    nop
    bne t6, t3, finish
    nop
    nop
    nop
    addi t4, zero, 85
    nop
    nop
    nop
    jal x0, jal_call_start
    nop
    nop
    nop
    addi t4, zero, 0
    nop
    nop
    nop
jal_link_target:
    auipc t3, 0
    nop
    nop
    nop
    jalr t2, 0(t1)
    nop
    nop
    nop
jal_call_start:
    addi t5, zero, 85
    nop
    nop
    nop
    bne t4, t5, finish
    nop
    nop
    nop
    auipc t0, 0
    nop
    nop
    nop
    jal t1, jal_link_target
    nop
    nop
    nop
jal_return:
    addi t0, t0, 20
    nop
    nop
    nop
    bne t1, t0, finish
    nop
    nop
    nop
    addi t3, t3, 20
    nop
    nop
    nop
    bne t2, t3, finish
    nop
    nop
    nop
    addi s1, s0, LED_OFF
    nop
    nop
    nop
    addi s2, s0, DIP_OFF
    nop
    nop
    nop
    lw s4, (s2)
    nop
    nop
    nop
    sw s4, (s1)
    nop
    nop
    nop
    mul a0, t1, s1
    nop
    nop
    nop
    mulh t0, t1, s1
    nop
    nop
    nop
    mulhu t2, t1, s1
    nop
    nop
    nop
    div s3, a0, t0
    nop
    nop
    nop
    divu s10, t3, t4
    nop
    nop
    nop
    rem s4, a0, t0
    nop
    nop
    nop
    remu s11, t3, t4
    nop
    nop
    nop
    addi s7, zero, 1
    nop
    nop
    nop
finish:
    jal zero, finish
    nop
    nop
    nop
.data
DMEM:
delay_val: .word 3
string1:
.asciz "\r\nWelcome to CG3207..\r\n"
var1: .word	1
.align 9
STACK_INIT:
