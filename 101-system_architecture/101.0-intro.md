# System Architecture: Intro
The first chapter of lpic1 is one of its hardest one to learn.
In this chapter we'll get more familiar with substructure of a linux system, from the very first moment that we push the power button of our computer until the User enviroment and Services gets ready to be used.

We'll learn how the hardware gets detected, gets primitive assignments and gets configured; and how **Linux Kernel** will be loaded and take control of the system, and that which components are in charge of:
- Boot management.
- Launching Runlevels.
- Secure turn on/off of the system.

### At the end we are expected:
- To be able to detect and basic configure system's Hardware.
- Explain the process of launching them and its key components.
- Basic setting and troubleshooting of BootLoader (Grub).
- Turn on/off or reboot the system in a professional way.

### Chapter-101 subjects:
- **101.1 - Determine and Configure Hardware Settings**: 
Understanding various Hardware and how kernel interacts with them; Observe the process of launching and booting the system; Configuration and troubleshoot of BootLoaders and Grub.

- **101.2 - Boot the System**: 
Manage Runlevels and Targets, work with **Systemd**, change functioning levels of the system and boot into different levels.

- **101.3 - Change RunLevels/BootTargets and shutdown or reboot the System**: 
Secure halting and turning on/off or reboot the system. Monitoring and low-level debugging; Observing Kernel messages and logs for troubleshooting.

**Honestly** not so many professional linux users can install and configure or create a dualboot on their own and without any help, because almost 99% of times things like Hardware or services are already configured and installation and hardware configuration is a one-time process, but though it is not always necessary doesn't mean that we don't have to learn it or may not need it.
