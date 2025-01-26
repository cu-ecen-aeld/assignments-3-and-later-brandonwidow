# Build writer application
CC=$(CROSS_COMPILE)gcc

all: writer.o
	$(CC) -g -Wall writer.o -o writer

writer.o: writer.c 
	$(CC) -g -Wall -c -o writer.o writer.c 

clean:
	rm -rf *.o writer