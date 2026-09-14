# Dependencies: What happens when a package needs another package?

**The Goal** is to understand how we can inspect dependencies with apt.

### Pick a package

```bash
➜  ~ apt depends curl
curl
  Depends: libc6 (>= 2.38)
  Depends: libcurl4t64 (= 8.12.1-3ubuntu1)
  Depends: zlib1g (>= 1:1.1.4)
```
The output is showing packages/libraries that curl cannot function correctly without them.

### Distinguish `Depends` from `Recommends`
Let's make it interesting by looking up into `apt`'s own dependencies:
```bash
➜  ~ apt depends apt
apt
 |Depends: base-passwd (>= 3.6.1)
    base-passwd:i386
  Depends: adduser
  Depends: gpgv
    gpgv-from-sq
    gpgv:i386
  Depends: libapt-pkg7.0 (>= 3.0.0)
  Depends: ubuntu-keyring
  Depends: libc6 (>= 2.38)
  Depends: libgcc-s1 (>= 3.3.1)
  Depends: libseccomp2 (>= 2.4.2)
  Depends: libssl3t64 (>= 3.0.0)
  Depends: libstdc++6 (>= 13.1)
  Depends: libsystemd0
  Conflicts: <apt-verify>
  Conflicts: <libnettle8> (<< 3.9.1-2.2~)
  Breaks: apt-transport-https (<< 1.5~alpha4~)
  Breaks: apt-utils (<< 1.3~exp2~)
  Breaks: aptitude (<< 0.8.10)
  Recommends: ca-certificates
  Suggests: apt-doc
 |Suggests: aptitude
 |Suggests: synaptic
  Suggests: wajig
  Suggests: dpkg-dev (>= 1.17.2)
 |Suggests: gnupg
 |Suggests: gnupg2
  Suggests: gnupg1
  Suggests: powermgmt-base
  Replaces: apt-transport-https (<< 1.5~alpha4~)
  Replaces: apt-utils (<< 1.3~exp2~)
```

- Depends: means it is required for functioning.

- Recommends: normally installed because the package expects or usefully benefits from it.

- Suggests: means it is optional

- Conflicts: means `apt` cannot be installed alongside that package and they cannot exist together.

- Breaks: apt can technically coexist with that package, but a particullar version of that package does'nt work correctly with apt.

- Replaces: apt is allowed to overwrite files that previously belonged to that package.

### See What apt would install
We simulate the installation:

```bash
➜  ~ sudo apt install --simulate tmux    

Installing:                     
  tmux

Installing dependencies:
  libevent-core-2.1-7t64

Summary:
  Upgrading: 0, Installing: 2, Removing: 0, Not Upgrading: 0
Inst libevent-core-2.1-7t64 (2.1.12-stable-10 Ubuntu:25.04/plucky [amd64])
Inst tmux (3.5a-3 Ubuntu:25.04/plucky [amd64])
Conf libevent-core-2.1-7t64 (2.1.12-stable-10 Ubuntu:25.04/plucky [amd64])
Conf tmux (3.5a-3 Ubuntu:25.04/plucky [amd64])
```

this way apt shows packages that it would install, upgrade or remove without actually installing anything.

## Conclusion
The core reason we use apt instead of manually installing `.deb` files:
- 1- We ask for a software like `tmux`
- 2- APT finds and examines dependencies
- 3- APT finds required packages
- 4- downloads them
- 5- installs them in the correct order

But `dpkg` doesn't automatically perform dependency resolution for us. instead it manages individual packages, but APT manages packages as a system, including repositories and dependency resolution.
