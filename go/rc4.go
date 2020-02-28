package main

import (
	"fmt"
	"time"
)

type RC4 struct {
	s [256]byte
	i int
	j int
}

func (rc4 *RC4) getByte() byte {
	rc4.i = (rc4.i + 1) % 256
	rc4.j = (rc4.j + int(rc4.s[rc4.i])) % 256

	a := rc4.s[rc4.i]
	b := rc4.s[rc4.j]
	rc4.s[rc4.i] = b
	rc4.s[rc4.j] = a

	idx := (int(rc4.s[rc4.i]) + int(rc4.s[rc4.j])) % 256
	return rc4.s[idx]
}

func newRc4(key []byte) RC4 {
	data := new([256]byte)

	for i := 0; i < 256; i++ {
		data[i] = byte(i)
	}

	j := 0
	for i := 0; i < 256; i++ {
		j = (j + int(data[i]) + int(key[i%len(key)])) % 256
		a := data[i]
		b := data[j]
		data[i] = b
		data[j] = a
	}

	rc4 := RC4{
		*data,
		0, 0,
	}
	return rc4
}

func bench() {
	start := time.Now()

	key := []byte("Keyfobsrulethebestofall")
	rc4 := newRc4(key)

	sum := uint64(0)
	for i := 0; i < 250000000; i++ {
		sum += uint64(rc4.getByte())
	}

	// gccgo does not suport Milliseconds()
	delta := int(time.Since(start).Nanoseconds() / 1000000)
	fmt.Printf("|go|rc4|%d|%+v|\n", sum, delta)
}

func main() {
	bench()
}
