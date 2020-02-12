
build:
	zig build-lib --release-fast --single-threaded --strip -dynamic main.zig
	zig build-lib --release-fast --single-threaded --strip main.zig
	zig build-exe --release-fast --single-threaded --strip -target-cpu skylake main.zig

run:
	make build
	#./main
	bash -c "/usr/bin/time -p ./main 2>&1 | head -n 2 | tr '\n' ' '"
	echo ""
