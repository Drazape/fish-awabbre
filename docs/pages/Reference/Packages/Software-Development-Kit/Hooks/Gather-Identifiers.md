---
comments: true
icon: lucide/id-card
description: Trigger before gathering identities
---

# Gather Identifiers
| Trigger | Event |
| :-----: | :---: |
| Before gathering identities | `subabbr_gather-identifiers` |

## Tokens
No tokens are passed to the hook function when the event is emitted.
## Example Use: universal identity management
### Problem: unloaded abbreviations
Take a case of a package that loads context-aware sub-command abbreviation by an unofficially supported method.  
With this method, instead of loading the abbreviation during shell initialization, the abbreviation is loaded on a certain condition, later in the shell session, solely for the purpose of optimizing resource usage.  
In this scenario, the user might not be able to [list][list-subcommand]{data-preview} or [erase][erase-subcommand]{data-preview} abbreviations because the abbreviation is not loaded yet.

[list-subcommand]: ../../../Arguments/Sub-Commands/List/index.md
[erase-subcommand]: ../../../Arguments/Sub-Commands/Erase.md

### Solution
Besides the optimized condition, the package can also load the abbreviation when the user attempts to list or erase abbreviations; that is, by listening to the `subabbr_gather-identifiers` event.
