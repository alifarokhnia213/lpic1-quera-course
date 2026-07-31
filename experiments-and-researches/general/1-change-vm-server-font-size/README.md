# Change Fedora Server Font Size

The text size on fedora vm terminal was botheringly small so I decided to increase it by changing the font.
- 1- You can achieve it by listing the fonts in `/usr/lib/kbd/consolefonts` and choosing one.
- 2- temporarly you can change the font by using command `sudo setfont <fontname>` but it will be reset after a reboot.

![setfont command](../screenshots/1-4-setfont-command.png)

- 3- a permanent way to achieve this is to change the configuration file `/etc/vconsole.conf`:

![console configuration](../screenshots/1-etc-vconsole-conf.png)

- 4- **!Note** that in configuration file we don't need to set .psfu.gz suffix

![console config file changed](../screenshots/1-1-etc-vconsole-conf-changed.png)

- 5- after you've changed the font in configuration file it is time to reboot.

![reboot](../screenshots/1-2-reboot.png)

- 6- and result will be like this:

![result](../screenshots/1-3-result.png)