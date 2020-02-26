SHELL := /bin/bash

build:
	gcc -fomit-frame-pointer -Ofast -mtune=skylake -march=native rc4.c -o rc4
	gcc -fomit-frame-pointer -Ofast -mtune=skylake -march=native adler32.c -o adler32

run:
	make build
	sed 's/^/gcc/' <(/usr/bin/time -f "%E" ./rc4 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/gcc/' <(/usr/bin/time -f "%E" ./adler32 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
