// go-libtor - Self-contained Tor from Go
// Copyright (c) 2018 Péter Szilágyi. All rights reserved.
// +build darwin,amd64

package libtor

/*
#define BUILDDIR ""

#include <../src/core/crypto/onion_crypto.c>
*/
import "C"
