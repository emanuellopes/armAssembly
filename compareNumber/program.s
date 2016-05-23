.global main
.func main

main:
    PUSH {LR}

    LDR R0, =pedeNumeroJogador1         
    BL printf

    LDR R0, =inputformat //scanf jogador 1
    LDR R1, =num
    bl scanf
    
    BAL _pedeNumero


_pedeNumero:
    LDR R0, =tentativasStr
    LDR R1, =tentativas
    LDR R1, [R1]
    BL printf

    LDR R0, =pedeNumero         @ seed printf
    BL printf

    LDR R0, =inputformat //scanf jogador 2
    LDR R1, =num2
    bl scanf

    //mostra o numero para testes drive
    LDR R0, =mostraStrng         
    LDR R1, =num
    LDR R1, [R1]
    LDR R2, =num2
    LDR R2, [R2]
    BL printf


    //contador tentativas
    LDR R1, =tentativas
    LDR R1, [R1]
    SUBS R1, #0x1
    LDR R2, =tentativas
    STR R1, [R2]

    //verifica se o numero de tentativas é 0
    CMP R1, #0x0
    BEQ _perdeu

    //compara o numero inserido com o numero que já lá está
    LDR R1, =num
    LDR R1, [R1]
    LDR R2, =num2
    LDR R2, [R2]


    CMP R1, R2 //compara os numeros
    BEQ _ganhou //se os numeros forem iguais termina o programa
    BLT _menor //se for menor chama a subrotina menor
    LDR R0, =numeroMaior //caso contrario continua porque o numero e maior
    BL printf

    BL _pedeNumero


_ganhou:
    LDR R0, =adivinhouNumero
    BL printf
    BL _exit

_menor:
    LDR R0, =numeroMenor
    BL printf
    B _pedeNumero

_perdeu:
    LDR R0, =jafoste
    BL printf
    BL _exit

_exit:
    POP {PC}
    MOV PC, LR

.data
    pedeNumeroJogador1:
        .asciz "Jogador 1 - Insira o numero\n"

    pedeNumero:
        .asciz "Adivinhe o numero?:\n"

    inputformat: 
        .asciz "%d"

    mostraStrng:
        .asciz "%d teste %d\n"

    numeroMenor:
        .asciz "Numero menor\n"

    numeroMaior:
        .asciz "numero Maior\n"

    adivinhouNumero:
        .asciz "Acertou no numero\n"

    jafoste:
        .asciz "0 tentativas\n"

    tentativasStr:
        .asciz "%d tentativas\n"
    num: 
        .word 1
    num2:
        .word 0

    tentativas:
        .word 5
