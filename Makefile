# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dmenu.c util.c
OBJ = $(SRC:.c=.o)

all: options dmenu

options:
	@echo dmenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

dmenu: dmenu.o drw.o util.o
	$(CC) -o $@ dmenu.o drw.o util.o $(LDFLAGS)

clean:
	rm -f dmenu $(OBJ) dmenu-$(VERSION).tar.gz

dist: clean
	mkdir -p dmenu-$(VERSION)
	cp LICENSE Makefile README arg.h config.def.h config.mk dmenu.1\
		drw.h util.h $(SRC)\
		dmenu-$(VERSION)
	tar -cf dmenu-$(VERSION).tar dmenu-$(VERSION)
	gzip dmenu-$(VERSION).tar
	rm -rf dmenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dmenu $(DESTDIR)$(PREFIX)/bin/dmenu-nonblock
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu-nonblock
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < dmenu.1 > $(DESTDIR)$(MANPREFIX)/man1/dmenu-nonblock.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/dmenu-nonblock.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dmenu-nonblock\
		$(DESTDIR)$(MANPREFIX)/man1/dmenu-nonblock.1\

.PHONY: all options clean dist install uninstall
