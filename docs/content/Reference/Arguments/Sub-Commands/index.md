---
status: index
comments: true
icon: lucide/squares-subtract
description: Operations provided by the sub-abbr command.
---

# Sub-Commands
Operations that can be performed using `sub-abbr`.

## Sub-Commands
| Sub-Command | Operation | Positionals | Arguments |
| ----------- | --------- | ----------- | --------- |
| [Add](Add/index.md){data-preview} | Create a context-aware abbreviation. | [Initial Arguments][initials]{data-preview}, [Sub-Command][subcommand]{data-preview}, [Expansion][expansion]{data-preview} | [Switches](Add/Switches/index.md){data-preview} |
| [List](List/index.md){data-preview} | List identifiers of loaded abbreviations, optionally filtered. | [Initial Arguments][initials]{data-preview}, [Sub-Command][subcommand]{data-preview} | [Positionals](List/Positionals.md){data-preview}, [Switches](List/Switches/index.md){data-preview} |
| [Show](Show.md){data-preview} | Print definitions in the format accepted by Add. | Identifiers (optional; all when omitted) | — |
| [Erase](Erase.md){data-preview} | Erase abbreviations by identifier. | Identifiers | — |

[initials]: ../Positionals/Initial-Arguments.md
[subcommand]: ../Positionals/Sub-Command.md
[expansion]: ../Positionals/Expansion.md
