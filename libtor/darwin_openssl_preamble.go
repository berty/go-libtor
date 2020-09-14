// go-libtor - Self-contained Tor from Go
// Copyright (c) 2018 Péter Szilágyi. All rights reserved.
// +build darwin,amd64

package libtor

/*
#cgo CFLAGS: -I${SRCDIR}/../darwin/openssl_config
#cgo CFLAGS: -I${SRCDIR}/../darwin/openssl
#cgo CFLAGS: -I${SRCDIR}/../darwin/openssl/include
#cgo CFLAGS: -I${SRCDIR}/../darwin/openssl/crypto/ec/curve448
#cgo CFLAGS: -I${SRCDIR}/../darwin/openssl/crypto/ec/curve448/arch_32
#cgo CFLAGS: -I${SRCDIR}/../darwin/openssl/crypto/modes
*/
import "C"
