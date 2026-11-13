CC = gcc
CFLAGS = -Wall -Wextra -g -Iinclude -std=c11 -MMD

SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=build/%.o)
DEP = $(OBJ:.o=.d)

TARGET = build/main

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

build/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

-include $(DEP)

run: all
	./$(TARGET)

clean:
	rm -rf build/*.o build/*.d $(TARGET)

.PHONY: all run clean