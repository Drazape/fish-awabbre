---
comments: true
icon: lucide/fullscreen
description: Dynamically expand using a command's output as the *Expansion* string
---

# Expander
Dynamically expand using a command's output as the [*Expansion*][expansion]{data-preview} string

## Properties
|  Value | Short | Long | Sub-Command |      Inherited     |
| :----: | :---: | :----: | :-------: | :----------------: |
| None (toggle) | `e` | `expander` | Add | ✅ true (improved) |

## Details
Relation
:   The *Expansion* is determined by a command's output instead of a fixed string

Value
:   The command to execute for obtaining the replacement string

Single token
:   Like the `abbr` built-in, the *Expander* must only consist of a single command.

Use-case
:   Dynamically generating expansions based on the context.
!!! tip "“Discard” expansion"
    You can simulate abbreviation cancellation by using the expander to simply return the passed sub-command back.
!!! tip "Switch Combo"
    Pair it with [*Regular Expressions*][regexp]{data-preview} to generate *Expansions* based on a dynamic [*Sub-Command*][subcommand]{data-preview} on the command-line


!!! info "Implementation"
    Not passed to built-in `abbr`. The command is executed manually, though the expander accepts the same input as the built-in `abbr`.

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-commands>… --expander -- <initial-arguments> <sub-command> <EXPANDER_COMMAND>
```

### Command
Scope
:   Unlike Fish, the command can be anything and may even include custom arguments.  
    Even so, it is still a single token that is to be passed as if it is literally executed by the shell.

Argument
:   The *Expander* is called with the matched *Sub-Command* as the only argument

!!! tip "Sub-Command parameter in an Expander with arguments"
    In case of using hard-coded arguments in the expansion, the *Sub-Command* will additionally be the last argument.

[expansion]: ../../../Common-Values/Components/Expansion.md
[regexp]: ./Regular-Expression.md "Match command-line arguments with RegExp"
[subcommand]: ../../../Common-Values/Components/Sub-Command.md "Token to match & replace"
