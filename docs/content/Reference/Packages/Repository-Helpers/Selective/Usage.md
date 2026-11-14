---
comments: true
icon: lucide/hand-helping
description: Selective helper usage reference
---

# Usage
`awabbre-pkgs_select` accepts a single path to a package or a group, where each argument is an element to that path.

## Loading on Selection
Group
:   all the packages inside (including packages in the nested groups inside)

    !!! tip "Enable all packages"
        Specify the [Universal group](./Package-Tree.md#ranks){data-preview} (no arguments) to load all the installed packages.

Package
:   of course, only the selected package


## Activation Methods
For the package to be loaded by the Selective repository helper `awabbre-pkgs_select`, and be indexable by helpers compatible with the standard repository structure, the package must comply with some requirements specified based on how the function is distributed.

### Function naming convention
Regardless of how the function is distributed, it can be activated using the function naming convention method.

When compliant, the user can activate a group or package by selecting it with `awabbre-pkgs_select`.

To select an element—a group or a package—simply provide the path to the element as arguments to `awabbre-pkgs_select`.  
The path is a list of elements in the package tree, starting from the root group to the selected element.

```fish {title="Select a package"}
awabbre-pkgs_select [<group>…] [<package>]
```

### Event trigger (static functions only)
In case of static functions, you additionally have the choice of activate your [static][static-function]{data-preview}[^static-function] (non-[dynamic][dynamic-function]{data-preview}[^dynamic-function]) package with a [Fish event trigger][fish-events]{data-preview}.

[fish-events]: https://fishshell.com/docs/current/language.html#event-handlers "Official Fish documentation"

!!! warning "Unselective Activation"
    Packages that use this method can only be activated with `awabbre-pkgs_select` when the user chooses to activate all the packages—the only condition when `awabbre-pkgs_select` will trigger the event.  
    In other words, if the user chooses to selectively enable package groups or packages, the static package using this method will not be activated, and the abbreviations will not be available.

[static-function]: https://fishshell.com/docs/current/tutorial.html#startup-where-s-bashrc "Official Fish documentation"
[^static-function]: A function is statically distributed if it is part of the shell initialization configuration. Functions distributed as such are automatically loaded on the shell start-up; that is, it can be listed with `functions`

[dynamic-function]: https://fishshell.com/docs/current/tutorial.html#autoloading-functions "Official Fish documentation"
[^dynamic-function]: A function is dynamically distributed if it is distributed as a file in one of `$fish_function_path`; The file is sourced the first time the function is called

To utilize this feature, you must add a trigger to the package function for the event: `awabbre-pkgs`

```fish {title="Function Definition Format"}
function <arbitrary-name> --on-event=awabbre-pkgs
    … # body
end
```

---

!!! abstract "Explanation: File System example"
    Think of the package tree like the file system tree that you are familiar with — groups as directories, packages as files.  
    When you read a “directory,” instead of getting an error, you concatenate (source) all the files in the directory — as if you did
    ```fish {title="Concatenate each file in a directory"}
    for file in (path filter --type=file -- <dir>/**)
        read --null <{$file}
    end
    ```
    or the less efficient:
    `#!fish cat (path --filter --type=file -- <dir>/**)`
