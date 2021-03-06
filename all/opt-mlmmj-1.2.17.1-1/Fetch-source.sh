#!/bin/bash

SRC=mlmmj-1.2.17.1.tar.gz
DST=/var/spool/src/"${SRC}"
MD5=c705d8bf3003df6810c9775ce86e7af0

[ -s "${DST}" ] || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://mlmmj.org/releases/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.acc.umu.se/mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/download/src/"${SRC}" \
                || ../../wget-finder -O "${DST}" "${SRC}:${MD5}"
