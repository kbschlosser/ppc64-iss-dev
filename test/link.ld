ENTRY(_start)
SECTIONS
{
    . = 0x00000000000000FC;
    .text : { *(.text) }
}