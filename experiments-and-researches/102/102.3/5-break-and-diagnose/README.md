# Break and diagnose a shared library dependency

**The Goal** is to simulate a very common production problem when an application suddenly says: `libsomething.so: cannot open shared object file`.
We will use the previous experiments situation where we had `libhello.so`.

### Starting with a working application
First we create the same situation as previous experiments:

- 1- copy the directories:

![create-situation](screenshots/1-create-situation.png)

- 2- create config and rebuild the cache:

![rebuild-cache](screenshots/2-rebuild-cache.png)

And as you can see the executable works and depends on libhello library:

![situation-proof](screenshots/3-situation-proof.png)

### Simulate the failure
Now we rename the library and run the executable again:

![linker-failure](screenshots/4-linker-failure.png)

### Simulate the diagnosis
Now we check the executable with `ldd` and make sure that the executable needs the library:

![simulate-diagnosis](screenshots/5-sim-diagnosis.png)

So we're sure that the executable needs libhello.so and it probably exists somewhere.

### Ask linux where it knows about library

![find-lib-in-cache](screenshots/6-find-in-cache.png)

because the ld.so.cache is still untouched we may see previous location of library but the file itself doesn't exist anymore.

Now we go into the previous location and check and see the file:

![check-previous-location](screenshots/7-check-previous-location.png)

This is an interesting real world situation where the loader's cache can contain a path that is no longer valid.

Now we run `ldconfig` and rebuild the cache:

![rebuild-cache](screenshots/8-rebuild-cache.png)

This demonstrates why `ldconfig` matters when a library is added, removed, or relocated.

### Find the library manually
Suppose we don't know where the library went, then:

![find-lib-manually](screenshots/9-find-lib-manually.png)

So now we know that the require library is `libhello.so` but the available one is named `libhello.so.bak`.

### Fix the executable

![fix-problem](screenshots/10-fix-problem.png)

### Another interesting failure

![second-failure](screenshots/11-another-failure.png)

Now again the linker says the library cannot be found **BUT**:

![check-library](screenshots/12-check-library.png)

This show that the library does exist. that's a different kind of failure: 
- Library exists.
- Dynamic linker doesn't know where it is.
- So it cannot be found.
This distinction is pretty important. to know is the library having an issue or the config file?

### Restore the config

```bash
➜  ~ sudo mv /etc/ld.so.conf.d/hello.conf.disabled /etc/ld.so.conf.d/hello.conf
➜  ~ ldconfig
```

**Verify**:

![verify-config](screenshots/13-verify.png)

### Conclusion
When having an error saying library cannot be found it is pretty important to ask the right question:
- does the library file exist?
- or does the linker know where the library file is?

The lifecycle mental model:
- 1- C source 
- 2- shared library (.so file)
- 3- executable recording dependency
- 4- dynamic linker
- 5- library search mechanism
- 6- ld.so.cache or configuration
- 7- library loading
- 8- program runs.
