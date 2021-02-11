fn powmod(_base int, _pow int, mod int) u64 {
    mut result := u64(1)
    mut base := u64(_base) // gets squared
    mut pow := _pow
    for pow > 0 {
        if pow & 1 == 1 {
            result = (u64(result) * base) % u64(mod)
        }
        base = (base * base) % u64(mod)
        pow >>= 1
    }
    return result
}

fn witness(n int, _s int, d int, a int) bool {
    mut x := powmod(a, d, n)
    mut y := u64(0) //is squaring of x[u64]

    mut s := _s
    for s > 0 {
        // powmod
        y = (x * x) % u64(n)
        if y == 1 && x != 1 && x != n - 1 {
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

fn is_rabin_miller_prime(n int, witnesses []int) bool {
    mut d := n / 2
    mut s := 1

    for d & 1 != 1 {
        d /= 2
        s++
    }

    for _, row in witnesses {
        if !witness(n, s, d, row) {
            return false
        }
    }

    return true
}

fn main() {
    witnesses := [2, 3, 5, 7, 11, 13, 17]
    mut prime_count := 0
    for i := int(3); i < 2500000; i++ {
        if is_rabin_miller_prime(i, witnesses) {
            prime_count++
        }
    }
    println("|v|millerrabin|" + prime_count.str() + "|N/A|")
}
