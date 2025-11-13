# Compiler and flags
CC = gcc
CFLAGS = -ansi -pedantic -Wall

# Directories
SRC_DIR = src
TEST_DIR = tests
BUILD_DIR = build

# Collect source and test files
SRC_SRCS := $(wildcard $(SRC_DIR)/*.c)
TEST_SRCS := $(wildcard $(TEST_DIR)/*.c)

# Object files
SRC_OBJS := $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/src/%.o, $(SRC_SRCS))
TEST_OBJS := $(patsubst $(TEST_DIR)/%.c, $(BUILD_DIR)/tests/%.o, $(TEST_SRCS))

# Test binaries (each test.c → build/tests/test)
TEST_BINS := $(patsubst $(TEST_DIR)/%.c, $(BUILD_DIR)/tests/%, $(TEST_SRCS))

# Default target
all: $(TEST_BINS)

# Rule to build each test binary
$(BUILD_DIR)/tests/%: $(BUILD_DIR)/tests/%.o $(SRC_OBJS)
	@mkdir -p $(dir $@)
	@echo "Linking $@"
	$(CC) $(CFLAGS) -o $@ $^   # test object + all src objects

# Compile src/*.c → build/src/*.o
$(BUILD_DIR)/src/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo "Compiling source $<"
	$(CC) $(CFLAGS) -c $< -o $@

# Compile tests/*.c → build/tests/*.o
$(BUILD_DIR)/tests/%.o: $(TEST_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo "Compiling test $<"
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
