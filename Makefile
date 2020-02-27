SHELL := /bin/bash

build:
	#echo "comp|lang|bench|result|stdout|00time"
	make -s -C rust run
	make -s -C c run
	make -s -C zig run 
	make -s -C go run
	make -s -C v run

benchmark_table:
	echo '```'
	make -s build | sort -t "|" -k3,3 -k6,6 | awk -F'|' 'BEGIN {A=""} { if ($$3!=A && A!="") {print ""}; A=$$3; print $$0 }' | column -e -s "|" -t -n
	echo '```'

compiler_version_table:
	echo '```'
	rustc --version
	gcc --version | head -n 1
	echo -n "zig " && zig version
	go version
	gccgo --version | head -n 1
	v version
	echo '```'

readme:
	cat README.md.header
	make benchmark_table
	make compiler_version_table
	echo "Benchmarks are run on:"
	echo '```'
	screenfetch -E -nN -d'-wm;-res;-de;-uptime;-pkgs;-shell;-host' || true
	echo " Kernel mitigated CPU bugs:"
	cat /proc/cpuinfo| grep bugs | head -n 1
	echo '```'
