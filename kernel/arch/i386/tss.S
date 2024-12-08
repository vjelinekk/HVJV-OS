.code32
.section .text
.global tss_flush

.type tss_flush, @function
tss_flush:
    movw $0x28, %ax
    orw $0x0, %ax
    ltr %ax
    ret
