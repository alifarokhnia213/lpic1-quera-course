# Practice 1 - CPU Investigation

## Goal

The purpose of this exercise is to learn how differently and in which ways Linux provides information about the CPU.

By the end of this practice, I should be able to:

1- Understand in which ways i can get info about CPU.

2- Identify the CPU installed on my laptop.

3- See its architecture, cores and threads

4- compare the ways i can get info about cpu and determine which way is appropriate in different situations.

This is more an investigation rather than just entering commands. i try my best to understand and explain the information i see meanwhile.

**The main question:** What processor is installed on this system and how linux tells me about it?

# Table of contents:

- [The goal of the exercise](#goal)
---
- [lscpu](#lscpu)
  - [Recieved Information](#what-information-i-got-and-understood)
  - [Logical cpu formula](#a-useful-fomula-to-calculate-the-number-of-logical-cpu-cores)
---
- [/proc/cpuinfo](#proc-cpuinfo)
---
- [Difference between cpuinfo and lscpu](#difference-between-lscpu-and-cpuinfo 
)

# lscpu

```bash
➜  ~ lscpu
Architecture:                x86_64
  CPU op-mode(s):            32-bit, 64-bit
  Address sizes:             39 bits physical, 48 bits virtual
  Byte Order:                Little Endian
CPU(s):                      4
  On-line CPU(s) list:       0-3
Vendor ID:                   GenuineIntel
  Model name:                Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz
    CPU family:              6
    Model:                   142
    Thread(s) per core:      2
    Core(s) per socket:      2
    Socket(s):               1
    Stepping:                9
    CPU(s) scaling MHz:      31%
    CPU max MHz:             2600.0000
    CPU min MHz:             400.0000
    BogoMIPS:                5399.81
    Flags:                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pg
                             e mca cmov pat pse36 clflush dts acpi mmx fxsr sse 
                             sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm cons
                             tant_tsc art arch_perfmon pebs bts rep_good nopl xt
                             opology nonstop_tsc cpuid aperfmperf pni pclmulqdq 
                             dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fm
                             a cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe po
                             pcnt tsc_deadline_timer aes xsave avx f16c rdrand l
                             ahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd i
                             brs ibpb stibp tpr_shadow flexpriority ept vpid ept
                             _ad fsgsbase tsc_adjust sgx bmi1 avx2 smep bmi2 erm
                             s invpcid mpx rdseed adx smap clflushopt intel_pt x
                             saveopt xsavec xgetbv1 xsaves dtherm ida arat pln p
                             ts hwp hwp_notify hwp_act_window hwp_epp vnmi md_cl
                             ear flush_l1d arch_capabilities
Virtualization features:     
  Virtualization:            VT-x
Caches (sum of all):         
  L1d:                       64 KiB (2 instances)
  L1i:                       64 KiB (2 instances)
  L2:                        512 KiB (2 instances)
  L3:                        3 MiB (1 instance)
NUMA:                        
  NUMA node(s):              1
  NUMA node0 CPU(s):         0-3
Vulnerabilities:             
  Gather data sampling:      Vulnerable
  Ghostwrite:                Not affected
  Indirect target selection: Not affected
  Itlb multihit:             KVM: Mitigation: Split huge pages
  L1tf:                      Mitigation; PTE Inversion; VMX conditional cache fl
                             ushes, SMT vulnerable
  Mds:                       Mitigation; Clear CPU buffers; SMT vulnerable
  Meltdown:                  Mitigation; PTI
  Mmio stale data:           Mitigation; Clear CPU buffers; SMT vulnerable
  Reg file data sampling:    Not affected
  Retbleed:                  Mitigation; IBRS
  Spec rstack overflow:      Not affected
  Spec store bypass:         Mitigation; Speculative Store Bypass disabled via p
                             rctl
  Spectre v1:                Mitigation; usercopy/swapgs barriers and __user poi
                             nter sanitization
  Spectre v2:                Mitigation; IBRS; IBPB conditional; STIBP condition
                             al; RSB filling; PBRSB-eIBRS Not affected; BHI Not 
                             affected
  Srbds:                     Mitigation; Microcode
  Tsa:                       Not affected
  Tsx async abort:           Mitigation; TSX disabled
  Vmscape:                   Mitigation; IBPB before exit to userspace
```
### What information i got and understood?
- Architecture: X86_64. means a 64bit X86 cpu.
- CPU operating modes: 32bits & 64bits. CPU can run both 32bits and 64bits programs.
- CPU(s): 4. Number of Central Processing Units.
- Vendor ID: GenuineIntel. CPU manufacturer.
- Model: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz. Human readable CPU model.
- Threads per core: 2. SMT or HyperThreading; each core can run two hardware threads at once.
- Core(s) per socket: 2. physical cores (2) per each socket.
- Socket(s): 1. number of phisycal packages(1).
- CPU min/max MHz: 0.4 GHz - 2.6 GHz. Cpu Clock; or how many cycles can a CPU execute in a second.
- Virtualization: VT-x. means the cpu supports intel hardware virtualization.
- L1, L2, L3: cache. there are three cache levels.
- Flags ( useful to know about ):
  - vmx -> Intel VT-x virtualization.
  - lm -> 64bit mode or long mode.
  - ht -> Hardware-Threading.
  - nx -> No-Execute protection.

### A useful fomula to calculate the number of logical cpu cores:

```bash
Sockets x Cores per Socket x Threads per core = Logical CPU

# in my case

1 x 2 x 2 = 4
```

# Proc-cpuinfo

```bash
➜  2-check_cpu_info git:(101.1) ✗ cat /proc/cpuinfo 
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz
stepping	: 9
microcode	: 0xf6
cpu MHz		: 799.997
cache size	: 3072 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust sgx bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs pml ept_violation_ve ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed gds vmscape
bogomips	: 5399.81
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz
stepping	: 9
microcode	: 0xf6
cpu MHz		: 800.011
cache size	: 3072 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 2
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust sgx bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs pml ept_violation_ve ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed gds vmscape
bogomips	: 5399.81
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz
stepping	: 9
microcode	: 0xf6
cpu MHz		: 799.983
cache size	: 3072 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 2
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust sgx bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs pml ept_violation_ve ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed gds vmscape
bogomips	: 5399.81
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz
stepping	: 9
microcode	: 0xf6
cpu MHz		: 800.011
cache size	: 3072 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 2
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust sgx bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs pml ept_violation_ve ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed gds vmscape
bogomips	: 5399.81
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:
```
**Now we can see how kernel thinks about CPU**

1- There are 4 identical blocks, each one a processor section:

```bash
processor	: 0
# ...
processor	: 1
# ...
processor	: 2
# ...
processor	: 3
# ...
```

2- gives one entry per **Logical CPU**, not per physical core.

3- there are 1 physical id per each logical cpu and all 4 values are 0 ( `physical id : 0` ) , which means all four logical CPUs belongs to same CPU package or socket.

4- take a look at `core id`:

```bash
processor	: 0
core id		: 0

processor	: 1
core id		: 1

processor   : 2
core id		: 0

processor   : 3
core id		: 1
```

**As** you can see that each both of processors has been assigned to either core0 or core1. this is the same Hyper-Threading we saw when observing `lscpu`.

5- `siblings : 4` in this context means that the socket contains 4 logical CPUs.
6- `cpu cores : 2` means the physical cpu package contains 2 physical cores.
7- `cpu MHz : 799.997` should be 2600, but it doesn't mean it is weak or ... it is just idling and in modern CPUs it is usual for power saving


### The Difference

`lscpu`: gave us these values:
```bash
2 cores
4 threads
1 socket
```
*lscpu* is **Easy** to read. cpuinfo does'nt summerize anything. instead it describes the cpu like:
```
cpu0 ...
cpu1 ...
cpu2 ...
cpu3 ...
```
And that's why it is longer than lscpu to be read.

### Question:
Why does /proc/cpuinfo have four processor entries when the laptop only has a dual-core CPU?
    `/proc/cpuinfo` contains one section for each logical CPU detected by the Linux kernel. My Intel Core i5-7300U has 2 physical cores, and it supports Intel Hyper-Threading, which allows each physical core to expose 2 logical CPUs to the operating system. As a result, Linux detects 4 logical CPUs, so /proc/cpuinfo contains four processor sections. 

### What I learned until now?
If you have 4 cpu cores it doesn't mean there is 4 physical cpu cores on your motherboard. and technologies like HyperThreading by intel allows physical cores to expose two logical CPUs to the operating system.

# Difference Between lscpu and cpuinfo 
Using `lscpu` we can see a summerized and compact information about our cpu, but when structure and detailed informations is needed, /proc/cpuinfo is a better choice.
