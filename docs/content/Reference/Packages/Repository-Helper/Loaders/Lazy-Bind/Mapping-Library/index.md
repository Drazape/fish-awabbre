---
comments: true
icon: lucide/graph-star
description: Mapping library advantages and types index
---

# Mapping Library
The mapping library is a collection of functions that makes mapping packages and Base Commands trivial.

## Advantages
The functions do so by handling redundant boilerplate in the definition, more specifically:

- Prefixing packages as per the standard
- Escaping the Base Command names

By choosing the suitable function, your definitions become:
- More readable and maintainable, for there are multiple mapping types to choose from.
- Less error-prone, for the boilerplate is eliminated.

## Package standard prefixing
When specifying the package name (that is, its function name), the mapping functions automatically prefix the packages with the standard prefix.

That is, the library internally changes the passed package name as follows:
```diff
- [<group>…]_[<pkg>]
+ _awabbre-pkg_[<group>…]_[<pkg>]
```

As such, when specifying the package name, you must omit the standard prefix from the package name.  
Doing so keeps the definitions more readable and maintainable, for it is the entire purpose of the library.  
Consequently, non-standard packages are not supported by the mapping functions.

!!! tip "Package Tree support"
    Compliant packages can additionally be organised as part of the [Package Tree](../../../Package-Tree.md){data-preview}

## Mapping Types
There are several different mapping types, each with its own function.  
The developer must choose the most suitable combinations of the mapping functions, keeping in view the packages and their provided Base Commands.

The following table details the available different mapping types:

!!! note "Library Namespace"
    Each of the library functions are under the prefix `_awabbre-pkgs_lazybind_map_`

| Function | Mapping Type | Use-case |
| :------: | ------------ | -------- |
| [`_awabbre-pkgs_lazybind_map_pkg-commands`](./Package-to-Commands.md){data-preview} | Map multiple commands to a single package | A single package provides several different commands |
| [`_awabbre-pkgs_lazybind_map_command-pkgs`](./Command-to-Packages.md){data-preview} | Map a single command to multiple packages | Several different packages provide the same command |
| [`_awabbre-pkgs_lazybind_map_pairs`](./Pairs.md){data-preview} | Map pairs of a command and a package in bulk | Each package provides a distinct command |
| [`_awabbre-pkgs_lazybind_map_bulk`](./Bulk.md){data-preview} | Both multiple commands and multiple packages to each other | Several different packages provide the same set of commands |
