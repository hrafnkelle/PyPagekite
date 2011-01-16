SHELL = /bin/sh
ETC = $(DESTDIR)/etc/pagekite/
SBIN = $(DESTDIR)/usr/sbin

all:
	echo "Don't panic"

pkg: debian/changelog
	dpkg-buildpackage
install:
	install -d $(SBIN) $(ETC)
	install pagekite.py $(SBIN)
	install -m600 pagekite.rc $(ETC)
	install -m600 local.rc $(ETC)
	install -m644 pagekite.ca-cert $(ETC)

mrp:
	debian/rules clean
