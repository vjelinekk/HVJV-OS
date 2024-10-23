#include <stdlib.h>

char* itoa(int value, char* buffer, int base) {
    // Check for invalid base
    if (base < 2 || base > 36) {
        *buffer = '\0'; // Invalid base; return empty string
        return buffer;
    }

    char* ptr = buffer;
    int isNegative = 0;

    // Handle 0 explicitly, since it's a special case
    if (value == 0) {
        *ptr++ = '0';
        *ptr = '\0'; // Null-terminate the string
        return buffer;
    }

    // Handle negative numbers only for base 10
    if (value < 0 && base == 10) {
        isNegative = 1;
        value = -value; // Make value positive
    }

    // Convert the number to the specified base
    while (value != 0) {
        int remainder = value % base;
        *ptr++ = (remainder > 9) ? (remainder - 10) + 'a' : remainder + '0'; // Convert to char
        value /= base;
    }

    // If the number was negative, add the '-' sign
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
