// go-libtor - Self-contained Tor from Go
// Copyright (c) 2018 Péter Szilágyi. All rights reserved.
// +build darwin,amd64

package libtor

/*
#include <compat/sys/queue.h>
#include <../buffer.c>
*/
import "C"
