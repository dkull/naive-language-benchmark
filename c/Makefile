SHELL := /bin/bash

build:
	gcc-6 -fomit-frame-pointer -Ofast -march=native main.c -o main

run:
	make build
	sed 's/^/gcc-6/' <(/usr/bin/time -p ./main 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
