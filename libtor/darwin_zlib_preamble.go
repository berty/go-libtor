// go-libtor - Self-contained Tor from Go
// Copyright (c) 2018 Péter Szilágyi. All rights reserved.
// +build darwin,amd64

package libtor


/*
#cgo CFLAGS: -I${SRCDIR}/../darwin/zlib
#cgo CFLAGS: -DHAVE_UNISTD_H -DHAVE_STDARG_H
*/
import "C"
