SHELL := /bin/bash

build:
	v -prod -cc gcc -cflags -flto -O3 -march=skylake rc4.v
	v -prod -cc gcc -cflags -flto -O3 -march=skylake adler32.v

run:
	make build
	sed 's/^/v/' <(/usr/bin/time -f "%E" ./rc4 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/v/' <(/usr/bin/time -f "%E" ./adler32 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
