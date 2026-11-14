---
comments: true
icon: lucide/terminal
description: Map a single command to multiple packages
---

# Command to Packages
The command-to-packages library function is used to map a single Base Command to multiple packages in a single call.

## Use case
Use `_awabbre-pkgs_lazybind_map_command-pkgs` for a Base Command which is provided by several different packages.

## Usage
Pass the Base Command first, followed by the packages which provide it.

```fish
_awabbre-pkgs_lazybind_map_command-pkgs \
    <Base Command> \
    <Package foo> \
    [<Package bar>] \
    [<Package baz>]
    …
```

All the packages passed are mapped to the Base Command.  
The packages are mapped in the order they are specified, which is also the order in which they are loaded when the Base Command is entered.  
As such, it is recommended to list each package on a separate line for better readability.

!!! example "Illustrative mapping"
    Given a Base Command `mycmd` which is provided by both `myGroup_myPackage` and `myGroup_myOtherPackage`:
    ```fish
    _awabbre-pkgs_lazybind_map_command-pkgs \
        mycmd \
        myGroup_myPackage myGroup_myOtherPackage
    ```

    Entering `mycmd` on the command-line loads both packages, in the listed order.
