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
gcc    v     adler32      c8be4a0c     N/A   0:00.59
nim    nim   adler32      C8BE4A0C     N/A   0:00.63
ldc2   d     adler32      c8be4a0c     N/A   0:00.65
rustc  rust  adler32      c8be4a0c     N/A   0:00.71
zig    zig   adler32      c8be4a0c     N/A   0:00.81
gcc    go    adler32      c8be4a0c     N/A   0:00.85
go     go    adler32      c8be4a0c     N/A   0:00.85

gcc    go    millerrabin  183065       N/A   0:00.74
gcc    v     millerrabin  183065       N/A   0:00.75
ldc2   d     millerrabin  183065       N/A   0:00.76
zig    zig   millerrabin  183065       N/A   0:00.76
go     go    millerrabin  183065       N/A   0:00.79
rustc  rust  millerrabin  183065       N/A   0:00.81

nim    nim   rc4          31875526832  N/A   0:00.41
rustc  rust  rc4          31875526832  444   0:00.44
pony   pony  rc4          24925075021  449   0:00.45
gcc    v     rc4          31875526832  476   0:00.47
gcc    c     rc4          31875526832  493   0:00.49
zig    zig   rc4          31875526832  526   0:00.52
ldc2   d     rc4          31875526832  N/A   0:00.56
gcc    go    rc4          31875526832  593   0:00.60
go     go    rc4          31875526832  1155  0:01.15
```
```
rustc 1.50.0-nightly (0f6f2d681 2020-12-06)
gcc (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0
zig 0.7.1
go version go1.15.6 linux/amd64
gccgo (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0
V 0.1.29 99e607d
LDC - the LLVM D compiler (1.25.0-beta1):
0.38.1-c00e855b [release]
Nim Compiler Version 1.4.2 [Linux: amd64]
```
Benchmarks are run on:
```
 OS: Linuxmint 20 ulyana
 Kernel: x86_64 Linux 5.4.0-54-generic
 WM: Muffin
 WM Theme: Mint-Y-Dark-Aqua (Mint-Y-Dark)
 GTK Theme: Mint-Y [GTK3]
 Disk: 281G / 473G (63%)
 CPU: Intel Core i7-6700K @ 8x 4.2GHz [38.0°C]
 RAM: 16804MiB / 32056MiB
 Mitigated CPU bugs:  cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit srbds
```
