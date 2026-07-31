# What are Kernel objects?

**In** the Linux Kernel, a kernel object ( often called kobjects ) is a basic building block used inside the kernel to represent things like *devices, drivers, buses* and other components. Think of it as the Kernel's way of organizing and managing its internal "things" in a structured, hierarchical way (like folders and files).

## Why do they matter? 
Kernel objects are mainly exposed to you (the user/admin) through the */sys* directory (Sysfs). This allows you to view and sometimes change information about hardware & Kernel settings without rebooting or digging deep into kernel code. 

## Key points for 101 chapter:
Sysfs: the virtual file system (/sys) that shows kernel objects to userspace. it gives you information about: Devices(CPU, USB, PCI devices and etc.), Drivers, Power management, Modules.

it works together with Udev (which creates devices nodes in /dev) and dbus (for communication between programs).

```
ls /sys/
ls /sys/devices/          # hardware devices
ls /sys/class/            # device classes (net, block, etc.)
ls /sys/module/           # loaded kernel modules
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq   # current CPU speed
```

Common Commands related:
- lspci -> list pci devices.
- lsusb -> List usb devices.
- lsmod -> list loaded kernel modules.
- dmesg -> kernel messages (often shows device detection).
- udevadm -> manage udev rules and devices.

## In short:
Kernel Objects are the kernel's internal representation of hardware & components. you interact with them mostly via the /sys folder which helps you monitor, configure hardware. 