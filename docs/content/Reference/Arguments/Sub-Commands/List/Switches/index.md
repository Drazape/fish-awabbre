---
status: index
comments: true
icon: lucide/flag
description: Switches accepted by the List sub-command.
---

# Switches
Switches accepted by the [List](../index.md){data-preview} sub-command to filter the listed identifiers.

| Switch | Long | Short | Value | Summary |
| ------ | ---- | ----- | ----- | ------- |
| [Base](Base.md){data-preview} | `base` | `b` | Optional, variable | Keep abbreviations that accept all specified base commands. |
| [Sub-Command](Sub-Command.md){data-preview} | `sub-command` | `S` | Required, single | Only list identifiers that expand the specified Sub-Command. |
| [Expansion](Expansion.md){data-preview} | `expansion` | `E` | Required, single | Only list identifiers that expand to the specified Expansion. |
| [Value RegExp](Value-RegExp.md){data-preview} | `regex` | `r` | None (toggle) | Interpret the supplied positionals as regular expressions. |
| [Invert](Invert.md){data-preview} | `invert` | `i` | None (toggle) | Invert the filters applied by the other arguments. |

Besides the switches previously tabulated, you can also use any of the other switches accepted by the [Add sub-command](../../Add/index.md){data-preview} to further filter out the identifiers based on what value was provided to them during their definition.
