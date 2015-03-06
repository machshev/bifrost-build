#!/bin/bash

SRC=re-alpine-2.02.tar.bz2
DST=/var/spool/src/$SRC
MD5=5e75826b15f05674856be8618bdefdfb

[ -s "$DST" ] || wget -O $DST http://osdn.dl.sourceforge.net/sourceforge/re-alpine/$SRC \
 || ../../wget-finder -O $DST $SRC:$MD5
