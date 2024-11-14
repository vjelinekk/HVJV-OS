#include <stdlib.h>

char* itoa(long value, char* buffer, int base, int is_unsigned) {
    if (base < 2 || base > 36) {
        *buffer = '\0'; // Invalid base; return empty string
        return buffer;
    }

    char* ptr = buffer;
    int isNegative = 0;

    if (value == 0) {
        *ptr++ = '0';
        *ptr = '\0';
        return buffer;
    }

    // Handle negative numbers only for base 10 and signed values
    if (!is_unsigned && value < 0 && base == 10) {
        isNegative = 1;
        value = -value; // Make value positive
    }

    unsigned long abs_value = is_unsigned ? (unsigned long)value : (unsigned long)value;

    // Convert the number to the specified base
    while (abs_value != 0) {
        int remainder = abs_value % base;
        *ptr++ = (remainder > 9) ? (remainder - 10) + 'a' : remainder + '0';
        abs_value /= base;
    }

    if (isNegative) {
        *ptr++ = '-';
    }

    *ptr = '\0'; // Null-terminate the string

    // Reverse the string
    char* start = buffer;
    char* end = ptr - 1;
    while (start < end) {
        char temp = *start;
        *start++ = *end;
        *end-- = temp;
    }

    return buffer;
}
