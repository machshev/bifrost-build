#!/bin/bash

V=2.6.38-rc8
VER=kernel-"${V}"
SRC=kernel-"${V}".tar.gz
DST=/var/spool/src/"${SRC}"

if [ ! -s "${DST}" ]; then
    pkg_install passwd-file-1 || exit 2
    pkg_install git-1.7.1-2 || exit 2
    pkg_install openssh-5.5p1-1 || exit 2
    cd /tmp
    rm -rf "${VER}"
    /opt/git/bin/git clone git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next-2.6.git "${VER}" || exit 1
    cd "${VER}"
    /opt/git/bin/git checkout 5f86cad1e8224af9e3b9b43dd84b146a9ff0df87 || exit 1
    rm -rf .git
    cd /tmp
    tar czf "${DST}" "${VER}"
    rm -rf "${VER}"
fi
