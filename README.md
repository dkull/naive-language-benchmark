# naive-language-benchmark

Comparing naive implementations in compiled languages. The goal is to compare the optimization capabilities of the compilers behind the languages.

All the benchmarks are written by me in good faith. I don't use any of these languages daily, though I have written something non-trivial in each of them at some point in time.
For a new test a language is subjectively chosen to get an original implementation(might be based on RosettaCode, Wikipedia, etc.). The following languages will try to mimic the structure of the original one as closely as possible. Getting a the follow-up languages to run is mostly just satisfying 
the compiler errors and playing around with casts.

All languages use a static set of compiler flags specific for that language - no benchmark specific flags.

Compiler flags are chosen on the basis of "optimize everything - simply!", some trivial A/B testing is done. Some testing of different integer types is done.

Required software in $PATH: rustc ; v ; zig ; gccgo ; gcc ; go ; ldc2 screenfetch (optional for README.md)

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
ldc2   d     adler32      c8be4a0c     N/A   0:00.71
zig    zig   adler32      c8be4a0c     N/A   0:00.84
gcc    go    adler32      c8be4a0c     N/A   0:00.85
go     go    adler32      c8be4a0c     N/A   0:00.85

gcc    v     millerrabin  183065       N/A   0:00.74
gcc    go    millerrabin  183065       N/A   0:00.76
ldc2   d     millerrabin  183065       N/A   0:00.76
zig    zig   millerrabin  183065       N/A   0:00.76
go     go    millerrabin  183065       N/A   0:00.79
rustc  rust  millerrabin  183065       N/A   0:00.79

rustc  rust  rc4          31875526832  422   0:00.42
gcc    v     rc4          31875526832  479   0:00.47
gcc    c     rc4          31875526832  508   0:00.50
zig    zig   rc4          31875526832  527   0:00.52
gcc    go    rc4          31875526832  591   0:00.60
ldc2   d     rc4          31875526832  N/A   0:00.92
go     go    rc4          31875526832  1144  0:01.14
```
```
rustc 1.45.0-nightly (a74d1862d 2020-05-14)
gcc (Ubuntu 10.1.0-2ubuntu1~18.04) 10.1.0
zig 0.6.0+01605a774
go version go1.14.2 linux/amd64
gccgo (Ubuntu 10.1.0-2ubuntu1~18.04) 10.1.0
V 0.1.27 2eac2a5
DMD64 D Compiler v2.085.0
```
Benchmarks are run on:
```
 OS: Mint 19.3 tricia
 Kernel: x86_64 Linux 5.3.0-53-generic
 CPU: Intel Core i7-6700K @ 8x 4.2GHz
 RAM: 8776MiB / 32054MiB
 Mitigated CPU bugs:  cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit
```
