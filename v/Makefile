
build:
	v -prod -cflags -flto -O3 -march=skylake main.v

run:
	make build
	bash -c "/usr/bin/time -p ./main 2>&1 | head -n 2 | tr '\n' ' '"
	echo ""
