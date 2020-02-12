
build:
	rustc -A dead_code -C opt-level=3 -C lto -C target-cpu=skylake main.rs
	rustc -A dead_code --crate-type=dylib -C opt-level=3 -C target-cpu=skylake main.rs

run:
	make build
	#./main
	bash -c "/usr/bin/time -p ./main 2>&1 | head -n 2 | tr '\n' ' '"
	echo ""
