# Anatomy of an `.rpm`
**Goal**: Understand what an `.rpm` package contains and how `rpm` can inspect it without installing it.

### Download an `.rpm` without installing

![dwnld-pkg](screenshots/1-download-pkg.png)


### Inspect package metadata
Show info:

![pkg-info](screenshots/2-pkg-info.png)

- `-qp`: Query(q) a package file(p).
- `-i`: Show information.
**Notice that** `-p` is important because we're querying the **RPM** file, not an installed package.


### See what files it contains:

![provides](screenshots/3-pkg-files.png)

- `l`: List files related to the package rpm file.


### See its dependencies

![pkg-dpnds](screenshots/4-pkg-depends.png)

This answers what does this `.rpm` need in order to work correctly.


### Install the `.rpm`

![install-pkg](screenshots/5-pkg-install.png)

- `-i`: install the package file.
- `-v`: show a more verbose result.


### Check what packages provides its files

![what-pkg-ownsit](screenshots/6-pkg-owns-file.png)


## Conclusion

The key **Comparison** with Debian:
- `.rpm` == `.deb`: Package format.

- `dpkg-deb --info` == `rpm -qp --info`: See information.

- `dpkg-deb --contents` == `rpm -qp -l`: List package files.

- `dpkg-deb --field *.deb Depends` == `rpm -qp --requires *.rpm`: Inspect dependencies.

- `dpkg -i *.deb` == `rpm -i *.rpm`: Install package. 
