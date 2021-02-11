SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32

.PHONY: build run all

$(EXECS): %: %.nim
	nim c -d:release --opt:speed --passC:-march=native $<

all: $(EXECS)

clean:
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/nim/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

