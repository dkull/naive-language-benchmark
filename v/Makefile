SHELL := /bin/bash

build:
	v -prod -cflags -flto -O3 -march=skylake main.v

run:
	make build
	sed 's/^/v/' <(/usr/bin/time -p ./main 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
