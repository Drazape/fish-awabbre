---
status: index
comments: true
icon: lucide/list-ordered
description: The positional arguments that define an abbreviation.
---

# Positionals
Positional arguments define the command-line shape that an abbreviation matches and the text it expands to.

## Positionals
| Positional | Position | Presence | Purpose |
| ---------- | -------- | -------- | ------- |
| [Initial Arguments](Initial-Arguments.md){data-preview} | `1`:`-3` | Variable (minimum 1) | Arguments that must precede the sub-command before it expands. |
| [Sub-Command](Sub-Command.md){data-preview} | `-2` | Required | The single token that is matched and replaced. |
| [Expansion](Expansion.md){data-preview} | `-1` | Required | The replacement string; accepted only by [Add](../Sub-Commands/Add/index.md){data-preview}. |
