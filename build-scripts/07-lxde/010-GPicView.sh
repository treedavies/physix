#!/bin/bash
source /physix/include.sh || exit 1
cd $SOURCE_DIR/$1 || exit 1

su physix -c './configure --prefix=/usr'
chroot_check $? "configure"

su physix -c 'make'
chroot_check $? "make"

make install &&
sed -i 's/Utility;//' /usr/share/applications/gpicview.desktop
chroot_check $? "make install"
