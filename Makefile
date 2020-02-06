emacs ?= emacs

BASEDIR := $(shell pwd)

install: upgrade
	make run

pull:
	echo "-*- mode: compilation -*-" > etc/log
	git pull 2>&1 | tee -a etc/log
	git submodule init 2>&1 | tee -a etc/log
	git submodule update 2>&1 | tee -a etc/log

upgrade: pull
	cd $(BASEDIR) && $(emacs) -batch -l packages.el 2>&1 | tee -a etc/log

run:
	$(emacs) -Q -l init.el

.PHONY: install upgrade update run pull
