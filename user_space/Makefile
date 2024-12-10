# Variables
DEFAULT_HOST != ../default-host.sh
HOST ?= $(DEFAULT_HOST)
HOSTARCH != ../target-triplet-to-arch.sh $(HOST)

CFLAGS?=-O2 -g
CPPFLAGS?=
LDFLAGS?=
LIBS?=

DESTDIR?=
PREFIX?=/usr/local
EXEC_PREFIX?=$(PREFIX)
BOOTDIR?=$(EXEC_PREFIX)/boot
INCLUDEDIR?=$(PREFIX)/include

CFLAGS:=$(CFLAGS) -ffreestanding -Wall -Wextra
CPPFLAGS:=$(CPPFLAGS) -Iinclude
LDFLAGS:=$(LDFLAGS)
LIBS:=$(LIBS) -nostdlib -lc -lgcc

ELF_DIR := elf
BIN_DIR := bin
OBJ_DIR := obj

OBJ_COPY := objcopy
OBJ_DUMP := objdump

TASK_DIRS := process_1 process_2 shell # List of task directories
TASK_OBJS := $(addsuffix .o, $(TASK_DIRS))

CRT0_OBJ := crt0.o

# Default target
all: $(CRT0_OBJ) $(TASK_DIRS) $(TASK_OBJS)
	@echo "Built all tasks"

# Rule to build crt0.o
$(CRT0_OBJ):
	$(CC) $(CFLAGS) $(CPPFLAGS) -c crt0.S -o $(CRT0_OBJ)
	@echo "Built $(CRT0_OBJ)"

# Rule to process each task
$(TASK_DIRS):
	@mkdir -p $(ELF_DIR) $(BIN_DIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(CRT0_OBJ) -T linker.ld $(@)/main.c -o $(ELF_DIR)/$(@).elf $(LIBS)
	$(OBJ_COPY) $(ELF_DIR)/$(@).elf -O binary $(BIN_DIR)/$(@).bin
	$(OBJ_DUMP) -l -S -D $(ELF_DIR)/$(@).elf > $(ELF_DIR)/$(@).asm
	@echo "Built $(@): ELF -> $(ELF_DIR)/$(@).elf, BIN -> $(BIN_DIR)/$(@).bin"

$(TASK_OBJS): %.o: $(BIN_DIR)/%.bin
	@mkdir -p $(OBJ_DIR)
	$(OBJ_COPY) --rename-section .data=.rodata,alloc,load,readonly,data,contents -I binary -O elf32-i386 $(BIN_DIR)/$*.bin $(OBJ_DIR)/$@
	@echo "Generated object $@ for embedding binary $*"


# Clean target
clean:
	rm -rf $(ELF_DIR) $(BIN_DIR) $(OBJ_DIR) $(CRT0_OBJ)
	@echo "Cleaned $(ELF_DIR) and $(BIN_DIR) directories"

# Phony targets
.PHONY: all clean $(TASK_DIRS)

