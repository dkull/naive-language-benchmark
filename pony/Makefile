SHELL := /bin/bash

# !!! Update this when adding new
EXECS = rc4

.PHONY: build run all

$(EXECS): %: %.pony
	ponyc -s -b $@ -p $<

all: $(EXECS)

clean:
	rm ./*.o
	rm $(EXECS)

run: $(EXECS)
	for exec in $(EXECS); do \
		sed 's/^/pony/' <(/usr/bin/time -f "$(TIME_FORMAT)" ./$$exec 2>&1 | head -n2 | tr '\n' ' ' | tr -d ' '); \
		echo ""; \
	done

