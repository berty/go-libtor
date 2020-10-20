#!/bin/bash

brew install openssl@1.1
if [ "$?" != "0" ] ; then
 echo "Openssl install failed"
 exit 1
fi
export LD_LIBRARY_PATH="/usr/local/opt/openssl@1.1/lib:${LD_LIBRARY_PATH}"
export CPATH="/usr/local/opt/openssl@1.1/include:${CPATH}"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:${PKG_CONFIG_PATH}"
export CGO_LDFLAGS="-g -O2 -L/usr/local/opt/openssl@1.1/lib"
export CGO_CFLAGS="-g -O2 -I/usr/local/opt/openssl@1.1/include"
