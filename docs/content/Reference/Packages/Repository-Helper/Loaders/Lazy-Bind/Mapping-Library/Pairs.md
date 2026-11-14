---
comments: true
icon: lucide/boxes-linked
description: Map pairs of a command and a package in bulk
---

# Pairs
The pair library function is used to map pairs of a command and a package in a single call.

## Use case
Use `_awabbre-pkgs_lazybind_map_pairs` for packages which each awabbreviate a distinct Base Command.

## Usage
The arguments alternate between the Base Command and the package name, starting with the Base Command.

```fish
_awabbre-pkgs_lazybind_map_pairs \
    <Base Command foo> <Package foo> \
    [<Base Command bar> <Package bar>] \
    [<Base Command baz> <Package baz>]
    …
```

The pairs are specified consequently to each other, thus it is recommended to each pair in a separate escaped line for better readability.

!!! example "Shipped mappings"
    The following is the showcase of the mappings published with *fish-awabbre*: 
    ```fish
    _awabbre-pkgs_lazybind_map_pairs \
        nix official_nix_nix3 \
        {,official_nix_}nh \
        {,official_}jj
    ```
