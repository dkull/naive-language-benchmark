# naive-language-benchmark
Comparing naive implementations in compiled languages

```
rustc  rust  rc4  127500317644  1828           real 1.82 
gcc    c     rc4  127500317644                 real 1.97 
gccgo  go    rc4  127500317644  2.728340626s   real 2.81 
zig    zig   rc4  127500317644  2936           real 2.93 
go     go    rc4  127500317644  6.133581484s   real 6.13 
v      v     rc4  127500317644                 real 8.21 
```
```
rustc 1.43.0-nightly (58b834344 2020-02-05)
gcc (Ubuntu 6.5.0-2ubuntu1~18.04) 6.5.0 20181026
zig 0.5.0+ab4ea5d3c
go version go1.13.5 linux/amd64
gccgo (Ubuntu 8.3.0-6ubuntu1~18.04.1) 8.3.0
V 0.1.25 0ec5680
```
