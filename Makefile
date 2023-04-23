CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c99 -O2
TARGET = word_count
OBJECTS = word_count.o map_reduce.o

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS)ƒ -o $(TARGET) $(OBJECTS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJECTS)
