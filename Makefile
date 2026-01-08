# Makefile for svgfont
# Author: Lenik <svgfont@bodz.net>
# License: GPL
# Year: 2026

PREFIX ?= /usr/local
DESTDIR ?=
BINDIR = $(DESTDIR)$(PREFIX)/bin
MANDIR = $(DESTDIR)$(PREFIX)/share/man/man1
BASHCOMPDIR = $(DESTDIR)$(PREFIX)/share/bash-completion/completions

# Project directory (where this Makefile is located)
PROJECT_DIR := $(shell pwd)

.PHONY: all install install-symlinks uninstall clean

all:
	@echo "Nothing to build. Use 'make install' or 'make install-symlinks'"

install:
	install -d $(BINDIR)
	install -d $(MANDIR)
	install -d $(BASHCOMPDIR)
	install -m 755 svgfont $(BINDIR)/
	install -m 644 svgfont.1 $(MANDIR)/
	install -m 644 bash-completion/svgfont $(BASHCOMPDIR)/

uninstall:
	rm -f $(BINDIR)/svgfont
	rm -f $(MANDIR)/svgfont.1
	rm -f $(BASHCOMPDIR)/svgfont

install-symlinks:
	sudo install -d /usr/bin
	sudo install -d /usr/share/man/man1
	sudo install -d /usr/share/bash-completion/completions
	sudo ln -sf $(PROJECT_DIR)/svgfont /usr/bin/svgfont
	sudo ln -sf $(PROJECT_DIR)/svgfont.1 /usr/share/man/man1/svgfont.1
	sudo ln -sf $(PROJECT_DIR)/bash-completion/svgfont /usr/share/bash-completion/completions/svgfont

uninstall-symlinks:
	sudo rm -f /usr/bin/svgfont
	sudo rm -f /usr/share/man/man1/svgfont.1
	sudo rm -f /usr/share/bash-completion/completions/svgfont

clean:
	@echo "Nothing to clean"

