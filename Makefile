# Define the assembler and linker
NASM = nasm
LD = ld

# Define the assembler and linker flags
NASM_FLAGS = -f elf64
LD_FLAGS =

# Find all .asm files in the current and subdirectories
ASM_FILES = $(shell find . -name '*.asm')

# Generate a list of object files and executables
OBJ_FILES = $(ASM_FILES:.asm=.o)
BIN_FILES = $(ASM_FILES:.asm=.bin)

# Default target to build all executables
all: $(BIN_FILES)

# Pattern rule to assemble .asm files to .o files
%.o: %.asm
	$(NASM) $(NASM_FLAGS) -o $@ $<

# Pattern rule to link .o files to executables with .bin extension
%.bin: %.o
	$(LD) $(LD_FLAGS) -o $@ $<

# Clean target to remove all generated files
clean:
	rm -f $(OBJ_FILES) $(BIN_FILES)

.PHONY: all clean

