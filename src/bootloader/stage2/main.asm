org 0x0
bits 16

%define ENDL 0x0D, 0x0A

start:
    ;print message
    mov si, msg_hello
    call puts

.halt:
    cli
    hlt



;
;prints a string
;PARAMS:
;   -ds:si points to string
;
puts:
    push si
    push ax


.loop:
    lodsb           ;loads next char in al
    or al, al       ;verify if next char is null?
    jz .done

    mov ah, 0x0e    ;call BIOS interrupt
    mov bh, 0
    int 0x10 
    jmp .loop

.done:
    pop ax
    pop si
    ret


msg_hello: db 'Hello, world from KERNEL!!!', ENDL, 0