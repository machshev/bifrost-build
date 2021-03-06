#!/bin/bash

SRC=bzip2-1.0.6.tar.gz
DST=/var/spool/src/"${SRC}"
MD5=00b516f4704d4a7cb50a1d97e6e8e15b

[ -s "${DST}" ] || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://www.bzip.org/1.0.6/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://pkgs.fedoraproject.org/repo/pkgs/bzip2/bzip2-1.0.6.tar.gz/00b516f4704d4a7cb50a1d97e6e8e15b/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.clfs.org/pub/clfs/conglomeration/bzip2/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" https://downloads.openwrt.org/sources/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://distro.ibiblio.org/tinycorelinux/6.x/x86/release/src/toolchain/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.riken.jp/sagemath/spkg/upstream/bzip2/index.html"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.sunet.se/mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/download/src/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://www.embedian.com/oe-downloads/"${SRC}" \
                || ../../wget-finder -O "${DST}" "${SRC}:${MD5}"
