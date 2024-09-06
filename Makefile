.POSIX:

XCFLAGS = ${CFLAGS} -nostdlib -std=c99

all:
	${CC} ${XCFLAGS} -fPIC -nostdlib libpolkit-gobject-1.c -o libpolkit-gobject-1.so.0.0.0 ${LDFLAGS} -shared -Wl,-soname,libpolkit-gobject-1.so.0

install:
	mkdir -p ${DESTDIR}/usr/lib64
	cp -f libpolkit-gobject-1.so.0.0.0 ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so.0.0.0
	ln -rsf ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so.0.0.0 ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so.0
	ln -rsf ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so.0 ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so
	mkdir -p ${DESTDIR}/usr/include/polkit-1
	cp -rf headers/* ${DESTDIR}/usr/include/polkit-1/polkit
	mkdir -p ${DESTDIR}/usr/lib64/pkgconfig
	cp -f polkit-gobject-1.pc ${DESTDIR}/usr/lib64/pkgconfig/polkit-gobject-1.pc

uninstall:
	rm -f ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so.0.0.0
	rm -f ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so.0
	rm -f ${DESTDIR}/usr/lib64/libpolkit-gobject-1.so
	rm -rf ${DESTDIR}/usr/include/polkit-1/polkit
	rm -f ${DESTDIR}/usr/lib64/pkgconfig/polkit-gobject-1.pc

clean:
	rm -f libpolkit-gobject-1.so.0.0.0

.PHONY: all clean install uninstall
