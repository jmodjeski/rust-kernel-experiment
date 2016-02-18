
; https://en.wikipedia.org/wiki/Multiboot_Specification

section .multiboot_header
header_start:
  ; dd = define double
  dd 0xe85250d6                 ; magic number (multiboot2)
  dd 0                          ; protected mode x86 architecture
  dd header_end - header_start  ; header length
  ; checksum
  ; HACK 0x100000000 avoids compiler warning
  dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

  ; optional multiboot tags


  ; end tag (required)
  ; dw = define word
  dw 0    ; type
  dw 0    ; flags
  dw 8    ; size
header_end:
