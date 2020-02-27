# naive-language-benchmark

Comparing naive implementations in compiled languages. These tests are mostly for seeing the optimization capabilities of the compilers behind the language.

All the examples are written by me in good faith. I am most proficient in Rust. The others are written based on official language docs.
The first language gets an original implementation(might be based on RosettaCode, Wikipedia, etc.) and the following implementations
are based on that implementation as closely as possible. Getting a benchmark to work in the following languages is mostly just satisfying 
the compiler (type) errors, no other language specific optimizations are done.

Pull requests are welcome to point out blatantly slow aspects(eg. "that type of cast is slow in language X", "that compiler option makes it slow/fast"). Minor improvements
are not the point, any speedup due to a compiler flag or tweaking something obvious/simple should provide a noticeable speed improvement. 
All language have to use a static set of compiler flags for that language - no benchmark specific flags.
Any change should be "trivial" (obious to a total newbie to the language).

Compiler flags are selected naively on the basis of "optimize everything!", they are not A/B tested extensively. They are mostly found by some searching and from man pages.

Run:
```
make -s table
```

```
rustc  rust  adler32      c8be4a0c     N/A            0:00.71 
zig    zig   adler32      c8be4a0c     714            0:00.71 
gccgo  go    adler32      c8be4a0c     N/A            0:00.85 
go     go    adler32      c8be4a0c     N/A            0:00.85 
v      v     adler32      0xc8be4a0c                  0:00.85 
gcc    c     adler32      c8be4a0c     N/A            0:00.93 

zig    zig   millerrabin  183065       N/A            0:00.75 
rustc  zig   millerrabin  183065       n/a            0:00.79 

gcc    c     rc4          31875526832                 0:00.38 
rustc  rust  rc4          31875526832  423            0:00.42 
zig    zig   rc4          31875526832  525            0:00.52 
gccgo  go    rc4          31875526832  586.201465ms   0:00.59 
go     go    rc4          31875526832  1.28039327s    0:01.28 
v      v     rc4          31875526832                 0:01.70 
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
vendor_id       : GenuineIntel
cpu family      : 6
model           : 94
model name      : Intel(R) Core(TM) i7-6700K CPU @ 4.00GHz
stepping        : 3
microcode       : 0xd6
cpu MHz         : 3999.999
cache size      : 8192 KB
physical id     : 0
siblings        : 8
core id         : 3
cpu cores       : 4
apicid          : 7
initial apicid  : 7
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single
pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit
bogomips        : 7999.96
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:
```
