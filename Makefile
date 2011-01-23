SHELL = /bin/sh
ETC = $(DESTDIR)/etc/pagekite/
BIN = $(DESTDIR)/usr/bin

all:
	echo "Don't panic"

pkg: debian/changelog
	dpkg-buildpackage -us -uc
install:
	install -d $(BIN) $(ETC)
	install pagekite.py $(BIN)
	install -m600 pagekite.rc $(ETC)
	install -m600 local.rc $(ETC)
	install -m644 pagekite.net.ca_cert $(ETC)

mrp:
	debian/rules clean
