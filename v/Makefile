SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32 millerrabin

.PHONY: build run all

$(EXECS): %: %.v 
	v -prod -cc gcc \
		-cflags -Ofast \
		-cflags -flto \
		-cflags -march=skylake \
		-cflags -fomit-frame-pointer \
		$<

all: $(EXECS)

clean:
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/gcc/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

