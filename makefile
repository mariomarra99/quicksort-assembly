CC = gcc
CFLAGS1 = -m32
CFLAGS2 = -z noexecstack

swap:	clean
	$(CC) $(CFLAGS1) quick_test.c quick.c quick.s -o quick $(CFLAGS2)

clean:
	rm -f quick