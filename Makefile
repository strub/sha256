# -*- Makefile -*-

# ------------------------------------------------------------------------
.PHONY: default build test run-test proofs clean

default: build

build:
	$(MAKE) -C src build

test: build
	$(MAKE) -C test build

run-test: build
	$(MAKE) -C test run-test

proofs:
	$(MAKE) -C proofs check

clean:
	$(MAKE) -C src clean
	$(MAKE) -C test clean
