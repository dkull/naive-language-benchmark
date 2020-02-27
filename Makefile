SHELL := /bin/bash

build:
	#echo "comp|lang|bench|result|stdout|00time"
	make -s -C rust run
	make -s -C c run
	make -s -C zig run 
	make -s -C go run
	make -s -C v run

table:
	echo '```'
	make -s build | sort -t "|" -k3,3 -k6,6 | awk -F'|' 'BEGIN {A=""} { if ($$3!=A && A!="") {print ""}; A=$$3; print $$0 }' | column -e -s "|" -t -n
	echo '```'

	echo '```'
	rustc --version
	gcc --version | head -n 1
	echo -n "zig " && zig version
	go version
	gccgo --version | head -n 1
	v version
	echo '```'

test:
	echo -n "zig " && zig version
