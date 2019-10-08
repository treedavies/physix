#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (C) 2019 Travis Davies

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source $SCRIPTPATH/../include.sh               
source ~/.bashrc

cd $BUILDROOT/sources      
PKG=$1                   
stripit $PKG             
SRCD=$STRIPPED           
                         
unpack $PKG              
cd $BUILDROOT/sources/$SRCD

make -j8 PREFIX=/tools install
check $? "bzip2 make PREFIX=/tools install"

rm -rf $BUILDROOT/sources/$SRCD
check $? "bzip2: rm -rf $BUILDROOT/sources/$SRCD"

