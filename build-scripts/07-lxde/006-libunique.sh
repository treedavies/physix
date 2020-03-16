#!/bin/bash
source /physix/include.sh || exit 1
cd $SOURCE_DIR/$1 || exit 1

su physix -c 'patch -Np1 -i ../libunique-1.1.6-upstream_fixes-1.patch'

su physix -c 'autoreconf -fi && ./configure --prefix=/usr  \
            --disable-dbus \
            --disable-static'
chroot_check $? "configure"

su physix -c 'make'
chroot_check $? "make"

make install
chroot_check $? "make install"