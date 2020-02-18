SHELL := /bin/bash

build:
	v -prod -cc gcc -cflags -flto -O3 -march=skylake main.v

run:
	make build
	sed 's/^/v/' <(/usr/bin/time -f "%E" ./main 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
