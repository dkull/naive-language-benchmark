SHELL := /bin/bash

build:
	go build -o main_go main.go
	go build -compiler gccgo -gccgoflags '-Ofast -flto -march=native' -o main_gcc main.go

run:
	make build
	sed 's/^/go/' <(/usr/bin/time -f "%E" ./main_go 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/gccgo/' <(/usr/bin/time -f "%E"  ./main_gcc 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""

