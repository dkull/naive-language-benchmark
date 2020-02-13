SHELL := /bin/bash

build:
	make -s -C rust run
	make -s -C c run
	make -s -C zig run 
	make -s -C go run
	make -s -C v run

table:
	make build | grep -v make | sort -t "|" -k 6 |column -s "|" -t -n
