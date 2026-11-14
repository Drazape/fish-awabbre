---
comments: true
icon: lucide/package
description: Map multiple commands to a single package
---

# Package to Commands
The package-to-commands library function is used to map a single package to multiple Base Commands in a single call.

## Use case
Use `_awabbre-pkgs_lazybind_map_pkg-commands` for a package which awabbreviates several different Base Commands, all of which should load the same package.

## Usage
Pass the package name first, followed by the Base Commands it provides.

```fish
_awabbre-pkgs_lazybind_map_pkg-commands \
    <Package> \
    <Base Command foo> \
    [<Base Command bar>] \
    [<Base Command baz>]
    …
```

Every Base Command passed is mapped to the package.  
Each command is mapped individually, so it is recommended to put the package on its own line and list the Base Commands below it for better readability.

!!! example "Illustrative mapping"
    Given a package `myGroup_myPackage` which provides the commands `mycmd`, `mycmd-extra`, and `mycmd-helper`:
    ```fish
    _awabbre-pkgs_lazybind_map_pkg-commands \
        myGroup_myPackage \
        mycmd mycmd-extra mycmd-helper
    ```

    Entering any of the three commands on the command-line loads the `myGroup_myPackage` package.
