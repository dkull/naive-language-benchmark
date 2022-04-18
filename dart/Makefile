SHELL := /bin/bash

# !!! Update this when adding new
EXECS = adler32 rc4

.PHONY: build run all

$(EXECS): %: %.dart
	dart compile exe $<

all: $(EXECS)

clean:
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/dart/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec.exe 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

