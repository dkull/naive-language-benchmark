SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32 millerrabin
RUNNABLES = rc4_go rc4_gcc adler32_go adler32_gcc millerrabin_go millerrabin_gcc

.PHONY: build run all

$(EXECS): %: %.go
	go build -o $@_go $<
	go build -compiler gccgo -gccgoflags '-Ofast -flto -march=skylake -fomit-frame-pointer' -o $@_gcc $<

all: $(EXECS)

clean:
	rm $(RUNNABLES)

run: $(EXECS)
	for exec in $(RUNNABLES); do \
		export COMPILER=`echo $$exec | cut -d '_' -f 2-`; \
		sed "s/^/$$COMPILER/" <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo; \
	done

