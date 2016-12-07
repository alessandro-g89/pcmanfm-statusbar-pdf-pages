CFLAGS = `pkg-config --cflags libfm` `pkg-config --cflags poppler-glib`
AM_LDFLAGS = `pkg-config --libs poppler-glib` -rpath /usr/lib -no-undefined -module -avoid-version
PLUGIN_NAME = pcmanfm-statusbar-pdf-pages
PREFIX = /usr/lib/x86_64-linux-gnu/pcmanfm

all:
	libtool --mode=compile gcc $(CFLAGS) -c $(PLUGIN_NAME).c
	libtool --mode=link gcc $(AM_LDFLAGS) $(PLUGIN_NAME).lo -o $(PLUGIN_NAME).la

install:
	libtool --mode=install install -c $(PLUGIN_NAME).la $(PREFIX)
	libtool --finish $(PREFIX)
