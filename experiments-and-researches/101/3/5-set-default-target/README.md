# Set Default Target

**The Goal** of doing this is to know better how to set default target for systemd.

- 1- See current default target:

![get-default](../screenshots/5-get-default-target.png)

- 2- Inspect the `default.target` unit file:

![inspect-default-unit-file](../screenshots/5-1-default-target-unit-file.png)

- 3- Set default target to rescue mode:

![set-default-target-rescue](../screenshots/5-2-set-default-target.png)

- 4- Reboot the system to see if it works:

![reboot-the-system](../screenshots/5-3-reboot.png)

- 5- We successfuly boot into rescue mode:

![boot-into-rescue](../screenshots/5-4-boot-rescue-target.png)

- 6- Change back the default target into "multi-user" and isolate multi-user:

![reset-the-changes](../screenshots/5-5-set-default-multiuser-isolate-back.png)

# Conclusion
**When we change** default target, `systemctl set-default` updates the `default.target` symbolic link in `/etc/systemd/system` so that it points to a different target unit (for example: `rescue.target`) in the `/usr/lib/systemd/system` directory, therfore `default.target` changes from this:

![multi-user-default-unit-file](../screenshots/5-1-default-target-unit-file.png)

**into this**:

![rescue-default-unit-file](../screenshots/5-6-rescue-mode-default-target-unit-file.png)