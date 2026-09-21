# Research: Virtualization mental model

**Goal**: What changes when linux is running as a Virtualization guest?


### Host vs Guest
**Host**: The system that provides virtualization environment.

**Guest**: The Operating System running inside the virtual machine.

Example setup:
- 1- a Debian linux running as host
- 2- a Hypervisor like VirtualBox running on the host
- 3- a Fedora running as guest Os on VirtualBox

The Guest Os doesn't normally need to know that the underlaying physical CPU, disk and network hardware belong to the host.


### What does the hypervisor actually do
The Virtualization layer creates a Virtual Hardware Environment for the guest:

- Physical Machine Containing (CPU, RAM, DISK, NIC) --> Virtualization
- Virtualization --> Virtual Hardware (vCPU, vRAM, vDISK, vNIC)
- Virtual Hardware --> Fedora Linux

This is why Fedora can have its own Kernel, Filesystem, Processes, Users, Network configuration and desktop environment though it is running inside another operating system.


### Why it is important for Linux administration?
Because the administator has to understand that some things are now virtual rather than physical.

For example inside a VM linux, `lscpu` shows CPUs available to the guest, not necessarily all physical CPUs inside the computer. similarly `lsblk` shows guest's virtual disks and `ip link` shows the guest's virtual network interfaces. 

So When administering linux as a guest you have two layers: Physical and Virtual. a Problem can therefore originate in either layer. For example:

Fedora can't access network = 1-is Fedora's network configured wrong? or 2-is the Virtual NIC configured incorrectly? or 3-is VirtualBox networking configured incorrectly? or finally is the physical host's network broken?


### VM vs Container
- A VM virtualized machine environment:
```bash
Host OS
 └── Hypervisor
      ├── VM → Linux kernel
      ├── VM → Linux kernel
      └── VM → Linux kernel
```

- A typical Linux Container instead, shares the host's kernel:
```bash
Host Linux kernel
 ├── Container
 ├── Container
 └── Container
```

So VM seperates guest kernel, and Container shares host kernel.


### Conclusion
We don't just memorize that VM means virtual computer. instead we ask ourselves: Which layer am i operating at?
- 1- Physical hardware
- 2- Virtualization
- 3- Guest Hardware
- 4- Linux kernel
- 5- Userspace or
- 6- Applications?

**This Layering comes handy when we study guest drivers, cloning or templating, system images and cloud instances.**
