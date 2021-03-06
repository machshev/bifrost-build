#!/bin/bash

SRC=libav-9.5.tar.gz
DST=/var/spool/src/"${SRC}"
MD5=e49056dece487cd65d750b7ac0a38343

[ -s "${DST}" ] || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://www.libav.org/releases/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.icm.edu.pl/packages/libav/"${SRC}" \
                || ../../wget-finder -O "${DST}" "${SRC}:${MD5}"
