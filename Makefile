# ==========================================
# Makefile for BSDSF23A034-OS-A03 Shell
# Directory Structure:
#   src/     - source files (.c)
#   include/ - header files (.h)
#   obj/     - object files (.o)
#   bin/     - final executable (psh)
# ==========================================

# Compiler and flags
CC      = gcc
CFLAGS  = -Wall -g -Iinclude
TARGET  = bin/psh

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Source and object files
SRC     = $(wildcard $(SRC_DIR)/*.c)
OBJ     = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

# Default rule
all: $(BIN_DIR) $(OBJ_DIR) $(TARGET)

# Link object files into final binary
$(TARGET): $(OBJ)
	@echo "🔗 Linking object files..."
	$(CC) $(OBJ) -o $(TARGET)
	@echo "✅ Build complete: $(TARGET)"

# Compile .c into .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "🧩 Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

# Create directories if they don't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build files..."
	rm -rf $(OBJ_DIR)/*.o $(TARGET)

# Run the shell
run: all
	./$(TARGET)

# Phony targets (non-file commands)
.PHONY: all clean run

