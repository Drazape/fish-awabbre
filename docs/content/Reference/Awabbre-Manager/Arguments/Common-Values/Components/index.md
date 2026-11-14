---
status: index
comments: true
icon: lucide/list-ordered
description: The positional arguments that define an awabbre.
---

# Components
Components of an awabbre that define the command-line shape that an awabbre matches and the text it expands to.

## Properties
| Name | Presence | Purpose |
| :--: | :------: | ------- |
| [Initial Arguments](Initial-Arguments.md){data-preview} | Variable (minimum 1) | Arguments that must precede the sub-command before it expands. |
| [Sub-Command](Sub-Command.md){data-preview} | Required | The single token that is matched and replaced. |
| [Expansion](Expansion.md){data-preview} | Required | The replacement string; accepted only by [Add](../../Sub-Commands/Add/index.md){data-preview}. |
