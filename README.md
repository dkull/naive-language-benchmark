# naive-language-benchmark

Comparing naive implementations in compiled languages only. The goal is to compare the optimization capabilities of the compilers behind the languages.
All the benchmarks are written by me in good faith. I don't use any of these languages daily though the amount of code I have written varies a lot.

All the implementations will try to be as similar as possible across all languages. Some testing of different integer types, etc. is done for performance.

Each language will get a custom set of compiler flags - no benchmark specific flags. Flags described in the compilers '--help' are priority and acceptable.
Usually something like '-release -Ofast -flto -march=native' is used. Some A/B testing is done when choosing the subset.

Required compilers in $PATH:
	gcc
	clang
	rustc
	go
	gccgo
	nim
	zig
	ldc2
	v
	ponyc  # currently not used
And 'screenfetch' (optional for README.md)

NOTE: Some results differ a lot if an older version of GCC/Clang is used. I am always running with latest stable of both, even if it gives worse results.
Otherwise the compiler version may be very different - some are nightlies, some are git master clones, some are stables. But I try to prefer newer usable
versions.

Run for just the benchmark tables:
```
make -s benchmark_table
```

Run to generate this README.md:
```
make -s readme
```

```
clang  nim   adler32      C8BE4A0C     594   0:00.59
gcc    c     adler32      c8be4a0c     N/A   0:00.59
gcc    v     adler32      c8be4a0c     N/A   0:00.59
gcc    nim   adler32      C8BE4A0C     633   0:00.63
ldc2   d     adler32      c8be4a0c     N/A   0:00.65
rustc  rust  adler32      c8be4a0c     N/A   0:00.70
zig    zig   adler32      c8be4a0c     N/A   0:00.81
gcc    go    adler32      c8be4a0c     N/A   0:00.85
go     go    adler32      c8be4a0c     N/A   0:00.85

gcc    v     millerrabin  183065       N/A   0:00.73
gcc    go    millerrabin  183065       N/A   0:00.74
ldc2   d     millerrabin  183065       N/A   0:00.76
zig    zig   millerrabin  183065       N/A   0:00.76
rustc  rust  millerrabin  183065       N/A   0:00.79
go     go    millerrabin  183065       N/A   0:00.80

rustc  rust  rc4          31875526832  423   0:00.42
gcc    v     rc4          31875526832  478   0:00.47
gcc    c     rc4          31875526832  486   0:00.48
gcc    nim   rc4          31875526832  527   0:00.52
zig    zig   rc4          31875526832  523   0:00.52
ldc2   d     rc4          31875526832  N/A   0:00.56
gcc    go    rc4          31875526832  591   0:00.60
clang  nim   rc4          31875526832  883   0:00.88
go     go    rc4          31875526832  1143  0:01.14
```
```
rustc 1.52.0-nightly (07194ffcd 2021-02-10)
gcc (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0
zig 0.7.1
go version go1.15.6 linux/amd64
gccgo (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0
V 0.1.29 99e607d
LDC - the LLVM D compiler (1.25.0-beta1):
Nim Compiler Version 1.4.2 [Linux: amd64]
```
Benchmarks are run on:
```
 OS: Linuxmint 20 ulyana
 Kernel: x86_64 Linux 5.4.0-54-generic
 Shell: bash 5.0.17
 CPU: Intel Core i7-6700K @ 8x 4.2GHz [36.0°C]
 RAM: 17305MiB / 32056MiB
 Mitigated CPU bugs:  cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit srbds
```
