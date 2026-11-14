---
comments: true
icon: lucide/chevron-left
description: Set prefixes tolerable by Base Command
---

# Base Prefix
Configure the prefixes that will be tolerated if they precede the [*Base Command*](../Arguments/Sub-Commands/Add/Switches/Base.md){data-preview}

<table>
  <tbody>
    <tr><td><strong>Name</strong></td><td><code>awabbre_prefix</code></td></tr>
    <tr><td><strong>Accepted Values</strong></td><td>Base Commands</td></tr>
    <tr><td><strong>Default</strong></td><td><code>run0</code> <code>sudo</code> <code>doas</code></td></tr>
  </tbody>
</table>   

!!! example "Elevation with `run0`"
    If `$awabbre_prefix` is set to `run0`, then all abbreviations would expand even if the actual *Base Command* is preceded by `run0` for privilege escalation.

    ```fish {title="Command"}
    awabbre add --base=cp -- -r --recursive
    ```
    If you create the preceding abbreviation while `$awabbre_prefix` is set to `run0`, the expansion would be performed regardless if the command is prepended by `run0`; that is, it would work for both the following command-line buffers:

    - `cp -r` → `cp --recursive`
    - `run0 cp -r` → `run0 cp --recursive`

## Values
The variable can have any number of tokens.

These tokens are *Base Commands* that, if added to `$awabbre_prefix`, are ignored if encountered before the actual *Base Command*.

If no value is set, then the prefixes default to the tokens `run0`, `sudo`, and `doas`.

!!! warning "Prior Definition required"
    The value must be set prior to any abbreviation is added, or any packages are loaded.

    While fish-awabbre itself can adapt to the modified configuration value, Fish abbreviations are internally immutable; that is, you cannot override the *Base Commands* once defined.

## Affected Components
These are components that are affected any user configuration made to the `$awabbre_prefix`.

Moreover, one of these components, whichever is called first, automatically sets the value of `$awabbre_prefix` to the [default tokens](#values){data-preview} if it is not already set.

[Awabbre Manager](Awabbre-Manager/index.md){data-preview}
:   The individual awabbre manager creates awabbres that tolerate the prefixes set in `$awabbre_prefix` during expansions.

[Lazybind Repository Helper](Packages/Repository-Helpers/Lazybind/index.md){data-preview}
:   While matching the command-line, the Lazybind helper skips through any set prefixes. This is to avoid loading unnecessary packages when the user is not actually calling the *Base Command*.
