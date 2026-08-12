# Research: rc (runcommand)
it stands for run command. the term originated in early unix systems and refers to files or directories containing commands that are executed automatically when a program or the os starts.

the rc naming convention appears in many unix/unix components, for example:
- .bashrc: commands executed when a bash shell starts
- .vimrc: commands executed when vim starts
- rc.local
- rc0.d
- rc6.d

### rc0.d-rc6.d
Containing startup and shutdown commands for each SysVinit runlevel.

# Core Idea
the Term rc does not refer specifically to runlevels or init systems. it is a general Unix convention meaning "Commands to be run automatically". this convention predates SysVinit. and is still visible in many Linux configuration files today.