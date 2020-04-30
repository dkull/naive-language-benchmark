SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4 adler32 # millerrabin

.PHONY: build run all

$(EXECS): %: %.c
	# -flto - slower
	# -fomit-frame-pointer - slower
	# -funroll-loops - slower
	$(CC) -Ofast \
		-march=native \
		-flto \
		$< -o $@

all: $(EXECS)

clean:
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/$(CC)/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

