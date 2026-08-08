# Runtime data
**is** information that exists only while the operating system is running. it is dynamically created by the kernel & running programs and usually lost after a reboot unless it is saved elsewhere.

### Examples of Runtime data
- Running processes
- active network connections
- mounted file systems
- system logs stored in memory 
- temporary files
- PID files
- Sockets

**on Linux** runtime data is commonly stored in locations such as: 
- /run - runtime state (PID files, sockets, lockfiles)
- /proc - VFS containing info about the running kernel & processes.
- /sys - VFS exposing info about devices & kernel.

### Conclusion 
runtime data represents the current state of the running system. unlike config files (such as those in /etc), runtime data is generally temporary and recreated each time the system boots  
