#!/bin/bash

TMPDIR=/tmp/gtkman
unalias rm
rm -fr $TMPDIR
mkdir -p $TMPDIR

rm -f *.deb

make

make install DESTDIR=${TMPDIR} PREFIX=/usr

fpm -s dir -t deb -C ${TMPDIR} --name gtkman --version 0.0.1 --iteration 1 \
  --depends man --description "GTK3 based man page viewer"


