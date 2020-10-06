// +build !linux
// +build !android
// +build !darwin,!amd64
// +build !darwin,!arm64
// +build !ios,!amd64
// +build !ios,!arm64

// Package libtor is a self-contained static tor library.
package libtor

// This file is a wrapper around the internal libtor package to keep the original
// Go API, but move the thousands of generated Go files into a sub-folder, out of
// the way of the repo root.

import (
	"context"
	"fmt"

	"github.com/cretz/bine/process"
)

// ProviderVersion returns the Tor provider name and version exposed from the
// Tor embedded API.
func ProviderVersion() string {
	return "Unsupported Target !"
}

// Available is true if this target is supported.
const Available = false

// Creator implements the bine.process.Creator, permitting libtor to act as an API
// backend for the bine/tor Go interface.
var Creator process.Creator = creator{}

type creator struct{}

var errUnsuported = fmt.Errorf("Your target is not supported for an embedded tor node.")

func (creator) New(_ context.Context, _ ...string) (process.Process, error) {
	return nil, errUnsuported
}
