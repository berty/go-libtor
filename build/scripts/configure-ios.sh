#!/bin/sh
set -e

# Based on https://github.com/szanni/ios-autotools
usage () {
  echo "Usage: [VARIABLE...] $(basename $0) architecture [configure_parameters...]"
  echo ""
  echo "  architecture           Target architecture. [arm64|arm64e|x86_64]"
  echo "  configure_parameters   Params passed to configure script."
  echo ""
  echo "    CFLAGS CPPFLAGS CXXFLAGS LDFLAGS PKG_CONFIG_PATH"
  exit 1
}

# Sanity checks
if [ "$#" -lt 1 ]; then
  echo "Please supply an architecture name."
  usage
fi

if [ ! -x "./configure" ] ; then
  echo "No configure script found."
  usage
fi

# Export build ARCH
export ARCH=$1

# Export SDK and CHOST deduced by ARCH
case $ARCH in
arm64 | arm64e )
  export SDK=iphoneos
  export CHOST='aarch64-apple-darwin*'
  ;;
x86_64 )
  export SDK=iphonesimulator
  export CHOST='x86_64-apple-darwin*'
  ;;
* )
  echo "Invalid architecture name: $ARCH."
  usage
;;
esac

# Export supplied PREFIX or use default
if [ ! -z "$PREFIX" ]; then
  export PREFIX
else
  export PREFIX="$PWD/$ARCH"
fi

# Export use system default SDK
export SDKVERSION="$(xcrun --sdk $SDK --show-sdk-version)"
export SDKROOT="$(xcrun --sdk $SDK --show-sdk-path)"

# Binaries
export AR="$(xcrun --sdk $SDK --find ar)"
export CC="$(xcrun --sdk $SDK --find gcc)"
export CPP="$(xcrun --sdk $SDK --find gcc) -E"
export CXX="$(xcrun --sdk $SDK --find g++)"
export DSYMUTIL="$(xcrun --sdk $SDK --find dsymutil)"
export LD="$(xcrun --sdk $SDK --find ld)"
export LIPO="$(xcrun --sdk $SDK --find lipo)"
export NM="$(xcrun --sdk $SDK --find nm)"
export NMEDIT="$(xcrun --sdk $SDK --find nmedit)"
export OBJDUMP="$(xcrun --sdk $SDK --find objdump)"
export OTOOL="$(xcrun --sdk $SDK --find otool)"
export RANLIB="$(xcrun --sdk $SDK --find ranlib)"
export STRIP="$(xcrun --sdk $SDK --find strip)"

# Flags
export CFLAGS="$CFLAGS -arch $ARCH -isysroot $SDKROOT -miphoneos-version-min=12.0 -fembed-bitcode"
export CPPFLAGS="$CPPFLAGS -arch $ARCH -isysroot $SDKROOT -miphoneos-version-min=12.0 -fembed-bitcode"
export CXXFLAGS="$CXXFLAGS -arch $ARCH -isysroot $SDKROOT"
export LDFLAGS="$LDFLAGS -arch $ARCH -isysroot $SDKROOT"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$SDKROOT/usr/lib/pkgconfig"

# Remove script parameters
shift 1

# Print configuration
echo "$(tput smul)Env variables:$(tput rmul)"
echo ""
echo "  ARCH:            $ARCH"
echo "  CHOST:           $CHOST"
echo "  SDK:             $SDK"
echo "  SDKVERSION:      $SDKVERSION"
echo "  SDKROOT:         $SDKROOT"
echo ""
echo "  AR:              $AR"
echo "  CC:              $CC"
echo "  CPP:             $CPP"
echo "  CXX:             $CXX"
echo "  DSYMUTIL:        $DSYMUTIL"
echo "  LD:              $LD"
echo "  LIPO:            $LIPO"
echo "  NM:              $NM"
echo "  NMEDIT:          $NMEDIT"
echo "  OBJDUMP:         $OBJDUMP"
echo "  OTOOL:           $OTOOL"
echo "  RANLIB:          $RANLIB"
echo "  STRIP:           $STRIP"
echo ""
echo "  CFLAGS:          $CFLAGS"
echo "  CPPFLAGS:        $CPPFLAGS"
echo "  CXXFLAGS:        $CXXFLAGS"
echo "  LDFLAGS:         $LDFLAGS"
echo "  PKG_CONFIG_PATH: $PKG_CONFIG_PATH"
echo ""
echo "$(tput smul)Configure parameters:$(tput rmul)"
echo ""
echo "  $@"
echo ""

# Run configure
./configure $@
