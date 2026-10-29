---
status: new
comments: true
icon: lucide/expand
description: Only list identifiers with the specified expansion token
---

# Expansion
Filter listed abbreviations to only those abbreviations that expand to the specified [*Expansion* value](../../../Common-Values/Components/Expansion.md){data-preview}.

## Properties
| Value | Short | Long | Sub-Command | Inherited |
| :---: | :---: | :--: | :---------: | :------- |
| Required | `E` | `expansion` | [List][list]{data-preview} | ❌ false |

!!! example "List abbreviations that expand to `commit`"
    ```fish
    awabbre list --expansion=commit
    ```

!!! example "List abbreviations that expand to 8 letter tokens"
    ```fish
    awabbre list --value-regexp=expansion --expansion='^.{8}$'
    ```
