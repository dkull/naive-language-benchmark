SHELL := /bin/bash

build:
	gcc -fomit-frame-pointer -Ofast -mtune=skylake -march=native main.c -o main

run:
	make build
	sed 's/^/gcc/' <(/usr/bin/time -f "%E" ./main 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
