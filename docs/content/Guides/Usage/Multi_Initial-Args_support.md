---
comments: true
icon: lucide/landmark
description: Work-around for multiple different *Initial Arguments* permutations
---

# Multi *Initial Args* support
whenever the same [*Sub-Command*][subcommand]{data-preview} is being abbreviated more than once in the same [*Base Command*][add-base]{data-preview} (different [*Initial Arguments*][initials]{data-preview}), context-aware abbreviations (awabbres) must use the [*Regular Expressions* switch][regexp]{data-preview} with at least the `subcommand` scope.  

!!! info "Reason: `abbr` limitation"
    The reason is that internally in Fish, you can't have more than one abbreviation for a *Sub-Command* and *Base Command* pair without using the *Regular Expression* switch.  

    This is because of the implementation of Fish's builtin [abbreviations][internal-interactive-abbreviations].  
    the [built-in `abbr` command][internal-abbreviations-command] identifies an abbreviation as a pair of the *Sub-Command* and *Base Command*, and an identifier can be assigned to only a single abbreviation.

    An attempt to create any more with different *Initial Arguments* will result in overwriting of the older one — because the *Initial Arguments* are a concept exclusive to awabbres.  

    Such a scenario is worked-around using the *Regular Expression* flag.  
    When used, this flag allows us to have custom identifiers for the abbreviations.  
    Therefore, `awabbre` internally uses the built-in `abbr` command's *Function* switch to parse the `commandline`, letting one create as many abbreviations for the same *Sub-Command* as one wants.

## Cases
!!! tip "Different *Initial Args*"
    If your use case meets the following conditions:

    - The *Sub-Command* is at the same index in all the occurrences
    - The *Expansion* is the same

    you should instead use *Regular Expressions* for the *Initial Arguments*.

    !!! example "Jujutsu: *interactive* flag"
        The same flag, `--interactive`, can be used on 4 different sub-commands of `jj`.
        
        You could create 4 different context-aware abbreviations (awabbres) as follows:
        ```fish { title="Not recommended: Multiple Sub-Command RegExp definitions" }
        awabbre add --regex=sub-command --base=jj -- commit -i --interactive
        awabbre add --regex=sub-command --base=jj -- restore -i --interactive
        awabbre add --regex=sub-command --base=jj -- split -i --interactive
        awabbre add --regex=sub-command --base=jj -- squash -i --interactive
        ```

        While the preceding combination works, you should instead create a single non-redundant awabbre; like one with the following definition:
        ```fish { title="Recommended: Single non-redundant definition" .no-select }
        awabbre add --regex=initials --base=jj -- 'commit|restore|split|squash' -i --interactive
        ```

        !!! success "Minimal Awabbre created"
            Now `-i` will expand to `--interactive` whenever encountered after any of the specified 4 sub-commands of `jj`.

### Different Indexes
You need to use this workaround in case the same *Sub-Command* is used at different indexes of positionals.
!!! example "Jujutsu: `log`"
    For both `jj operation l` and `jj l` to co-exist (even if they have the same expansion), you must create 2 context-aware abbreviations (awabbres).
    ```fish {title="Definitions"}
    awabbre add --base=jj --regex=sub-command -- l{,og}
    awabbre add --base=jj --regex=sub-command -- operation l{,og}
    ```

### Different *Expansions*
The easiest way to create such awabbres is creating them as separate abbreviations.
!!! example "Jujutsu: different `-r` expansions"
    In Jujutsu, the sub-commands `diff` and `log` both accept the `-r` short flag, but long variants slightly differ for each of the sub-command.  
    For `log` the long variant is `--revision`; while for `diff`, it's `--revisions` (notice the `s` suffix).

    We can simply use *Regular Expressions* on the *Sub-Command* to add them as separate awabbres that can co-exist.
    ```fish {title="definitions"}
    awabbre add --base=jj --regex=sub-command -- log -r --revision
    awabbre add --base=jj --regex=sub-command -- diff -r --revisions # (1)!
    ```

    1. the `s` suffix on the `--revisions` expansion for the `diff` sub-command is abscent in the `--revision` expansion for the `log` sub-command.

!!! info "Alternative with a single abbreviation"
    In this case, you can combine *Regular Expressions* on the *Initial Arguments* (instead of the *Sub-Command*), along with the [*Expander*][expander]{data-preview} switch to achieve equivalent results.

    To achieve that, you would match all the different Initial Arguments that are accepted with *Regular Expressions*, and use the *Expander* to parse the command-line.  
    For the expanders output, you would map the *Initial Arguments* to the respective [*Expansions*][expansion]{data-preview}.

    !!! note "No Limitations"
        All the arguments in an index by a single abbreviation in the lowest-level back-end.  
        We don't do that simply because that wouldn't be convenient.


[relevant Fish discussion](https://github.com/fish-shell/fish-shell/discussions/11682 "GitHub discussion on the Fish Shell repository"){ data-preview .md-button .md-button--primary }

[internal-abbreviations-command]: https://fishshell.com/docs/current/cmds/abbr.html "The internal abbreviation backend used by awabbre"
[internal-interactive-abbreviations]: https://fishshell.com/docs/current/interactive.html#abbreviations

[initials]: ../../Reference/Arguments/Common-Values/Components/Initial-Arguments.md
[subcommand]: ../../Reference/Arguments/Common-Values/Components/Sub-Command.md
[expansion]: ../../Reference/Arguments/Common-Values/Components/Expansion.md
[regexp]: ../../Reference/Arguments/Sub-Commands/Add/Switches/Regular-Expression.md
[expander]: ../../Reference/Arguments/Sub-Commands/Add/Switches/Expander.md
[add-base]: ../../Reference/Arguments/Sub-Commands/Add/Switches/Base.md
