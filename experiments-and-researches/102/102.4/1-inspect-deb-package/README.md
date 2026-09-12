# Inspecting a Debian package

**The Goal** is to understand what a debian package actually is.

### Picking a package
For starter we need to pick and download a harmless package:
```bash
➜  apt pwd
/var/cache/apt
➜  apt 
➜  apt sudo apt download bzr
Get:1 http://archive.ubuntu.com/ubuntu plucky/universe amd64 bzr all 2.7.0+bzr6622+brz [4,064 B]
Fetched 4,064 B in 1s (6,070 B/s)
Warning: Download is performed unsandboxed as root as file '/var/cache/apt/bzr_2.7.0+bzr6622+brz_all.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
➜  apt ls
archives  bzr_2.7.0+bzr6622+brz_all.deb  pkgcache.bin  srcpkgcache.bin
```

### Ask dpkg-deb about the package
Run `dpkg-deb --info <package.deb>`:
```bash
➜  apt dpkg-deb --info bzr_2.7.0+bzr6622+brz_all.deb 
 new Debian package, version 2.0.
 size 4064 bytes: control archive=908 bytes.
     836 bytes,    16 lines      control
     194 bytes,     3 lines      md5sums
     104 bytes,     9 lines   *  prerm                #!/bin/sh
 Package: bzr
 Version: 2.7.0+bzr6622+brz
 Architecture: all
 Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
 Original-Maintainer: Debian Bazaar Maintainers <pkg-bazaar-maint@lists.alioth.debian.org>
 Installed-Size: 28
 Depends: brz
 Breaks: bzr-builddeb (<< 2.8.12+brz), bzr-email (<< 0.0.1~bzr58+brz), bzr-fastimport (<< 0.13.0+bzr361+brz), bzr-git (<< 0.6.13+bzr1650+brz), bzr-loom (<< 2.2.0+brz), bzr-stats (<< 0.1.0+bzr54+brz), bzr-upload (<< 1.1.0+brz), bzrtools (<< 2.6.0+brz), loggerhead (<< 1.19~bzr479+dfsg+brz), loggerhead-doc (<< 1.19~bzr479+dfsg+brz)
 Section: oldlibs
 Priority: optional
 Homepage: https://bazaar-vcs.org
 Description: transitional dummy package for brz
  This is a transitional package, replacing the Bazaar packaging
  with the Breezy packaging.
  .
  It can be safely removed after an upgrade.
```
The output is package metadata.

**Pay particular attention** to:
- Package: Name of the package
- Version: the version of package
- Architecture: the value is `all` which means the packages is not tied to any particular cpu architecture.
- Depends: specifies the dependencies which should be installed for package to work.

### See what files the package contains
Using `dpkg-deb --contents <package.deb>` we list files that the package includes; example:
```bash
➜  apt dpkg-deb --contents bzr_2.7.0+bzr6622+brz_all.deb 
drwxr-xr-x root/root         0 2019-09-20 02:55 ./
drwxr-xr-x root/root         0 2019-09-20 02:55 ./usr/
drwxr-xr-x root/root         0 2019-09-20 02:55 ./usr/share/
drwxr-xr-x root/root         0 2019-09-20 02:55 ./usr/share/doc/
drwxr-xr-x root/root         0 2019-09-20 02:55 ./usr/share/doc/bzr/
-rw-r--r-- root/root       404 2019-09-20 02:55 ./usr/share/doc/bzr/NEWS.Debian.gz
-rw-r--r-- root/root      1301 2019-09-20 02:55 ./usr/share/doc/bzr/changelog.gz
-rw-r--r-- root/root      1769 2019-09-20 02:55 ./usr/share/doc/bzr/copyright
```
We can now see that this package is not some mysterious executable installer; but it's an archive containing files + metadata that describe how those files should be managed.

### Install and find the actual program
```bash
➜  apt sudo dpkg -i bzr_2.7.0+bzr6622+brz_all.deb
Selecting previously unselected package bzr.
(Reading database ... 306051 files and directories currently installed.)
Preparing to unpack bzr_2.7.0+bzr6622+brz_all.deb ...
Unpacking bzr (2.7.0+bzr6622+brz) ...
Setting up bzr (2.7.0+bzr6622+brz) ...
➜  apt 
➜  apt dpkg-deb --contents bzr_2.7.0+bzr6622+brz_all.deb | grep /usr/bin/*
./usr/bin/bzr
```

So the package is actually telling the package manager, "when i'm installed this bzr executable belongs at `/usr/bin/bzr`".

### Inspect the package's control information
This is especially useful:
```bash
➜  apt sudo dpkg-deb --control bzr_2.7.0+bzr6622+brz_all.deb
➜  apt 
➜  apt ls
archives  bzr_2.7.0+bzr6622+brz_all.deb  DEBIAN  pkgcache.bin  srcpkgcache.bin
➜  apt 
➜  apt ls DEBIAN/
control  md5sums  prerm
```
These scripts can be useful during installation/removal when we need to do extra actions to intergrate the software into the system. for example these scripts can be useful when software needs to create user/groups, update configuration, register services, update cache and ... after installation.

## Conclusion
- `dpkg-deb` let us inspect the package itself without asking the package manager to install it.
- a Package includes files needed for installation and integration and metadata about the package.
- Some packages may be designed for specific cpu architectures like arm64 or X86_64.
- Package control scripts help us do extra actions during installation or removal.
