---
comments: true
icon: lucide/text-initial
description: These are the arguments that must precede on the command-line for the *Sub-Command* to be expanded.
---

# Initial Arguments
These are arguments to the [*Base Command*](../../Sub-Commands/Add/Switches/Base.md){data-preview} that, if specified, must precede the [*Sub-Command*](./Sub-Command.md){data-preview} on the command-line for the *Sub-Command* to be expanded.

## Details
Relation with other components
:   Upon expansion, passed *Initial Arguments* precede the *Expansion* in place of the *Sub-Command*, for the *Sub-Command* is replaced while leaving the *Initial Arguments* intact.

Variable Arguments
:   Each argument is separately passed, rather than passed as a single token. This is to ensure that the expansion occurs for equifinal token expansions.

!!! note "Always a positional"
    Unlike other *common values*, the *Initial Arguments* are always specified as positionals to all the `awabbre` sub-commands.

### Customizable Behavior
[:lucide-settings: Regard Flags](../../Sub-Commands/Add/Switches/Regard-Flags.md "Acknowledge flags in Initial Args"){data-preview .md-button .md-button--primary} Ignored Flags
:   Any flags found in the Initial Arguments on the command-line are ignored.
    That is, the *Initial Arguments* are matched without regard to any flags that may be present.

[:lucide-settings: Unprefix](../../Sub-Commands/Add/Switches/Unprefix.md "Deactivate `run0` toleration"){data-preview .md-button .md-button--primary} [Awabbre prefix](../../../Configuration/Check_Base-Command.md){data-preview} Acknowledgement
:   Any tokens comprising `$awabbre_prefix`, if found consequently before the Base Command, are ignored.

[:lucide-settings: Regular Expressions](../../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview .md-button .md-button--primary} Single Permutation
:   Due to Fish's internal abbreviation restrictions, you cannot have the same *Sub-Command*, *Base-Command*, and [*Initial Argument*](./Initial-Arguments.md){data-preview} permutations with plain text *Sub-Command* matching.

[:lucide-settings: Regular Expressions](../../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview .md-button .md-button--primary} Fixed String
:   Each [*Initial Argument*](./Initial-Arguments.md){data-preview} is plainly matched by default

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-command> … -- [<INITIAL_ARGUMENTS>] <Sub-Command> <Expansion>
awabbre list [<INITIAL_ARGUMENTS>] <Sub-Command>
```

!!! example
    !!! note "Indication"
        The [*Initial Arguments*](./Initial-Arguments.md){data-preview} are indicated in **Bold**

    - `#!fish awabbre add --base=jj ci commit` (does not use *Initial Arguments*)
    - `#!fish awabbre add --base=run0 -0c `**`nh os`**` switch 'switch % --bypass-root-check'`
    - `#!fish awabbre list --base=run0 --sub-command=switch `**`nh os`**
