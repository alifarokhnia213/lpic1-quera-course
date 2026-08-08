# Abstractions in linux
an abstraction is a simplified interface that **hides the complexity** of how something work internally.

**In Linux** abstractions let users & apps interact with hardware and the operating system without needing to understand the underlaying implementation.

### Examples
- files: represent devices (/dev), kernel info (/proc) and hardware info (/sys)
- system calls: provide a standard interface for applications to use kernel services.
- device drivers: hide hardware-specific details behind a common interface.

**Key Idea**: Abstractions makes Linux simpler to use, more portable and easier to develope software for.
