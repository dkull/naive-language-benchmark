SHELL := /bin/bash

ifndef VERBOSE
.SILENT:
endif

export CC=gcc

build:
	#echo "comp|lang|bench|result|stdout|00time"
	make -s -C rust build
	make -s -C c build
	make -s -C zig build
	make -s -C go build
	make -s -C v build
	make -s -C d build

run:
	#echo "comp|lang|bench|result|stdout|00time"
	make -s -C rust run TIME_FORMAT="%E"
	make -s -C c run TIME_FORMAT="%E"
	make -s -C zig run TIME_FORMAT="%E"
	make -s -C go run TIME_FORMAT="%E"
	make -s -C v run TIME_FORMAT="%E"
	make -s -C d run TIME_FORMAT="%E"

benchmark_table:
	echo '```'
	make -s run | sort -t "|" -k3,3 -k6,6 | awk -F'|' 'BEGIN {A=""} { if ($$3!=A && A!="") {print ""}; A=$$3; print $$0 }' | column -e -s "|" -t -n
	echo '```'

compiler_version_table:
	echo '```'
	rustc --version
	$(CC) --version | head -n 1 || $(CC) -version
	echo -n "zig " && zig version
	go version
	gccgo --version | head -n 1
	v version
	ldc2 --version | head -n 1
	echo '```'

clean:
	make -s -C rust clean
	make -s -C c clean
	make -s -C zig clean
	make -s -C go clean
	make -s -C v clean
	make -s -C d clean

readme:
	cat README.md.header
	make benchmark_table
	make compiler_version_table
	echo "Benchmarks are run on:"
	echo '```'
	screenfetch -E -nN -d'-wm;-res;-de;-uptime;-pkgs;-shell;-host;-gpu' || true
	echo -n " Mitigated CPU bugs: "
	cat /proc/cpuinfo| grep bugs | head -n 1 | cut -d: -f 2
	echo '```'
