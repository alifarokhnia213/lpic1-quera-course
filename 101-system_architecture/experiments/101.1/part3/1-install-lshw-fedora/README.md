# Practice NO.1: fedora-server installation of `lshw` challanges.

**This** is more like an experiment than a practice. I usually use my ubuntu desktop to do stuff that Jadi does in his lectures, but this time i decided to open my `fedora-server` to do practices.

Commands that worked:

- ### 1- `lsusb`
![lsusb](../screenshots/1-lsusb-fedora.png)

- ### 2- `lspci`
![lspci](../screenshots/2-lspci-fedora.png)

- ### 3- `lsblk`
![lsblk](../screenshots/3-lsblk-fedora.png)

- ### 4- `lshw`

the real challange happend here, I typed and entered lshw command, but I had a `command not found` output. I thought a bit and decided to install it using fedora server package manager which i though was RPM; so I typed:
```bash
sudo rpm install lshw
```
and I totally expected to see it works like apt in debian based distros. BUT what I saw was interesting:

![lshw-installation-error](../screenshots/4-lshw-fedora-rpm-error.png) 

**it** didn't say I don't exist, but printed a help page which was complicated to understand.

**but then** I googled and saw this explaination:
While RPM is the packaging format, yum is the command you will use to do the installation. For example, yum will resolve and download the dependencies for the package you want to install; rpm will simply complain if you want to install a package that does not have all its dependencies installed.

**What i learned**: RPM is a package format for redhat distros and is sensetive to packages dependencies, but to install packages, we have to use tools like **yum** or **dnf**.

### finally the installation is successful:
![lshw-successful-installation](../screenshots/5-lshw-fedora-successful-installation.png)

### the Result of `lshw` command on virtual fedora-server:
![lshw-result](../screenshots/6-lshw-fedora-result.png)
