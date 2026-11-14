---
comments: true
icon: lucide/workflow
description: Lazy Bind helper usage reference
---

# Lazy Bind
The Lazy Bind repository helper (`awabbre-pkgs_lazybind`), once called, lazily loads packages into the session.  
By *lazily*, it is meant that the package is not loaded into the session until one of the Base Commands it provides packages for is entered on the command-line.

!!! info "Skipping through prefixes"
    If any [global prefixes](../../../Prefix.md){data-preview} are encountered on the command-line, the loader binded by the helper skips through them and continues to search for the Base Command in the remaining arguments.

## Usage


## Compliance

!!! info "Triggering of packages"

!!! info "Abbreviation directory simulation"
