#!/bin/bash

source build/setup-darwin.sh
if [ "$?" != "0" ] ; then
 exit 1
fi
brew install pkg-config autoconf automake
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
