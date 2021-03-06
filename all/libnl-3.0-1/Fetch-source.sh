#!/bin/bash

SRC=libnl-3.0.tar.gz
DST=/var/spool/src/"${SRC}"
MD5=00740414d4d6f173a7dd2aa19432da62

[ -s "${DST}" ] || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://people.suug.ch/~tgr/libnl/files/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://www.infradead.org/~tgr/libnl/files/"${SRC}" \
                || ../../wget-finder -O "${DST}" "${SRC}:${MD5}"
