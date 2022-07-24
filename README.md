# H3-Odin
- This unofficial library provides [Odin](https://odin-lang.org/) bindings for the [v4.0.0-rc3 of H3 Core Library](https://github.com/uber/h3/tree/v4.0.0-rc3). For API reference, please see the H3 Documentation.

## Installation guide for OS X and Linux
- For amd64 arch linux and OS X, you can use the library as soon as clone the repository.
- For unsupported environments, please follow the guide below
    - Build [h3](https://github.com/uber/h3/tree/v4.0.0-rc3)
    - Copy libh3.a from $H3_PROJECT_ROOT/build/lib/libh3.a to h3-odin/_gen
    - Update procedures.odin properly
- Run basic examples after installation
```bash
# run basic tests
cd ../../examples
odin test .
```