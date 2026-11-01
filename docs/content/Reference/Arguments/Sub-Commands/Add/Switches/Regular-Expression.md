---
comments: true
icon: lucide/equal-approximately
description: Match command-line arguments with *Regular Expression*s
---

# Regular Expression
Match certain command-line arguments with *Regular Expressions* rather than fixed strings that match exactly.

## Properties
|       Values        | Short |   Long  | Sub-Command |    Inherited       |
| :-----------------: | :---: | :-----: | :---------: | :----------------: |
| Multiple & Optional |  `r`  | `regex` | [Add](../index.md){data-preview} | ✅ true (extended) |

## Details
The following sections describe various miscellaneous details about the switch:

### Values
`sub-command` (default)
:   Applies to the [*Sub-Command*](../../../Common-Values/Components/Sub-Command.md "Args preceding *Sub-Command*"){data-preview}

`initials`
:   Applies to the [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding"){data-preview}

!!! note "Both in the same awabbre"
    You can use both values in the same awabbre definition.  
    To do so, specify both the values in separate `--regex` flags; that is, pass the following 2 arguments: `--regex=sub-command` `--regex=initials`

### Relation
- The *Sub-Command*/*Initial Arguments* turn into a RegExp instead of a fixed string
- The *Sub-Command* is still passed as a positional; this flag only changes how it is interpreted.

!!! note "Difference with the `abbr` built-in"
    This is in contrast to the `abbr` built-in where, if the flag is used, you can directly pass the RegExp sub-command to the flag.

- This switch is essential for multiple *Base Command*, and *Initial Arguments* permutations paired with the same *Sub-Command* at the same index (restriction of the `abbr` built-in)

!!! tip "Workaround Permutations"
    To bypass the permutation limitation, you must use `--regex=sub-command` even when the *Sub-Command* isn't actually a RegExp.  
    In this case, escape the said *Sub-Command* with `string escape --style=regex` so that it is still interpreted literally.

### Single Token
The *Regular Expression* is only matched against the individual arguments at their respective indexes (not the entire command-line at once)

!!! note "Same boundaries as the `abbr` built-in"
    When matching tokens on the command-line (both `sub-command` and `initials`), no leading or trailing tokens are matched by default.
    That is, the inputted query is wrapped as follows: `^(QUERY)$`, retaining the behavior from the `abbr` built-in
    !!! example "Example invalid query"
        The query `QUERY` does not match the target `prefix-QUERY-suffix`

    If you aim for the default behavior of `string match --regex`, you must explicitly match the characters around your query by surrounding the said query with the `.*` Regexp pattern.
    !!! example "Matching query by mitigating boundaries"
        The query `.*QUERY.*` matches the query `prefix-QUERY-suffix`.

### Use-case
Matching command-line arguments dynamically
!!! tip "Switch Combo"
    Pair it with [*Expander*](Expander.md "Use a command's output as the *Expansion*"){data-preview} to generate [*Expansions*](../../../Common-Values/Components/Expansion.md "replacement string"){data-preview} based on the current command-line

!!! info "Implementation"
    Sub-Command
    :   It is directly passed to the `abbr` built-in with the *Sub-Command* as the value

    Initial Arguments
    :   [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding"){data-preview} are manually matched, for they are a `awabbre` exclusive feature.

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-commands>… --regex[=<value>…] [<creation_flags>…] -- [<initials>] <sub-command> <expansion>
```
