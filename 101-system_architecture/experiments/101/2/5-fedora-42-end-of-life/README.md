# Experiment: Fedora 42 End Of Life Warning at Boot

## Observation:
During the boot of a Fedora 42 Server VM the following message appears early in initramfs stage:

![fedora-eol-boot-message](../screenshots/5/1-fedora-42-eol-boot-message.png)

## Quick Research (ai):
- Fedora 42 released 15 apr 2025.
- Original planned EOL: 13 May 2026.
- Actual offical EOL: 27-28 May 2026 (slight delay).
- Message issued by dracut / initramfs before real root is mounted.

## Why upgrade?
- Unsupported releases recieve no security update
- running EOL systems in production is a risk.

## Related topics 
- 101.1 & 101.2 system architecture and boot process.
- distro lifecycle management.
- Importance of keeping systems on supported releases.

## Solution:

#### 1- first verify that the plugin for systemUpgrade is installed and prepared:

![verifying system upgrade plugin](../screenshots/5/2-system-upgrade-plugin-check.png)
```bash
sudo dnf install dnf-plugin-system-upgrade
```

#### 2- Download the latest or arbitrary release:

![upgrade-system](../screenshots/5/3-upgrade-the-system.png)
```bash
sudo dnf system-upgrade download --releasever=44
```

#### 3- after Download being completed, it needs a reboot:

![download-complete](../screenshots/5/4-upgrade-downloaded.png)
```bash
sudo dnf system-upgrade reboot
```

#### 4- after reboot this page appears:

![upgrade-installation](../screenshots/5/5-upgrade-installation.png)

#### 5- after installation of upgrade got completed we're done:

![installtion complete](../screenshots/5/6-result.png)
