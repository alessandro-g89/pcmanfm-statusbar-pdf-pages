prefix=/usr

CFLAGS = `pkg-config --cflags libfm` `pkg-config --cflags poppler-glib`
LDFLAGS = `pkg-config --libs poppler-glib` -rpath $(prefix)/lib -no-undefined -module -avoid-version
PLUGIN_NAME = pcmanfm-statusbar-pdf-pages

target=$(shell gcc -dumpmachine)
libdir=$(prefix)/lib/$(target)

all:
	libtool --mode=compile gcc $(CFLAGS) -c $(PLUGIN_NAME).c
	libtool --mode=link gcc $(LDFLAGS) $(PLUGIN_NAME).lo -o $(PLUGIN_NAME).la

install:
	mkdir -p $(DESTDIR)$(libdir)/pcmanfm
	libtool --mode=install install -c $(PLUGIN_NAME).la $(DESTDIR)$(libdir)/pcmanfm
	libtool --finish $(DESTDIR)$(libdir)/pcmanfm

