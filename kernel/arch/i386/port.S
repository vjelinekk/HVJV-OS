.code32
.section .text
.global outb
.global inb
.global io_wait

.type outb, @function
# void outb(uint16_t port, uint8_t val)
outb:
    movw 4(%esp), %dx
    movb 8(%esp), %al
    outb %al, %dx
    ret

.size outb, . - outb

.type inb, @function
# uint8_t inb(uint16_t port)
inb:
    xorl %eax, %eax
    movzwl 4(%esp), %edx
    inb %dx, %al
    ret

.size inb, . - inb

.type io_wait, @function
# void io_wait()
io_wait:
    movb $0x00, %al
    outb %al, $0x80
    ret

.size io_wait, . - io_wait
