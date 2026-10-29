---
status: new
comments: true
icon: lucide/replace
description: Only list identifiers that expand the specified Sub-Command
---

# Sub-Command
Filter listed abbreviations to only those abbreviations that expand the specified [*Sub-Command* value](../../../Common-Values/Components/Sub-Command.md){data-preview}.

## Properties
| Value | Short | Long | Sub-Command | Inherited |
| :---: | :---: | :--: | :---------: | :-------: |
| Required | `S` | `sub-command` | [List][list]{data-preview} | ❌ false |

!!! example "List abbreviations that expand `ci`"
    ```fish
    awabbre list --sub-command=ci
    ```

!!! example "List abbreviations that expand 4 letter tokens"
    ```fish
    awabbre list --value-regexp=sub-command --sub-command='^.{4}$'
    ```
