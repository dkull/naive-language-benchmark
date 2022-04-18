SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32 millerrabin

.PHONY: build run all

$(EXECS): %: %.d
	ldc2 -release \
		-Oz \
		-mcpu=native \
		-boundscheck=off $ \
		$< -of $@
		#-flto=full \

	#dmd -O \
	#	-release \
	#	-mcpu=native \
	#	-boundscheck=off $ \
	#	$<

all: $(EXECS)

clean:
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/ldc2/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

