#!/bin/bash

SRC=openssh-5.5p1.tar.gz
DST=/var/spool/src/"${SRC}"
MD5=88633408f4cb1eb11ec7e2ec58b519eb

[ -s "${DST}" ] || ../../wget-finder --checksum "${MD5}" -O "${DST}" ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.riken.jp/net/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.eu.openbsd.org/pub/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://mirror.cogentco.com/pub/openssh/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.uni-bayreuth.de/security/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.stu.edu.tw/BSD/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp8.de.freebsd.org/pub/comp/Linux/slackware/slackware-13.1/source/n/openssh/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://www.guralp.com/platinum/opensource/platinum-stable-11201/files/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://piotrkosoft.net/pub/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.sunet.se/mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/download/src/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" https://mirrors.evowise.com/pub/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://mirrors.securehost.com/openssh/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://mirrors.ircam.fr/pub/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://ftp.cc.uoc.gr/mirrors/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://mirror.one.com/pub/OpenBSD/OpenSSH/portable/"${SRC}" \
                || ../../wget-finder --checksum "${MD5}" -O "${DST}" http://mirrors.slackware.com/slackware/slackware64-13.1/source/n/openssh/"${SRC}" \
                || ../../wget-finder -O "${DST}" "${SRC}:${MD5}"
