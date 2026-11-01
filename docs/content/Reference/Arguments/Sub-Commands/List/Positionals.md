---
comments: true
icon: lucide/gallery-horizontal-end
description: Filter the listed identifier by their command-line arguments.
---

# Positionals
[List](./index.md){data-preview} accepts [Initial Arguments][initials]{data-preview} as its positionals

After they are provided, only the context-aware abbreviations that match for the same *Initial Arguments* as the ones provided positional arguments are listed.

!!! example "List identifiers filtered by sub-commands"
    ```fish {title="Jujutsu bookmark"}
    awabbre list bookmark
    ```
    ```fish {title="filter awabbres using prefixes by their actual “Base Commands”"}
    awabbre list --base={$awabbre_prefix} nh
    ```

[add]: ../Add/index.md
[expansion]: ../../Common-Values/Components/Expansion.md
[initials]: ../../Common-Values/Components/Initial-Arguments.md
