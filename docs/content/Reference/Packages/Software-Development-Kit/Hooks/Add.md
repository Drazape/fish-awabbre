---
comments: true
icon: lucide/circle-plus
description: Trigger for awabbre creation
---

# Add
<table>
  <tbody>
    <tr><td><strong>Trigger</strong></td><td>After awabbre creation</td></tr>
    <tr><td><strong>Event</strong></td><td><code>awabbre_add</code></td></tr>
  </tbody>
</table>   

## Tokens
When the event is emitted, the following arguments are passed to the hook functions:
- all the tokens passed by the user (to the [*Add* sub-command][add-subcommand]{data-preview} of `awabbre`), as is.
- the identifier of the created awabbre as an additional final argument (after the [*Expansion*][expansion-positional]{data-preview}).

[expansion-positional]: ../../../Awabbre-Manager/Arguments/Common-Values/Components/Expansion.md
[add-subcommand]: ../../../Awabbre-Manager/Arguments/Sub-Commands/Add/index.md

## Example Uses
- Validation of created awabbres
	* Generating specialized error messages and warnings
	* Prompting the user to erase potentially invalid ones
- Resolving conflicts with existing awabbres
- Logging of created awabbres
