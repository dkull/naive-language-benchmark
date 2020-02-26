fn main() {
    mod_adler := 65521
    mut a := 1
    mut b := 0
    for i := 0; i < 250000000; i++ {
        a = (a + i) % mod_adler
        b = (b + a) % mod_adler
    }
    result := b << 16 | a
    println("|v|adler32|" + result.hex() + "||")
}
