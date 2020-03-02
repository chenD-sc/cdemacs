emacs ?= emacs

BASEDIR := $(shell pwd)

pull:
	echo "-*- mode: compilation -*-" > etc/log
	git pull 2>&1 | tee -a etc/log
	git submodule init 2>&1 | tee -a etc/log
	git submodule update 2>&1 | tee -a etc/log

run:
	$(emacs) -Q -l init.el

.PHONY: run pull
