# -*- Makefile -*-

# ------------------------------------------------------------------------
-include ../Makefile.conf

# ------------------------------------------------------------------------
SRC_C   := sha256.c
SRC_ASM := sha256_compress.s
OBJECTS := $(SRC_C:%.c=%.o) $(SRC_ASM:%.s=%.o)

# ------------------------------------------------------------------------
.PHONY: default clean
.PRECIOUS: %.s

default: build

build: libsha256.a

libsha256.a: $(OBJECTS)
	$(AR) rc $@ $(OBJECTS)

%.s: %.jazz
	$(JASMINC) -arch x86-64 -o $@ $<

clean:
	rm -f libsha256.a $(OBJECTS)
