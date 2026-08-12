# What is fsck? (file system consistency check)
**it is a** utility used to examine and repair linux file systems from inconsistency caused by improper shutdown, power failures, HardWare errors, or FS corruption.
**FSCK** acts as a front-end that automatically invokes the appropriate file system checker. such as: *fsck.ext4, fsck.xfs or fsck.vfat* depending on the file system type.

### Purpose
Emsures the integrity & consistency of a file system before it is mounted or when corruption is suspected.

**Common usage**:
```bash
fsck /dev/sda1
```

### NOTE!
Running fsck on a mounted read-write file system can cause data corruption. it should generally be used on unmounted file systems or during system boot. because during boot the file system is not yet mounted read/write use. so **fsck** can
safely check and repair it without other processes modifying its data simultanously.
