# naive-language-benchmark

Comparing naive implementations in compiled languages. The goal is to compare the optimization capabilities of the compilers behind the languages.

All the benchmarks are written by me in good faith. I don't use any of these languages daily, though I have written something non-trivial in each of them at some point in time.
A new benchmark starts out as an implementation in one language. The following languages will try to mimic the structure of the original one as closely as possible. Getting the follow-up languages to run is mostly just satisfying the compiler errors and playing around with casts/types. Some testing of different integer types is done for performance.

Each language will get a custom set of compiler flags - no benchmark specific flags. Flags described in the compilers '--help' are priority and acceptable.

Compiler flags are chosen on the basis of "optimize everything - simply!". Usually something like '-release -Ofast -flto -march=native -boundscheck=off' is used. Some A/B testing is done when choosing the subset.

Required software in $PATH: rustc ; v ; zig ; gccgo ; gcc ; go ; dmd; screenfetch (optional for README.md)

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
gcc    v     adler32      c8be4a0c     N/A   0:00.60
nim    nim   adler32      C8BE4A0C     N/A   0:00.63
ldc2   d     adler32      c8be4a0c     N/A   0:00.65
rustc  rust  adler32      c8be4a0c     N/A   0:00.70
zig    zig   adler32      c8be4a0c     N/A   0:00.81
go     go    adler32      c8be4a0c     N/A   0:00.84
gcc    go    adler32      c8be4a0c     N/A   0:00.85

gcc    v     millerrabin  183065       N/A   0:00.73
gcc    go    millerrabin  183065       N/A   0:00.74
ldc2   d     millerrabin  183065       N/A   0:00.76
zig    zig   millerrabin  183065       N/A   0:00.76
go     go    millerrabin  183065       N/A   0:00.79
rustc  rust  millerrabin  183065       N/A   0:00.79

nim    nim   rc4          31875526832  N/A   0:00.41
pony   pony  rc4          23977191635  449   0:00.45
rustc  rust  rc4          31875526832  458   0:00.46
gcc    c     rc4          31875526832  487   0:00.48
gcc    v     rc4          31875526832  492   0:00.49
zig    zig   rc4          31875526832  524   0:00.52
ldc2   d     rc4          31875526832  N/A   0:00.56
gcc    go    rc4          31875526832  591   0:00.60
go     go    rc4          31875526832  1148  0:01.15
```
```
rustc 1.52.0-nightly (07194ffcd 2021-02-10)
gcc (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0
zig 0.7.1
go version go1.15.6 linux/amd64
gccgo (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0
V 0.1.29 99e607d
LDC - the LLVM D compiler (1.25.0-beta1):
ponyc: 0.38.1-c00e855b [release]
Nim Compiler Version 1.4.2 [Linux: amd64]
```
Benchmarks are run on:
```
[0m[1;32m OS:[0m Linuxmint 20 ulyana
[0m[1;32m Kernel:[0m x86_64 Linux 5.4.0-54-generic
[0m[1;32m Shell:[0m bash 5.0.17
[0m[1;32m CPU:[0m Intel Core i7-6700K @ 8x 4.2GHz [35.0°C]
[0m[1;32m RAM:[0m 16644MiB / 32056MiB
 Mitigated CPU bugs:  cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit srbds
```
