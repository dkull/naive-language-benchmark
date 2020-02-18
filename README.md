# naive-language-benchmark
Comparing naive implementations in compiled languages

```
rustc  rust  rc4  127500317644  1825           0:01.82 
gcc    c     rc4  127500317644                 0:01.98 
zig    zig   rc4  127500317644  2723           0:02.72 
gccgo  go    rc4  127500317644  2.775598967s   0:02.79 
go     go    rc4  127500317644  6.412793681s   0:06.41 
v      v     rc4  127500317644                 0:07.63 
```
```
rustc 1.43.0-nightly (5e7af4669 2020-02-16)
gcc-8 (Ubuntu 8.3.0-6ubuntu1~18.04.1) 8.3.0
zig 0.5.0+652efe38b
go version go1.14rc1 linux/amd64
gccgo (Ubuntu 8.3.0-6ubuntu1~18.04.1) 8.3.0
V 0.1.25 2ea2fed
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
