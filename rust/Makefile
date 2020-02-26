SHELL := /bin/bash

build:
	rustc -A dead_code -C opt-level=3 -C lto -C target-cpu=skylake rc4.rs
	rustc -A dead_code -C opt-level=3 -C lto -C target-cpu=skylake adler32.rs
	#rustc -A dead_code --crate-type=dylib -C opt-level=3 -C target-cpu=skylake main.rs

run:
	make build
	sed 's/^/rustc/' <(/usr/bin/time -f "%E" ./rc4 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
	sed 's/^/rustc/' <(/usr/bin/time -f "%E" ./adler32 2>&1 | head -n 2 | tr '\n' ' ')
	echo ""
