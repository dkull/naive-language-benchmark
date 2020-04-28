# naive-language-benchmark

Comparing naive implementations in compiled languages. These tests are mostly for seeing the optimization capabilities of the compilers behind the language.

All the benchmarks are written by me in good faith. I am most proficient in Rust. The others are written based on official language docs.
The first language gets an original implementation(might be based on RosettaCode, Wikipedia, etc.) and the following implementations
are based on that implementation as closely as possible. Getting a benchmark to work in the following languages is mostly just satisfying 
the compiler (type) errors, no other language specific optimizations are done.

Pull requests are welcome to point out blatantly slow aspects(eg. "that type of cast is slow in language X", "that compiler option makes it slow/fast"). Minor improvements
are not the point, any speedup due to a compiler flag or tweaking something obvious/simple should provide a noticeable speed improvement. 
All languages have to use a static set of compiler flags specific for that language - no benchmark specific flags.
Any change should be "trivial" (obious to a newbie to the language).

Compiler flags are chosen naively on the basis of "optimize everything - simply!", they are not A/B tested extensively. They are mostly found by some searching and from man pages.

Required software in $PATH: rustc ; v ; zig ; gccgo ; gcc ; go ; screenfetch (optional for README.md)

Run for just the benchmark tables:
```
make -s benchmark_table
```

Run to generate this README.md:
```
make -s readme
```

```
gcc    c     adler32      c8be4a0c     N/A   0:00.59
gcc    v     adler32      c8be4a0c     N/A   0:00.59
rustc  rust  adler32      c8be4a0c     N/A   0:00.70
zig    zig   adler32      c8be4a0c     N/A   0:00.84
gcc    go    adler32      c8be4a0c     N/A   0:00.85
go     go    adler32      c8be4a0c     N/A   0:00.85

gcc    go    millerrabin  183065       N/A   0:00.74
gcc    v     millerrabin  183065       N/A   0:00.76
zig    zig   millerrabin  183065       N/A   0:00.76
go     go    millerrabin  183065       N/A   0:00.80
rustc  rust  millerrabin  183065       N/A   0:00.80

rustc  rust  rc4          31875526832  421   0:00.42
gcc    v     rc4          31875526832  475   0:00.47
gcc    c     rc4          31875526832  503   0:00.50
zig    zig   rc4          31875526832  528   0:00.52
gcc    go    rc4          31875526832  584   0:00.59
go     go    rc4          31875526832  1147  0:01.14
```
```
rustc 1.44.0-nightly (94d346360 2020-04-09)
gcc (Ubuntu 10-20200416-0ubuntu1~18.04) 10.0.1 20200416 (experimental) [master revision 3c3f12e2a76:dcee354ce56:44b326839d864fc10c459916abcc97f35a9ac3de]
zig 0.6.0
go version go1.14 linux/amd64
gccgo (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0
V 0.1.26 50a8373.0dc7a57
```
Benchmarks are run on:
```
 OS: Mint 19.3 tricia
 Kernel: x86_64 Linux 5.3.0-46-generic
 CPU: Intel Core i7-6700K @ 8x 4.2GHz
 RAM: 12301MiB / 32054MiB
 Mitigated CPU bugs:  cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit
```
