SHELL := bash

o ?=

test ?= test/

default:

BPAN_CMDS := $(shell bpan -q cmds | grep -v test)


.PHONY: test
test:
	prove -v $(test)

$(BPAN_CMDS)::
	bpan $@ $o
