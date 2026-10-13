INCLUDE Irvine32.inc

.data
msgTotal BYTE "Total score: ",0
msgDiff  BYTE "Highest - Lowest: ",0

.code
CalculateResult PROC
    pop edx
    pop esi
    pop edi
    pop ecx

    mov eax, esi
    add eax, edi
    add eax, ecx

    mov ebx, esi

    cmp edi, ebx
    jbe skipMax1
    mov ebx, edi
skipMax1:
    cmp edi, esi
    jae skipMin1
    mov esi, edi
skipMin1:
    cmp ecx, ebx
    jbe skipMax2
    mov ebx, ecx
skipMax2:
    cmp ecx, esi
    jae skipMin2
    mov esi, ecx
skipMin2:
    sub ebx, esi

    push edx
    ret
CalculateResult ENDP

main PROC
    push 78
    push 85
    push 92

    call CalculateResult

    mov edx, OFFSET msgTotal
    call WriteString
    call WriteDec
    call Crlf

    mov eax, ebx
    mov edx, OFFSET msgDiff
    call WriteString
    call WriteDec
    call Crlf

    exit
main ENDP
END main
