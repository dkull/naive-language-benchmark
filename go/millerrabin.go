package main

import "fmt"

func powmod(_base uint32, _pow uint32, _mod uint32) uint32 {
	result := uint64(1)
	base := uint64(_base)
	pow := uint64(_pow)
	mod := uint64(_mod)
	for {
		if !(pow > 0) {
			break
		}
		if pow&1 == 1 {
			result = (result * base) % mod
		}
		base = (base * base) % mod
		pow >>= 1
	}
	return uint32(result)
}

func witness(_n uint32, _s uint32, d uint32, a uint32) bool {
	x := uint64(powmod(a, d, _n))
	y := uint64(0)
	n := uint64(_n)

	s := _s
	for {
		if !(s > 0) {
			break
		}
		// powmod
		y = (x * x) % n
		if y == 1 && x != 1 && x != n-1 {
			return false
		}
		x = y
		s--
	}
	if y != 1 {
		return false
	}
	return true
}

func isMillerRabinPrime(n uint32, witnesses [7]uint32) bool {
	d := n / 2
	s := uint32(1)

	for {
		if d&1 == 1 {
			break
		}
		d /= 2
		s++
	}

	for _, row := range witnesses {
		if !witness(n, s, d, row) {
			return false
		}
	}

	return true
}

func main() {
	witnesses := [7]uint32{2, 3, 5, 7, 11, 13, 17}
	primeCount := 0
	i := uint32(3)
	for {
		if i == 2500000 {
			break
		}
		if isMillerRabinPrime(i, witnesses) {
			primeCount++
		}
		i++
	}
	fmt.Printf("|go|millerrabin|%d|N/A|\n", primeCount)
}
