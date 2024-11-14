#ifndef _STDLIB_H
#define _STDLIB_H 1

#include <sys/cdefs.h>

#ifdef __cplusplus
extern "C" {
#endif

__attribute__((__noreturn__))
void abort(void);

char* itoa(long value, char* buffer, int base, int is_unsigned);

#ifdef __cplusplus
}
#endif

#endif
