set -e
. ./headers.sh

cd libc && DESTDIR="$SYSROOT" $MAKE install TARGET=libc
