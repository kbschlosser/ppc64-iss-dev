ENTRY(_start)
SECTIONS
{
    . = 0x00000000000000FC;
    .text : { *(.text) }
    . = 0x0000000000000700;
    .data : { *(.data) }
}