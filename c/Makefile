
build:
	gcc-6 -flto -fomit-frame-pointer -Ofast -march=native main.c -o main

run:
	make build
	bash -c "/usr/bin/time -p ./main 2>&1 | head -n 2 | tr '\n' ' '"
	echo ""
