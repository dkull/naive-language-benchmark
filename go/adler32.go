package main

import "fmt"

func main() {
	modAdler := 65521
	a := 1
	b := 0
	for i := 0; i < 250000000; i++ {
		a = (a + i) % modAdler
		b = (b + a) % modAdler
	}
	result := b<<16 | a
	fmt.Printf("|go|adler32|%x|%s|\n", result, "N/A")
}
