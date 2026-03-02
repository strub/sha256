# -*- Makefile -*-

# ------------------------------------------------------------------------
-include ../Makefile.conf

# ------------------------------------------------------------------------
.PHONY: default clean run-test

default: build

build: test

test: test.c ../src/sha256.a
	$(CC) -o test -I../src -L../src test.c  -lsha256 

run-test: test
	./test

clean:
	rm -f test
