# Install, inspect and remove a package

**The Goal** is to compare low-level and high-level package management in short.


### Install using `apt` suit:

```bash
➜  ~ sudo apt install hello
[sudo] password for ali: 
Installing:                      
  hello

Summary:
  Upgrading: 0, Installing: 1, Removing: 0, Not Upgrading: 0
  Download size: 25.9 kB
  Space needed: 106 kB / 267 GB available

Get:1 http://archive.ubuntu.com/ubuntu plucky/main amd64 hello amd64 2.10-3build2 [25.9 kB]
Fetched 25.9 kB in 1s (18.2 kB/s)                           
Selecting previously unselected package hello.
(Reading database ... 306055 files and directories currently installed.)
Preparing to unpack .../hello_2.10-3build2_amd64.deb ...
Unpacking hello (2.10-3build2) ...
Setting up hello (2.10-3build2) ...
Processing triggers for man-db (2.13.0-1) ...
```


### Ask `dpkg` what happend:

**Check the status**:
```bash
➜  ~ dpkg -s hello
Package: hello
Status: install ok installed
Priority: optional
Section: devel
Installed-Size: 104
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Architecture: amd64
Version: 2.10-3build2
Replaces: hello-debhelper (<< 2.9), hello-traditional
Depends: libc6 (>= 2.38)
Breaks: hello-debhelper (<< 2.9)
Conflicts: hello-traditional
Description: example package based on GNU hello
 The GNU hello program produces a familiar, friendly greeting.  It
 allows non-programmers to use a classic computer science tool which
 would otherwise be unavailable to them.
 .
 Seriously, though: this is an example of how to do a Debian package.
 It is the Debian version of the GNU Project's `hello world' program
 (which is itself an example for the GNU Project).
Homepage: https://www.gnu.org/software/hello/
Original-Maintainer: Santiago Vila <sanvila@debian.org>
```

- `Status`: Says that the package is installed successfully.
- `Architecture`: indicates that the package is compatible with Amd64 architecture.
- `Depends`: This package needs `libc` shared library.


**Find the files that the package has installed**:
```bash
➜  ~ dpkg -L hello
/.
/usr
/usr/bin
/usr/bin/hello
/usr/share
/usr/share/doc
/usr/share/doc/hello
/usr/share/doc/hello/NEWS.gz
/usr/share/doc/hello/changelog.Debian.gz
/usr/share/doc/hello/copyright
/usr/share/info
/usr/share/info/hello.info.gz
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/hello.1.gz
```

### Remove the package:
```bash
➜  ~ sudo apt remove hello
[sudo] password for ali: 
REMOVING:                       
  hello

Summary:
  Upgrading: 0, Installing: 0, Removing: 1, Not Upgrading: 0
  Freed space: 106 kB

Continue? [Y/n] y
(Reading database ... 306062 files and directories currently installed.)
Removing hello (2.10-3build2) ...
Processing triggers for install-info (7.1.1-1) ...
Processing triggers for man-db (2.13.0-1) ...
```

**Now again check the status with `dpkg`**:
```bash
➜  ~ dpkg -s hello
dpkg-query: package 'hello' is not installed and no information is available
Use dpkg --info (= dpkg-deb --info) to examine archive files.
➜  ~ 
➜  ~ dpkg --info hello
dpkg-deb: error: failed to read archive 'hello': No such file or directory
```
dpkg is showing messages indicating that `hello` package is not installed and there is no any archived files in the system related to it.

## Conclusion
**What actually happend in installtion process**:
- 1- apt suit downloades the .deb file
- 2- dpkg installs the .deb
- 3- files and pkg database gets updated.

**What happend in uninstallation process**:
- 1- `apt remove` gets executed
- 2- dpkg removes the package's files
- 3- package state gets updated again.

`apt` manages the high level process and `dpkg` maintains the installed package state and performs low-level package operations.
