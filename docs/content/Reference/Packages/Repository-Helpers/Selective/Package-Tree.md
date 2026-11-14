---
comments: true
icon: lucide/network
description: Package structure
---

# Package Tree
The packages are organised in a tree data-structure

!!! note "Standard Only"
    This is only a standard followed by the official repository. Other repositories and packages may choose to make their own structures.

Repositories that are compliant with the official package tree structure are compatible for use with the [Selective repository helper][usage]{data-preview}.

## Data Types
Each element in the package tree can be of either of the following types:
1. **Groups**: A collection of packages or other groups
2. **Packages**: Executable functions providing abbreviations

## Ranks
`0` Universal
:   Before the Root group (1st group) comes the universal group (group zero).
    It has no element in it's path, and all the other root groups stem from it.
    This group cannot be preceded by any other group.

`1` Roots/Sources
:   These are the groups that stem from the Universal group.
    The standard is to use this group for the package source.
    !!! info "Official Root Group name"
        The root group name reserved for official package in the official repository is simply `official`.

`2:-2` Collections
:   Collections of packages and other groups. Used by users to easily enable a group of packages without curating them themselves.

`2/-2` Shelves
:   Same as collections, but strictly contains only packages.

`-1` Packages/Leaves
:   Executables containing abbreviations.
    Used by users to selectively enable abbreviation sets

## Function naming convention
The following sections describe how you can make your package compateble with the package tree, and organise it accordingly.

### Compatibility requirement
the package's function name must start with `_awabbre_pkg_`.

For example, a package at the path `myGroup_myPackage` should have the function name `_awabbre_pkg_myGroup_myPackage`.

If a package or group isn't prefixed with `_awabbre_pkg_`, neither will it be compatible with the package tree, thus nor will it be indexable by the [Selective repository helper][usage]{data-preview}.

### Organisation
To positional packages and groups into the Package Tree structure, format the function names as follows:

```fish {title="Function Name Format"}
_awabbre_pkg_[<group>…]_<package>
```

The groups can be nested, and the package name is always the last element in the function name.

Each group and package name must be separated by an underscore `_`.

!!! note "Structure Usage"
    It is up to the repository helper used by the user to decide upon how to make use of this structure.

[usage]: ./Usage.md
