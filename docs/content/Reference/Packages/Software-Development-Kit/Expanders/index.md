---
comments: true
icon: lucide/maximize-2
description: Dynamic replacement
---

# Expanders
Library functions called by `awabbre` (used as the [*Expander*](../../../Awabbre-Manager/Arguments/Sub-Commands/Add/Switches/Expander.md){data-preview} function) for expansion.

These are abstractions that can be used instead of using custom functions from scratch to reduce boilerplate code.  
These functions are simply input/output converters; they parse the text inputted to them and generate a result which can be used as the replacement string.

## Functions
| Function | Summary |
| -------- | ------- |
| [Append](Append.md){data-preview} | Append a string to the sub-command instead of replacing it. |

## Uses
- Directly as the [*Expander*](../../../Awabbre-Manager/Arguments/Sub-Commands/Add/Switches/Expander.md){data-preview} for simple awabbres
!!! note "sub-command pass"
    In this case, the last argument to the function is always the sub-command matched on the command-line
!!! info "Usage"
    ```fish { title="Expander" .no-copy .no-select }
    awabbre add --expander (?:--) <args> <EXPANDER_FUNCTION>
    ```
- Wrapped
	- Another *Expander*
	- A [Wrapper](../Wrappers/)
