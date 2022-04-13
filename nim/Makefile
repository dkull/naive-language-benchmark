SHELL := /bin/bash

# !!! Update this when adding new
BASENAMES := rc4 adler32 millerrabin
#EXECUTABLES := BASENAMES
EXECUTABLES := $(addsuffix .clang, $(BASENAMES)) $(addsuffix .gcc, $(BASENAMES))
SOURCES := $(addsuffix .nim, $(BASENAMES))

.PHONY: build run all

all: $(EXECUTABLES)

$(EXECUTABLES): $(SOURCES)
	nim c -d:release --opt:speed --passC:-march=native --cc:$(subst .,,$(suffix $@)) -o:$@ $(filter $(basename $@).%, $?)

run: $(EXECUTABLES)
	for exec in $(EXECUTABLES); do \
		export COMPILER=`echo $$exec | cut -d '.' -f 2-`; \
		export PROG_OUTPUT=`./$$exec`; \
		export BENCH_OUTPUT=`nice -20 perf stat -r 5 -B ./$$exec 2>&1 | grep "time elapsed" | tr -s " " | cut -d " " -f 2,3,10`; \
		sed "s/^/$$COMPILER/" <(echo $$PROG_OUTPUT $$BENCH_OUTPUT | tr -d '\n'); \
		echo ""; \
	done

clean:
	rm $(EXECUTABLES)

