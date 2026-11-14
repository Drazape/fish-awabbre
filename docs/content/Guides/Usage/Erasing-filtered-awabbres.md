---
comments: true
icon: lucide/broom
description: How to erase awabbres filtered with `awabbre list` in your current Fish environment.
---

# Erasing filtered awabbres
To erase all the context-aware abbreviations (awabbres) matched by your applied filter in your current Fish shell environment, simply pass the filtered list of identifiers to `awabbre erase` as arguments (positional):
```fish { title="Command" .no-select .no-copy }
awabbre erase (awabbre list <filter>)
```

!!! bug "Unknown function"
    Unlike most Fish programs, `awabbre` is made to have reproducible and automatic dependency management in Nix environments.  
    This niche case is [not supported in Fish][unknown-function-bug] versions [4.9.3](https://github.com/fish-shell/fish-shell/releases/tag/4.9.3 "GitHub release") and earlier.  
    Trying this command in unsupported versions would result an error, that claims that it didn't find the function `awabbre`.

    [unknown-function-bug]: https://github.com/fish-shell/fish-shell/issues/12996 "Fish bug tracker: error passing output between functions mutating the function path"

    For now, you can work this around the same way you work around the use of command substitutions in the place of the base commands:
    ```fish {title="Workaround"}
    begin
        set --local -- awabbre_identifiers (awabbre list [<filter>…])
        awabbre erase {$awabbre_identifiers}
    end
    ```

!!! example "Clear All"
    To clear all the abbreviations, simply don't apply a filter to `awabbre list`:
    ```fish { title="Command" .no-select }
    awabbre erase (awabbre list)
    ```
!!! example "Clear awabbre-pkgs_select whose sub-command is matched with RegExp"
    To clear all the abbreviations whose sub-command is matched with a RegExp, set the match type to `regex`:
    ```fish { title="Command" .no-select }
    awabbre erase (awabbre list --match=regex)
    ```
!!! example "Clear awabbre-pkgs_select for the Jujutsu command"
    To clear all the awabbres for the Jujutsu command, pass the [*Base Command*](../../Reference/Arguments/Sub-Commands/List/Switches/Base.md){data-preview} for it to `awabbre list`:
    ```fish { title="Base Command" .no-select }
    awabbre erase (awabbre list --base=jj)
    ```
    ---
    You can further filter awabbres down to ones that expand arguments to the `rebase` sub-command of Jujutsu.  
    To do so, pass the name of the sub-command as a positional argument to `awabbre list`:
    ```fish { title="Rebase Sub-command" .no-select }
    awabbre erase (awabbre list --base=jj rebase)
    ```

    To learn about more filtering options, see [*List* sub-command](../../Reference/Arguments/Sub-Commands/List/index.md){data-preview}.


!!! info "Working"
    This works similarly to how [commands in the Pacman package manager][Pacman-removing-unused-packages] work.

    [Pacman-removing-unused-packages]: https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans) "example from Arch Wiki: Tips and Tricks: Removing unused packages"

    1. the `list` sub-command outputs identifiers for all the abbreviations found that are context-aware—separated by newline.
    2. Fish's command substitution converts said output into a list of identifiers.
    3. The entire list is passed to the `erase` sub-command, clearing all the awabbres.
