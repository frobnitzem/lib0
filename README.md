# zero

This project uses a cmake build system and
contains tests and documentation, but not much else.

Use this project by:
```bash
git clone https://github.com/frobnitzem/lib0 <your project name>
cd <your project name>
bash customize.sh <your project name>
```

This will substitute all the `zero`-s out for your new project name.
cmake, make, ctest, and install should work to install the library.
An example of a downstream code using this one is available in `example/`

# additional resources

A related, larger effort with more plugins is available here:
https://github.com/LLNL/blt/
