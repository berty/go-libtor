// go-libtor - Self-contained Tor from Go
// Copyright (c) 2018 Péter Szilágyi. All rights reserved.
// +build darwin,amd64 darwin,arm64 ios,amd64 ios,arm64

package libtor

/*
#ifdef PREFIX_GO_LIBTOR
# pragma extern_prefix GO_LIBTOR_
#endif

#define BUILDDIR ""

#include <../src/lib/crypt_ops/crypto_ed25519.c>
*/
import "C"
