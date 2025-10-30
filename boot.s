# boot.S -- multiboot header + jump to kernel_main
.section .multiboot
.align 4
.long 0x1BADB002          # magic
.long 0x0                 # flags
.long -(0x1BADB002 + 0x0) # checksum

.text
.global start
start:
    cli
    mov $stack_top, %esp
    call kernel_main
.halt:
    hlt
    jmp .halt

.section .bss
.align 16
stack:
    .space 16384
stack_top:
