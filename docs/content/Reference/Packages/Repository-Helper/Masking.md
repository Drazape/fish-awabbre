---
status: new
comments: true
icon: lucide/eye-off
description: Exclude packages from being loaded
---

# Masking
You can mask certain packages or groups in the [Package Tree](./Package-Tree.md) from being loaded by the [Loaders](./Loaders/index.md){data-preview}.

## Behavior
When a package is masked, the official repository helpers will not load it whatsoever.

Select
:   **Package Selection**: If the full path of a masked package is specified, no action will be performed.
:   **Group Selection**: All the packages in the group will be loaded, except for the masked packages.

Lazybind
:   When a mapped *Base Command* is found on the command-line, the loader will load only the unmasked packages mapped to it.

## Usage
To mask packages, add Regex queries to the `$awabbre_mask_pkgs` variable.  
Packages that match at least a single RegExp query in said variable will be masked.

!!! warning "Prefix is excluded against the query"
    Only packages from the package tree are matched against the query.
    Consequently, all the packages have the string `_awabbre_pkg_` prefixed to them.

    As such, The RegExp queries match the package function names with the prefix stripped out.
