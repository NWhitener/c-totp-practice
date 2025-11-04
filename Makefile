CC = gcc
CFLAGS = -ansi -pedantic -Wall

SRC_DIR = src
BUILD_DIR = build
BIN = $(BUILD_DIR)/totp_test   # fixed typo: UILD_DIR → BUILD_DIR

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRCS))

all: $(BIN)   # fixed typo: bin → BIN (case matters)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)/*

