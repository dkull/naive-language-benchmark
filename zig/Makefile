
build:
	zig build-lib --release-fast --single-threaded --strip -dynamic yber.zig
	zig build-lib --release-fast --single-threaded --strip yber.zig
	zig build-exe --release-fast --single-threaded --strip yber.zig

run:
	make build
	#./yber
	bash -c "/usr/bin/time -p ./yber 2>&1 | head -n 2 | tr '\n' ' '"
	echo ""
