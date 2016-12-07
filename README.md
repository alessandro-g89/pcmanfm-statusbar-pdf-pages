# PCManFm plugin to show the page count of a PDF in the statusbar

## Overview

This plugin shows the number of pages of a PDF document in the status bar of PCManF, when a PDF file is selected. It uses libpoppler-glib to parse PDF files. 

## Installation

First install dependencies. For debian-based systems:
```
sudo apt-get install libtool-bin libpoppler-glib-dev libfm-dev
```
Then compile and install:
```
make
sudo make install
```
The plugin is installed in /usr/lib/x86_64-linux-gnu/pcmanfm, which is fine for 64-bit systems. For 32-bit, change x86_64 to i386 in the Makefile.

### Contacts
<alessandro.g89@gmail.com>
