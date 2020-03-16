#!/bin/bash
source /opt/physix/include.sh || exit 1
cd $SOURCE_DIR/$1 || exit 1

su physix -c 'autoreconf'
chroot_check $? 'autoreconf'

su physix -c './configure --prefix=/usr'
chroot_check $? 'configure'

su physix -c 'make'
chroot_check $? 'make'

make install
chroot_check $? 'make install'

ln -v -sf /usr/share/graphviz/doc \
         /usr/share/doc/graphviz-2.40.1
