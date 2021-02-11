SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32
RUNNABLES = rc4_gcc rc4_clang adler32_gcc adler32_clang

.PHONY: build run all

$(EXECS): %: %.nim
	nim c -d:release --opt:speed --passC:-march=native --cc:gcc -o:$@_gcc $< > /dev/null
	nim c -d:release --opt:speed --passC:-march=native --cc:clang -o:$@_clang $< > /dev/null

all: $(EXECS)

clean:
	rm $(EXECS) || true
	rm $(RUNNABLES) || true

run: $(EXECS)
	for exec in $(RUNNABLES); do \
		export COMPILER=`echo $$exec | cut -d '_' -f 2-`; \
		sed "s/^/$$COMPILER/" <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

