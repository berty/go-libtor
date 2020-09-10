#!/bin/bash

brew install pkg-config openssl@1.1 autoconf automake
export PKG_CONFIG_PATH="PKG_CONFIG_PATH:/usr/local/opt/openssl@1.1/lib/pkgconfig/"
if [ "$?" != "0" ] ; then
 echo "Install failed"
 exit 1
fi

go version
go env
autoconf --version
automake --version
make --version
gcc --version

echo "Building"

go run build/wrap.go --nobuild
if [ "$?" != "0" ] ; then
 echo "Error building"
 exit 1
fi

cd ..
tar cvf $HOME/go-libtor.tar go-libtor/
mv $HOME/go-libtor.tar $OUTDIR/
