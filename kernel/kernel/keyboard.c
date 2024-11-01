#include <kernel/idt.h>
#include <kernel/interrupt_helpers.h>
#include <kernel/keyboard.h>
#include <kernel/port.h>
#include <kernel/isr.h>
#include <kernel/pic.h>
#include <stdint.h>
#include <stdio.h>

// Scancode -> ASCII
const uint8_t lower_ascii_codes[256] = {
    0x00,  ESC,  '1',  '2',     /* 0x00 */
     '3',  '4',  '5',  '6',     /* 0x04 */
     '7',  '8',  '9',  '0',     /* 0x08 */
     '-',  '=',   BS, '\t',     /* 0x0C */
     'q',  'w',  'e',  'r',     /* 0x10 */
     't',  'y',  'u',  'i',     /* 0x14 */
     'o',  'p',  '[',  ']',     /* 0x18 */
    '\n', 0x00,  'a',  's',     /* 0x1C */
     'd',  'f',  'g',  'h',     /* 0x20 */
     'j',  'k',  'l',  ';',     /* 0x24 */
    '\'',  '`', 0x00, '\\',     /* 0x28 */
     'z',  'x',  'c',  'v',     /* 0x2C */
     'b',  'n',  'm',  ',',     /* 0x30 */
     '.',  '/', 0x00,  '*',     /* 0x34 */
    0x00,  ' ', 0x00, 0x00,     /* 0x38 */
    0x00, 0x00, 0x00, 0x00,     /* 0x3C */
    0x00, 0x00, 0x00, 0x00,     /* 0x40 */
    0x00, 0x00, 0x00,  '7',     /* 0x44 */
     '8',  '9',  '-',  '4',     /* 0x48 */
     '5',  '6',  '+',  '1',     /* 0x4C */
     '2',  '3',  '0',  '.',     /* 0x50 */
    0x00, 0x00, 0x00, 0x00,     /* 0x54 */
    0x00, 0x00, 0x00, 0x00      /* 0x58 */
};

// Scancode -> ASCII
const uint8_t upper_ascii_codes[256] = {
    0x00,  ESC,  '!',  '@',     /* 0x00 */
     '#',  '$',  '%',  '^',     /* 0x04 */
     '&',  '*',  '(',  ')',     /* 0x08 */
     '_',  '+',   BS, '\t',     /* 0x0C */
     'Q',  'W',  'E',  'R',     /* 0x10 */
     'T',  'Y',  'U',  'I',     /* 0x14 */
     'O',  'P',  '{',  '}',     /* 0x18 */
    '\n', 0x00,  'A',  'S',     /* 0x1C */
     'D',  'F',  'G',  'H',     /* 0x20 */
     'J',  'K',  'L',  ':',     /* 0x24 */
     '"',  '~', 0x00,  '|',     /* 0x28 */
     'Z',  'X',  'C',  'V',     /* 0x2C */
     'B',  'N',  'M',  '<',     /* 0x30 */
     '>',  '?', 0x00,  '*',     /* 0x34 */
    0x00,  ' ', 0x00, 0x00,     /* 0x38 */
    0x00, 0x00, 0x00, 0x00,     /* 0x3C */
    0x00, 0x00, 0x00, 0x00,     /* 0x40 */
    0x00, 0x00, 0x00,  '7',     /* 0x44 */
     '8',  '9',  '-',  '4',     /* 0x48 */
     '5',  '6',  '+',  '1',     /* 0x4C */
     '2',  '3',  '0',  '.',     /* 0x50 */
    0x00, 0x00, 0x00, 0x00,     /* 0x54 */
    0x00, 0x00, 0x00, 0x00      /* 0x58 */
};


const uint8_t lower_ascii_codes_dvorak[256] = {
    0x00,  ESC,  '1',  '2',     /* 0x00 */
     '3',  '4',  '5',  '6',     /* 0x04 */
     '7',  '8',  '9',  '0',     /* 0x08 */
     '[',  ']',   BS, '\t',     /* 0x0C */
    '\'',  ',',  '.',  'p',     /* 0x10 */
     'y',  'f',  'g',  'c',     /* 0x14 */
     'r',  'l',  '/',  '=',     /* 0x18 */
    '\n', 0x00,  'a',  'o',     /* 0x1C */
     'e',  'u',  'i',  'd',     /* 0x20 */
     'h',  't',  'n',  's',     /* 0x24 */
     '-',  '`', 0x00, '\\',     /* 0x28 */
     ';',  'q',  'j',  'k',     /* 0x2C */
     'x',  'b',  'm',  'w',     /* 0x30 */
     'v',  'z', 0x00,  '*',     /* 0x34 */
    0x00,  ' ', 0x00, 0x00,     /* 0x38 */
    0x00, 0x00, 0x00, 0x00,     /* 0x3C */
    0x00, 0x00, 0x00, 0x00,     /* 0x40 */
    0x00, 0x00, 0x00,  '7',     /* 0x44 */
     '8',  '9',  '[',  '4',     /* 0x48 */
     '5',  '6',  '}',  '1',     /* 0x4C */
     '2',  '3',  '0',  'v',     /* 0x50 */
    0x00, 0x00, 0x00, 0x00,     /* 0x54 */
    0x00, 0x00, 0x00, 0x00      /* 0x58 */
};

// Scancode -> ASCII
const uint8_t upper_ascii_codes_dvorak[256] = {
    0x00,  ESC,  '!',  '@',     /* 0x00 */
     '#',  '$',  '%',  '^',     /* 0x04 */
     '&',  '*',  '(',  ')',     /* 0x08 */
     '{',  '}',   BS, '\t',     /* 0x0C */
     '"',  '<',  '>',  'P',     /* 0x10 */
     'Y',  'F',  'G',  'C',     /* 0x14 */
     'R',  'L',  '?',  '+',     /* 0x18 */
    '\n', 0x00,  'A',  'O',     /* 0x1C */
     'E',  'U',  'I',  'D',     /* 0x20 */
     'H',  'T',  'N',  'S',     /* 0x24 */
     '_',  '~', 0x00,  '|',     /* 0x28 */
     ':',  'Q',  'J',  'K',     /* 0x2C */
     'X',  'B',  'M',  'W',     /* 0x30 */
     'V',  'Z', 0x00,  '*',     /* 0x34 */
    0x00,  ' ', 0x00, 0x00,     /* 0x38 */
    0x00, 0x00, 0x00, 0x00,     /* 0x3C */
    0x00, 0x00, 0x00, 0x00,     /* 0x40 */
    0x00, 0x00, 0x00,  '7',     /* 0x44 */
     '8',  '9',  '[',  '4',     /* 0x48 */
    '5',  '6',  '}',  '1',     /* 0x4C */
     '2',  '3',  '0',  'v',     /* 0x50 */
    0x00, 0x00, 0x00, 0x00,     /* 0x54 */
    0x00, 0x00, 0x00, 0x00      /* 0x58 */
};

// shift flags. left shift is bit 0, right shift is bit 1.
uint8_t shift;
// control flags just like shift flags.
uint8_t ctrl;
uint8_t keypresses[256];

// New characters are added to hd. characters are pulled off of tl.
uint8_t kb_buff[BUFFLEN];
uint8_t kb_buff_reader;
uint8_t kb_buff_writer;

static void poll_keyboard() {
    uint8_t next = (kb_buff_writer + 1) % BUFFLEN;
    if (next == kb_buff_reader) {
        // Buffer is full.
        return;
    }

    uint8_t scancode = inb(0x60);
    if (scancode == 0) {
        return;
    }

    if (scancode & 0x80) { // if scancode has bit 8 set its a key release (0x80 == 10000000)
        uint8_t pressed_key = scancode & 0x7F;

        // check if the key was a shift or control key
        if (pressed_key == 0x2A) { // left shift
            shift &= 0x02; // unset left shift
        } 
        else if (pressed_key == 0x36) { // right shift
            shift &= 0x01; // unset right shift
        } 
        else if (pressed_key == 0x1D) { // left control
            ctrl &= 0x02; // unset left control
        } 
        else if (pressed_key == 0x1D) { // right control
            ctrl &= 0x01; // unset right control
        }

        keypresses[pressed_key] = 0;
        return;
    }

    if (keypresses[scancode] < 10 && keypresses[scancode] > 0) { // if key is pressed between 1 and 10 times
        keypresses[scancode]++;
        return;
    }

    keypresses[scancode]++;

    if (scancode == 0x2A) { // left shift
        shift |= 0x01; // set left shift
    } 
    else if (scancode == 0x36) { // right shift
        shift |= 0x02; // set right shift
    } 
    else if (scancode == 0x1D) { // left control
        ctrl = 1; // set left control
    } 

    const uint8_t *codes = lower_ascii_codes;

    if (ctrl) {
        if (codes[scancode] == 'd') {
            // ctrl-d is EOF
            kb_buff[kb_buff_writer] = EOT;
            kb_buff_writer = next;
            return;
        }
    }
    else if (shift) {
        codes = upper_ascii_codes;
    }
    else {
        codes = lower_ascii_codes;
    }

    uint8_t ascii = codes[scancode];
    if (ascii) {
        kb_buff[kb_buff_writer] = ascii;
        kb_buff_writer = next;
        return;
    }
}

void keyboard_handler(registers_t regs) {
    poll_keyboard();
}

void init_keyboard() {
    printf("Initializing keyboard.\n");

    outb(0x64, 0xFF);
    uint8_t status = inb(0x64);
    printf("Got status (%x) after reset.\n", status);
    
    status = inb(0x64);
    if(status & (1 << 0)) {
        printf("Output buffer full.\n");
    }
    else {
        printf("Output buffer empty.\n");
    }

    if(status & (1 << 1)) {
        printf("Input buffer full.\n");
    }
    else {
        printf("Input buffer empty.\n");
    }

    if(status & (1 << 2)) {
        printf("System flag set.\n");
    }
    else {
        printf("System flag unset.\n");
    }

    if(status & (1 << 3)) {
        printf("Command/Data -> PS/2 device.\n");
    }
    else {
        printf("Command/Data -> PS/2 controller.\n");
    }

    if(status & (1 << 6)) {
        printf("Timeout error.\n");
    }
    else {
        printf("No timeout error.\n");
    }

    if(status & (1 << 7)) {
        printf("Parity error.\n");
    }
    else {
        printf("No parity error.\n");
    }

    // Test the controller.
    outb(0x64, 0xAA);
    uint8_t result = inb(0x60);
    if(result == 0x55) {
        printf("PS/2 controller test passed.\n");
    }
    else if(result == 0xFC) {
        printf("PS/2 controller test failed.\n");
//        return;
    }
    else {
        printf("PS/2 controller responded to test with unknown code %x\n", result);
        printf("Trying to continue.\n");
//        return;
    }

    // Check the PS/2 controller configuration byte.
    outb(0x64, 0x20);
    result = inb(0x60);
    printf("PS/2 config byte: %x\n", result);

    register_interrupt_handler(IRQ1, keyboard_handler);

    printf("Keyboard ready to go!\n\n");
}

char get_ascii_char() {
    while (1) {
        sys_cli();
        if (kb_buff_reader != kb_buff_writer) {
            char c = kb_buff[kb_buff_reader];
            kb_buff_reader = (kb_buff_reader + 1) % BUFFLEN;
            sys_sti();
            return c;
        }
        sys_sti();
        pause();
    }
}








