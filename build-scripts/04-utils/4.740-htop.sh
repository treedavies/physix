#!/bin/bash
source /opt/physix/include.sh || exit 1
cd $SOURCE_DIR/$1 || exit 1

su physix -c './autogen.sh && ./configure'
chroot_check $? "configure"

su physix -c "make -j$NPROC"
chroot_check $? "make"

make install
chroot_check $? "make install"

