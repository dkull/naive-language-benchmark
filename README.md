# naive-language-benchmark

Compare optimization capabilities of different compilers.

All the implementations will try to be as similarly naive as possible across all languages. Some testing of different integer types, etc. is done for performance.

Usually something like '-release -Ofast -flto -march=native' is used. Some A/B testing is done when choosing the subset.

Build system uses tup (https://gittup.org/tup/index.html)

Required compilers in $PATH:
```
	gcc
	clang
	dart
	rustc
	go
	gccgo
	nim
	zig
	ldc2
	v
```
And 'screenfetch' (optional for README.md)

Run to generate this README.md:

```
tup -j1
```

```

clang  nim   adler32      C8BE4A0C     594   0:00.59
gcc    c     adler32      c8be4a0c     N/A   0:00.60
gcc    nim   adler32      C8BE4A0C     632   0:00.63
gcc    v     adler32      c8be4a0c     N/A   0:00.65
clang  v     adler32      c8be4a0c     N/A   0:00.71
rustc  rust  adler32      c8be4a0c     N/A   0:00.71
       zig   adler32      c8be4a0c     N/A   0:00.81
clang  d     adler32      c8be4a0c     N/A   0:00.83
gcc    d     adler32      c8be4a0c     N/A   0:00.84
go     go    adler32      c8be4a0c     N/A   0:00.84
gccgo  go    adler32      c8be4a0c     N/A   0:00.85
       dart  adler32      c8be4a0c     N/A   0:00.91
clang  c     adler32      c8be4a0c     N/A   0:01.04

gcc    nim   millerrabin  183065       732   0:00.73
gcc    v     millerrabin  183065       N/A   0:00.73
clang  v     millerrabin  183065       N/A   0:00.76
gccgo  go    millerrabin  183065       N/A   0:00.76
gcc    d     millerrabin  183065       N/A   0:00.76
clang  d     millerrabin  183065       N/A   0:00.77
clang  nim   millerrabin  183065       769   0:00.77
go     go    millerrabin  183065       N/A   0:00.78
       zig   millerrabin  183065       N/A   0:00.78
rustc  rust  millerrabin  183065       N/A   0:00.80
       dart  millerrabin  183065       1000  0:01.00

gcc    nim   rc4          31875526832  429   0:00.42
clang  v     rc4          31875526832  465   0:00.46
gcc    v     rc4          31875526832  474   0:00.47
rustc  rust  rc4          31875526832  484   0:00.48
gcc    c     rc4          31875526832  501   0:00.50
       zig   rc4          31875526832  526   0:00.52
clang  d     rc4          31875526832  N/A   0:00.56
gcc    d     rc4          31875526832  N/A   0:00.57
gccgo  go    rc4          31875526832  600   0:00.61
clang  c     rc4          31875526832  724   0:00.72
clang  nim   rc4          31875526832  842   0:00.84
go     go    rc4          31875526832  1016  0:01.01
       dart  rc4          31875526832  1724  0:01.73
```
