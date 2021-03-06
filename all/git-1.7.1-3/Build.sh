#!/bin/bash

SRCVER=git-1.7.1
PKG=$SRCVER-3 # with build version

PKGDIR=${PKGDIR:-/var/lib/build/all/$PKG}
SRC=/var/spool/src/$SRCVER.tar.bz2
BUILDDIR=/var/tmp/src/$SRCVER
DST="/var/tmp/install/$PKG"

#########
# Install dependencies:
pkg_available openssl-0.9.8q-1 zlib-1.2.5-1 curl-devel-7.20.1-1
pkg_install openssl-0.9.8q-1 || exit 2
pkg_install zlib-1.2.5-1 || exit 2
pkg_install curl-devel-7.20.1-1 || exit 2

#########
# Unpack sources into dir under /var/tmp/src
./Fetch-source.sh || exit 1
cd $(dirname $BUILDDIR); tar xf $SRC

#########
# Patch
cd $BUILDDIR
libtool_fix-1
# patch -p1 < $PKGDIR/mypatch.pat

#########
# Configure
LIBS="-lz -lssl -lcrypto" CXXFLAGS="-march=i586 -Os -g" CFLAGS="-march=i586 -Os -g" LDFLAGS="-static -lssl -lcrypto" ./configure --prefix=/usr --with-curl || exit 1

#########
# Post configure patch
# patch -p0 < $PKGDIR/Makefile.pat
echo "NO_PERL=YesPlease" >> config.mak
echo "NO_NSEC=YesPlease" >> config.mak
echo "NO_PTHREADS=YesPlease" >> config.mak
echo "NO_TCLTK=YesPlease" >> config.mak
echo "NO_PYTHON=YesPlease" >> config.mak
#echo "NO_=YesPlease" >> config.mak

sed 's/-lcurl/-lcurl -lssl -lcrypto/g' Makefile > /tmp/m.$$
cp -f /tmp/m.$$ Makefile; rm /tmp/m.$$
sed 's/xof/xf/g' templates/Makefile > /tmp/m.$$
cp -f /tmp/m.$$ templates/Makefile; rm /tmp/m.$$

#########
# Compile
make V=1 || exit 1

#########
# Install into dir under /var/tmp/install
rm -rf "$DST"
make install DESTDIR=$DST # --with-install-prefix may be an alternative

#########
# Check result
cd $DST
# [ -f usr/bin/myprog ] || exit 1
# (file usr/bin/myprog | grep -qs "statically linked") || exit 1

#########
# Clean up
cd $DST
rm usr/bin/git-shell usr/bin/git-cvsserver usr/libexec/git-core/git-imap-send usr/libexec/git-core/git-shell usr/libexec/git-core/git-daemon
rm usr/libexec/git-core/git-quiltimport usr/libexec/git-core/git-archimport usr/libexec/git-core/git-cvsexportcommit usr/libexec/git-core/git-cvsimport usr/libexec/git-core/git-cvsserver usr/libexec/git-core/git-svn usr/libexec/git-core/git-send-email usr/libexec/git-core/git-instaweb 

rm usr/bin/git-receive-pack && ln -s git usr/bin/git-receive-pack 
rm usr/bin/git-upload-archive && ln -s git usr/bin/git-upload-archive
rm usr/libexec/git-core/git-upload-pack && ln -s /usr/bin/git-upload-pack usr/libexec/git-core/git-upload-pack

strip usr/bin/*
strip usr/libexec/git-core/*

#########
# Make package
cd $DST
tar czf /var/spool/pkg/$PKG.tar.gz .

#########
# Cleanup after a success
cd /var/lib/build
[ "$DEVEL" ] || rm -rf "$DST"
[ "$DEVEL" ] || rm -rf "$BUILDDIR"
pkg_uninstall
exit 0
