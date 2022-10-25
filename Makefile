TARGET_PRODUCT ?= ti335x
ifneq ("${TARGET_PRODUCT}",$(filter "${TARGET_PRODUCT}","ti335x" "ti437x" "ti572x" "ti654x"))
$(error Unsupported TARGET_PRODUCT: ${TARGET_PRODUCT})
endif

COMMONDIR = ./targetfs/common
PRODUCTDIR = ./targetfs/${TARGET_PRODUCT}

sysconfdir ?= /etc
includedir ?= /usr/include
datadir ?= /usr/share
bindir ?= /usr/bin
libdir ?= /usr/lib

.PHONY: all
all: ;

.PHONY: install
install:
	mkdir -p ${DESTDIR}/${sysconfdir}
	mkdir -p ${DESTDIR}/${includedir}
	mkdir -p ${DESTDIR}/${datadir}
	mkdir -p ${DESTDIR}/${bindir}
	mkdir -p ${DESTDIR}/${libdir}

	cp -R -P ${COMMONDIR}/etc/*     ${DESTDIR}/${sysconfdir}
	cp -R -P ${COMMONDIR}/include/* ${DESTDIR}/${includedir}
	cp -R -P ${COMMONDIR}/share/*   ${DESTDIR}/${datadir}
	cp -R -P ${PRODUCTDIR}/bin/*    ${DESTDIR}/${bindir}
	cp -R -P ${PRODUCTDIR}/lib/*    ${DESTDIR}/${libdir}
