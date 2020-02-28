
struct RC4 {
    s []byte
    mut:
        i u32
        j u32
}

fn new_rc4(key string) RC4 {
    mut data := [0].repeat(256)

    for i, _ in data {
        data[i] = i
    }

    mut j := 0
    for i, _ in data {
        j = (j + data[i] + key[i % key.len]) % 256
        a := data[i]
        b := data[j]
        data[i] = b
        data[j] = a
    }

    return RC4 {
        s: data
        i: 0
        j: 0
    }
}

fn (rc4 mut RC4) get_byte() byte {
    rc4.i = (rc4.i + 1) % 256
    rc4.j = (rc4.j + rc4.s[rc4.i]) % 256

    a := rc4.s[rc4.i]
    b := rc4.s[rc4.j]
    rc4.s[rc4.i] = b
    rc4.s[rc4.j] = a

    idx := u32((rc4.s[rc4.i] + rc4.s[rc4.j])) % 256
    return rc4.s[idx]
}

fn bench() {
    key := r'Keyfobsrulethebestofall'
    mut rc4 := new_rc4(key)

    mut sum := u64(0)
    for i := 0; i < 250000000; i++ {
        sum += u64(rc4.get_byte())

    }
    println("|v|rc4|" + sum.str() + "||")
}

fn main() {
    bench()
}
