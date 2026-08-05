# Upstart
- What is upstart?
**Upstart is an** event based init-system developed by canonical to replace the traditional SysVinit.
its primary responsability is to start, stop, monitor & manage system services. during boot and while the system is running. unlike SysVinit which starts services in a fixed sequence, upstart responds to event such as:
- system boot 
- network becoming available 
- file system mounting
- hardware detection 
**This allows services** to start only when the required conditions are met.

**Why was it been created?** SysVinit had several limitations:
- sequential service startup (slow boot)
- difficult dependency management
- limited automatic service startup
**So** upstart introduced an event-driven architecture, making service management more flexible & improving boot performence.

## Why isn't it used today? most distros have replaced Upstart with Systemd, which provides:
- better dependency handling 
- parallel startup
- unified service management
- more advanced monitoring & logging.

Upstart job configuration files are stored in: /etc/init and each service is defined by a .conf file. example: /etc/init/ssh.conf
 

**Common commands**: 
- `sudo start <job>`
- `sudo stop <job>`
- `sudo restart <job>`
- `sudo status <job>`
- `initctl list`
- `sudo initctl reload-configuration`: this tells upstart to rescan the job definitions in `/etc/init`