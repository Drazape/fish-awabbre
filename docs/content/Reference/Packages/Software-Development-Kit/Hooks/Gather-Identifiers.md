---
comments: true
icon: lucide/id-card
description: Trigger before gathering identities
---

# Gather Identifiers
<table>
  <tbody>
    <tr><td><strong>Trigger</strong></td><td>Before gathering identities</td></tr>
    <tr><td><strong>Event</strong></td><td><code>awabbre_gather-identifiers</code></td></tr>
  </tbody>
</table>   

## Tokens
The hook functions may be passed the following fixed tokens as arguments.  
These tokens are optional data scopes that `awabbre` has requested:
`commands`
:   These are commands the `abbr` built-in internally looks for. Other than the [Base Command][base-command-add-switch]{data-preview}, it also includes all the [prefix][prefix-config]{data-preview} tokens.

[base-command-add-switch]: ../../../Awabbre-Manager/Arguments/Sub-Commands/Add/Switches/Base.md
[prefix-config]: ../../../Prefix.md

`description`
:   This is the internal description passed to the `abbr` built-in by `awabbre`. It embeds all the information passed to [Add][add-subcommand]{data-preview}, other than the Base Commands and the [Initial Arguments][initials-positional]{data-preview}, for they are already embedded in the identifier.

[add-subcommand]: ../../../Awabbre-Manager/Arguments/Sub-Commands/Add/index.md
[initials-positional]: ../../../Awabbre-Manager/Arguments/Common-Values/Components/Initial-Arguments.md

## Example Use: universal identity management
### Problem: unloaded awabbres
Take a case of a package that loads context-aware abbreviation (awabbres) by an unofficially supported method.  
With this method, instead of loading the awabbre during shell initialization, the awabbre is loaded on a certain condition, later in the shell session, solely for the purpose of optimizing resource usage.  
In this scenario, the user might not be able to [list][list-subcommand]{data-preview} or [erase][erase-subcommand]{data-preview} awabbres because the awabbre is not loaded yet.

[list-subcommand]: ../../../Awabbre-Manager/Arguments/Sub-Commands/List/index.md
[erase-subcommand]: ../../../Awabbre-Manager/Arguments/Sub-Commands/Erase.md

### Solution
Besides the optimized condition, the package can also load the awabbre when the user attempts to list or erase awabbres; that is, by listening to the `awabbre_gather-identifiers` event.
