SHELL := /bin/bash

build:
	go build -o rc4_go rc4.go
	go build -compiler gccgo -gccgoflags '-Ofast -flto -march=native' -o rc4_gcc rc4.go

	go build -o adler32_go adler32.go
	go build -compiler gccgo -gccgoflags '-Ofast -flto -march=native' -o adler32_gcc adler32.go

run:
	make build
	sed 's/^/go/' <(/usr/bin/time -f "%E" ./rc4_go 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/gccgo/' <(/usr/bin/time -f "%E"  ./rc4_gcc 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/go/' <(/usr/bin/time -f "%E" ./adler32_go 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/gccgo/' <(/usr/bin/time -f "%E"  ./adler32_gcc 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""

