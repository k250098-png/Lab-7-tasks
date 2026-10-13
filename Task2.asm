INCLUDE Irvine32.inc

.data
price1 DWORD 1200
price2 DWORD 850
price3 DWORD 650
discount DWORD 300
savedEsp DWORD ?
msgSub BYTE "Subtotal: ",0
msgFinal BYTE "Final bill: ",0
msgOk BYTE "Stack is balanced",0
msgBad BYTE "Stack is NOT balanced",0

.code
CalculateSubtotal PROC
    mov eax, price1
    add eax, price2
    add eax, price3
    ret
CalculateSubtotal ENDP

CalculateFinalBill PROC
    pop edx
    pop ecx
    pop eax
    sub eax, ecx
    push edx
    ret
CalculateFinalBill ENDP

main PROC
    mov savedEsp, esp

    push ecx
    push edx

    call CalculateSubtotal

    mov edx, OFFSET msgSub
    call WriteString
    call WriteDec
    call Crlf

    pushfd
    push eax
    push discount
    call CalculateFinalBill
    popfd

    mov edx, OFFSET msgFinal
    call WriteString
    call WriteDec
    call Crlf

    pop edx
    pop ecx

    cmp esp, savedEsp
    jne notBalanced
    mov edx, OFFSET msgOk
    jmp showResult
notBalanced:
    mov edx, OFFSET msgBad
showResult:
    call WriteString
    call Crlf

    exit
main ENDP
END main
