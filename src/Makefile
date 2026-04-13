# -*- Makefile -*-

# ------------------------------------------------------------------------
-include ../Makefile.conf

# ------------------------------------------------------------------------
SHA256_SRC_C   := sha256.c
SHA256_SRC_ASM := sha256_compress.s
SHA256_OBJECTS := $(SHA256_SRC_C:%.c=%.o) $(SHA256_SRC_ASM:%.s=%.o)

SHA512_SRC_C   := sha512.c
SHA512_SRC_ASM := sha512_compress.s
SHA512_OBJECTS := $(SHA512_SRC_C:%.c=%.o) $(SHA512_SRC_ASM:%.s=%.o)

# ------------------------------------------------------------------------
.PHONY: default clean
.PRECIOUS: %.s

default: build

build: libsha256.a libsha512.a

libsha256.a: $(SHA256_OBJECTS)
	$(AR) rc $@ $(SHA256_OBJECTS)

libsha512.a: $(SHA512_OBJECTS)
	$(AR) rc $@ $(SHA512_OBJECTS)

%.s: %.jazz
	$(JASMINC) -arch x86-64 -o $@ $<

clean:
	rm -f libsha256.a libsha512.a $(SHA256_OBJECTS) $(SHA512_OBJECTS)
