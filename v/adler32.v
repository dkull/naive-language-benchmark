fn main() {
    mod_adler := u32(65521)
    mut a := u32(1)
    mut b := u32(0)
    for i := u32(0); i < 250000000; i++ {
        a = (a + i) % mod_adler
        b = (b + a) % mod_adler
    }
    result := b * 65536 + a
    println("|v|adler32|" + result.hex() + "|N/A|")
}
