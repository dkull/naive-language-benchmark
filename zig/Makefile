SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32 millerrabin

.PHONY: build run all

$(EXECS): %: %.zig
	zig build-exe -O ReleaseFast --single-threaded --strip -mcpu native $<

all: $(EXECS)

clean:
	rm -rf zig-cache || true
	rm ./*.o || true
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/zig/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

