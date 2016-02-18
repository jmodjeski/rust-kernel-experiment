
ENTRY(start) /* jump to the start: label */

SECTIONS {
  . = 1M;

  .boot :
  {
    /* multiboot header needs to be first */
    *(.multiboot_header)
  }

  .text :
  {
    *(.text)
  }
}
