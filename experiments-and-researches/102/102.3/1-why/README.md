# Why we should learn about shared libraries

Because they explain how most linux programs actually work after we run them. for example `ls` command usually doesn't contain all the codes it needs, instead it relies on shared libraries such as "libc". the dynamic linker finds and loads those libraries into the program at runtime.

**So this helps us to understand** that a linux program is often not a self-contained file; it depends on other components to run.

**This subject matters a lot for when**:
- A program fails with "shared library not found".
- You install shared libraries.
- You troubleshoot broken applications.
- You need to understand packege dependencies.
- You work with custome server or software.

### How to learn it
**Keep this question in your mind**: 
When I run a program where does the rest of the code it depends on come from?
