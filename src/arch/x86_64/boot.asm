
; make public label
global start

section .text
bits 32

start:
  mov ebx, 0xB8000
  mov esp, ebx
  mov byte [esp], 'H'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 'e'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 'l'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 'l'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 'o'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], ' '
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 'U'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 's'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 'e'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], 'r'
  add esp, 1
  mov byte [esp], 1Fh

  ; clear remaining area
clear: 
  add esp, 1
  mov byte [esp], 0
  add esp, 1
  mov byte [esp], 0
  mov eax, esp
  cmp eax, 0xB8EFA
  jl clear

  ; smiley to signal end of buffer
  add esp, 1
  mov byte [esp], ':'
  add esp, 1
  mov byte [esp], 1Fh
  add esp, 1
  mov byte [esp], ')'
  add esp, 1
  mov byte [esp], 1Fh

  hlt
  