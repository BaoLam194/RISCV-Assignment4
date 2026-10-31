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
    lui s0, 0xffff0
    addi a0, zero, 100
    addi a1, zero, 67
    addi a2, zero, -8
    addi a3, zero, 1024
    and a4, a0, a1
    andi a5, a2, 89
    or a6, a2, a3
    ori a7, a3, 4
    slt s8, a2, a3
    slt s9, a3, a0
    sltu s10, a3, a2
    sltu s11, a0, a1
    lui s1, 0x10010
    lw s2, 0(s1)
    sub s2, s2, s8
    sw s2, 0(s1)
    slti s3, s2, 1
    sltiu s4, s2, -8
    xor s5, s2, s4
    xori s6, s2, 7
    beq s3, s4, finish
    beq s2, s2, beq_skip
    addi s0, s0, 1
beq_skip:
    bne s2, s2, finish
    bne s3, s4, bne_skip
    addi s0, s0, 1
bne_skip:
    blt s3, a2, finish
    blt a2, s3, blt_skip
    addi s0, s0, 1
blt_skip:
    bge a2, s3, finish
    bge s4, s3, bge_skip
    addi s0, s0, 1
bge_skip:
    bltu a2, s3, finish
    bltu s3, a2, bltu_skip
    addi s0, s0, 1
bltu_skip:
    bgeu s3, a2, finish
    bgeu a2, s3, bgeu_skip
    addi s0, s0, 1
bgeu_skip:
    addi t0, zero, 1
    addi t1, zero, 4
    sll t2, t0, t1
    addi t3, zero, 16
    bne t2, t3, finish
    srl t2, t2, t1
    bne t2, t0, finish
    addi t2, zero, -8
    sra t2, t2, t1
    addi t3, zero, -1
    bne t2, t3, finish
    slli t2, t0, 3
    addi t3, zero, 8
    bne t2, t3, finish
    srli t2, t2, 2
    addi t3, zero, 2
    bne t2, t3, finish
    addi t2, zero, -8
    srai t2, t2, 2
    addi t3, zero, -2
    bne t2, t3, finish
    auipc t4, 0
    auipc t5, 0
    sub t6, t5, t4
    addi t3, zero, 4
    bne t6, t3, finish
    addi t4, zero, 85
    jal x0, jal_call_start
    addi t4, zero, 0
jal_link_target:
    auipc t3, 0
    jalr t2, 0(t1)
jal_call_start:
    addi t5, zero, 85
    bne t4, t5, finish
    auipc t0, 0
    jal t1, jal_link_target
jal_return:
    addi t0, t0, 8
    bne t1, t0, finish
    addi t3, t3, 8
    bne t2, t3, finish
    addi s1, s0, LED_OFF
    addi s2, s0, DIP_OFF
    lw s4, (s2)
    sw s4, (s1)
    mul a0, t1, s1
    mulh t0, t1, s1
    mulhu t2, t1, s1
    div s3, a0, t0
    divu s10, t3, t4
    rem s4, a0, t0
    remu s11, t3, t4
    addi s7, zero, 1
finish:
    jal zero, finish
.data
DMEM:
delay_val: .word 3
string1:
.asciz "\r\nWelcome to CG3207..\r\n"
var1: .word	1
.align 9
STACK_INIT:
