SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32 millerrabin

.PHONY: build run all

$(EXECS): %: %.rs
	rustc -A dead_code -C opt-level=3 -C lto -C target-cpu=skylake $<

all: $(EXECS)

clean:
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/rustc/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

