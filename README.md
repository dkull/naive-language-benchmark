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

Required software in $PATH: rustc ; v ; zig ; gccgo ; gcc ; go ; screenfetch (optional)

Run for just the benchmark tables:
```
make -s benchmark_table
```

Run to generate the contents of this README.md file:
```
make -s readme
```

```
zig    zig   adler32      c8be4a0c     887            0:00.88 
v      v     adler32      0xc8be4a0c                  0:00.92 
rustc  rust  adler32      c8be4a0c     N/A            0:00.93 
go     go    adler32      c8be4a0c     N/A            0:00.97 
gcc    c     adler32      c8be4a0c     N/A            0:00.99 
gccgo  go    adler32      c8be4a0c     N/A            0:01.02 

zig    zig   millerrabin  183065       N/A            0:00.93 
rustc  rust  millerrabin  183065       n/a            0:01.05 

rustc  rust  rc4          31875526832  492            0:00.49 
gcc    c     rc4          31875526832                 0:00.55 
gccgo  go    rc4          31875526832  666.719704ms   0:00.67 
zig    zig   rc4          31875526832  683            0:00.68 
go     go    rc4          31875526832  1.588962454s   0:01.59 
v      v     rc4          31875526832                 0:01.91 
```
```
rustc 1.43.0-nightly (5e7af4669 2020-02-16)
gcc (Ubuntu 8.3.0-6ubuntu1~18.04.1) 8.3.0
zig 0.5.0+a55e53639
go version go1.14 linux/amd64
gccgo (Ubuntu 8.3.0-6ubuntu1~18.04.1) 8.3.0
V 0.1.25 bc3d1ea
```
Benchmarks are run on:
```
 OS: Mint 19.3 tricia
 Kernel: x86_64 Linux 5.3.0-40-generic
 CPU: Intel Core i7-6700K @ 8x 4.2GHz
 GPU: GeForce GTX 1080 Ti, GeForce GTX 1080 Ti
 RAM: 7188MiB / 32055MiB
 Mitigated CPU bugs:  cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit
```
