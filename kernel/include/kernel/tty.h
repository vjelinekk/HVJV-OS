#ifndef _KERNEL_TTY_H
#define _KERNEL_TTY_H

#include <stddef.h>
#include <stdint.h>

/**
 * Initialize the terminal
 */
void terminal_initialize(void);

/**
 * Put a character on the terminal
 * 
 * @param c The character to put on the terminal
 */
void terminal_putchar(char c);

/**
 * Write data to the terminal
 * 
 * @param data The data to write
 * @param size The size of the data
 */
void terminal_write(const char* data, size_t size);

/**
 * Write a string to the terminal
 * 
 * @param data The string to write
 */
void terminal_writestring(const char* data);

/**
 * Clear the terminal
 */
void terminal_clear();

#endif
