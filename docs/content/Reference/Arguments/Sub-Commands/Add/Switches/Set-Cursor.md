---
comments: true
icon: lucide/map-pin
description: Position the cursor at the separator present in the Expansion
---

# Set Cursor
Position the cursor at the separator present in the [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview}

## Properties
|   Value  | Short |      Long    | Sub-Command | Inherited |
| :------: | :---: | :----------: | :---------: | :-------: |
| Optional |  `c`  | `set-cursor` | [Add](../index.md){data-preview} | ✅ true |


### Value
Position (default: `%`)
:   The string included in the *Expansion* that is replaced with the cursor

## Details
Miscellaneous details about the switch

### Behavior
- The cursor is put in a specific spot in the [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview} (as with the `abbr` built-in, a *space* is still appended after the *Expansion* token); said spot is where the *Position* is located in the *Expansion*.
- The *Position* is deleted from the *Expansion*, with the user's cursor taking its place.
- To avoid unexpected behavior, the *Expansion* must not include the *Position* as a sub-string before the actual *Position* itself;

### Use-case
Putting arguments after the cursor; when there are arguments that need positioned before a specific argument

!!! info "Implementation"
    It is directly passed to the `abbr` built-in, along with the value

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-command>… --set-cursor [<creation-flags>…] -- [<initials>] <sub-command> <expansion>
```
