#include <stdio.h>

int main()
{
    const char *pTest = "Hello, World!";
    const char *pTemp = pTest;
    int length;

    __asm__ volatile(
        "xor %%ecx, %%ecx\n\t" // length = 0
        "1:\n\t"
        "cmpb $0, (%1,%%rcx,1)\n\t" // check pTemp[rcx]
        "je 2f\n\t"
        "inc %%ecx\n\t"
        "jmp 1b\n\t"
        "2:\n\t"
        : "=c"(length)
        : "r"(pTemp)
        : "memory");

    printf("The length of the string is %d\n", length);
    return 0;
}