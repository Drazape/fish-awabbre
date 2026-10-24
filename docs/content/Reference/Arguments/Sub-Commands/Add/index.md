---
comments: true
icon: lucide/circle-plus
description: Create context-aware sub-command abbreviations
---

# Add
Create context-aware sub-command abbreviations

## Properties
|  Name | Parent |
| :---: | :----: |
| `add` |  None  |

## Arguments
Command-line arguments accepted by the *Add* sub-command
### Positionals
1. [**Initial Arguments**](../../Positionals/Initial-Arguments.md){data-preview}: precedes the [*Sub-Command*](../../Positionals/Sub-Command.md){data-preview}. Becomes the new *Initial Arguments* for *Expansion*  
2. [**Sub-Command**](../../Positionals/Sub-Command.md){data-preview}: The *Sub-Command* to be replaced (expanded) by the [*Expansion*](../../Positionals/Expansion.md){data-preview}. Comes after the [*Initial Arguments*](../../Positionals/Initial-Arguments.md){data-preview}
3. [**Expansion**](../../Positionals/Expansion.md){data-preview}: The replacement ([*Expansion*](../../Positionals/Expansion.md){data-preview}) of the typed *Sub-Command*. Becomes the new *Sub-Command* for the *Initial Arguments*
### [Local Switches](./Switches/index.md){data-preview}

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr add --base=<base_commands>… [<creation_flags>] -- <initials> <sub-command> <expansion>
```
