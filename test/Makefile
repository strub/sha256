# -*- Makefile -*-

# ------------------------------------------------------------------------
-include ../Makefile.conf

# ------------------------------------------------------------------------
.PHONY: default clean run-test

default: build

build: test_sha256 test_sha512

test_sha256: test.c ../src/libsha256.a
	$(CC) -o test_sha256 -I../src -L../src test.c -lsha256

test_sha512: test_sha512.c ../src/libsha512.a
	$(CC) -o test_sha512 -I../src -L../src test_sha512.c -lsha512

run-test: test_sha256 test_sha512
	./test_sha256
	./test_sha512

clean:
	rm -f test_sha256 test_sha512
