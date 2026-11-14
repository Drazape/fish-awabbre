---
comments: true
icon: lucide/gallery-horizontal-end
description: Restrict definition outputs to specified identifiers
---

# Positionals
| Value | Count | Presence |
| :---: | :---: | :------: |
| [Identifier](../../Common-Values/Identifier.md) | variable | optional |

## Details
Selective
:   To get the definitions of certain abbreviations, use their [identifier](../../Common-Values/Identifier.md){data-preview} obtained from the [List sub-command](../List/index.md "Get identities of loaded abbrs"){data-preview}
All
:   If no positionals are provided, the definitions for all the abbreviations will be shown

## Usage
```fish {title="Format}
awabbre show [<switches>…] [<IDENTIFIER>…]
```
