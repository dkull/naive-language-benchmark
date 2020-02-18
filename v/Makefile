SHELL := /bin/bash

build:
	# gcc-8 was best out of gcc-6..9
	# clang-7 was junk, didn't test others
	v -prod -cc gcc-8 -cflags -flto -O3 -march=skylake main.v

run:
	make build
	sed 's/^/v/' <(/usr/bin/time -f "%E" ./main 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
