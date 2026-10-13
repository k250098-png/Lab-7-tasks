INCLUDE Irvine32.inc

.data
msgResult BYTE "Final result: ",0

.code
GetValues PROC
    mov eax, 15
    mov ebx, 25
    ret
GetValues ENDP

CalculateSum PROC
    call GetValues
    add eax, ebx
    ret
CalculateSum ENDP

CalculateResult PROC
    call CalculateSum
    add eax, eax
    ret
CalculateResult ENDP

main PROC
    call CalculateResult

    mov edx, OFFSET msgResult
    call WriteString
    call WriteDec
    call Crlf

    exit
main ENDP
END main
