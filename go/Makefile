SHELL := /bin/bash

build:
	go build -o main_go main.go
	gccgo -Ofast -flto -march=native -o main_gcc main.go

run:
	make build
	sed 's/^/go/' <(/usr/bin/time -p ./main_go 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/gccgo/' <(/usr/bin/time -p ./main_gcc 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""

