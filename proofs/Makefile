# -*- Makefile -*-

# --------------------------------------------------------------
-include ../Makefile.conf

# --------------------------------------------------------------
.PHONY: default check

default: check clean

check:
	$(EASYCRYPT) runtest tests.config sha256

clean: