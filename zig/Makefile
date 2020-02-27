SHELL := /bin/bash

build:
	#zig build-lib --release-fast --single-threaded --strip -dynamic main.zig
	#zig build-lib --release-fast --single-threaded --strip main.zig
	zig build-exe --release-fast --single-threaded --strip -mcpu skylake rc4.zig
	zig build-exe --release-fast --single-threaded --strip -mcpu skylake adler32.zig
	zig build-exe --release-fast --single-threaded --strip -mcpu skylake millerrabin.zig

run:
	make build
	sed 's/^/zig/' <(/usr/bin/time -f "%E" ./rc4 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/zig/' <(/usr/bin/time -f "%E" ./adler32 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/zig/' <(/usr/bin/time -f "%E" ./millerrabin 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
