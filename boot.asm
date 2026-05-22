bits 16

; Endereço onde o BIOS carrega o bootloade
org 0x7C00

start:

    ; Configura segmentos
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; Mensagem
    mov si, mensagem

.loop:

    lodsb          ; Carrega próximo caractere de SI para AL

    cmp al, 0       ; Verifica o fim da string
    je fim

    mov ah, 0x0E    ; Função teletype da BIOS
    int 0x10        ; Interrupção de vídeo

    jmp .loop

fim:
    jmp $

mensagem db 'Bem-vindo ao MeuOs', 0

; Preenche até 510 bytes
times 510 - ($ - $$) db 0

; Assinatura bootável
dw 0xAA55