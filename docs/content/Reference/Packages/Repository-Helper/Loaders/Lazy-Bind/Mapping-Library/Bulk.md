---
comments: true
icon: lucide/boxes
description: Both multiple commands and multiple packages to each other
---

# Bulk
The bulk library function is used to map multiple packages to multiple Base Commands in a single call.

## Use case
Use `_awabbre-pkgs_lazybind_map_bulk` when several different packages provide the same set of Base Commands.

## Usage
Pass each package with the `--packages` (`-p`) option, followed by the Base Commands as positional arguments.  

```fish
_awabbre-pkgs_lazybind_map_bulk \
    --packages={
        <Package foo>,
        <Package bar>
        …
    } \
    <Base Command baz> \
    [<Base Command qux>]
    …
```

The `--packages` option can be repeated to specify additional packages.  
Every package passed is mapped to every Base Command passed; that is, entering any of the commands loads all the packages.

!!! example "Illustrative mapping"
    Given two packages `myGroup_myPackage` and `myGroup_myOtherPackage` which both provide the commands `mycmd` and `mycmd-extra`:
    ```fish
    _awabbre-pkgs_lazybind_map_bulk \
        --packages=myGroup_{
          myPackage,
          myOtherPackage
        } \
        mycmd mycmd-extra
    ```

    Entering either command on the command-line loads both packages, in the listed order.
