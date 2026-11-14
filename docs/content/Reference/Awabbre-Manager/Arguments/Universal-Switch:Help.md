---
comments: true
icon: lucide/life-buoy
description: Show a reference manual for the given sub-command
---

# Universal Switch: Help
Show a reference manual for the given sub-command

## Properties
<table>
  <tbody>
    <tr><td><strong>Value</strong></td><td>None</td></tr>
    <tr><td><strong>Short</strong></td><td><code>h</code></td></tr>
    <tr><td><strong>Long</strong></td><td><code>help</code></td></tr>
  </tbody>
</table>   

## Details
Universal
:   This switch is supported by all the sub-commands (and without any)

Relation with other arguments
:   All the other switches are ignored with this one

Use
:   Doesn't do any operation. Only for recalling command usage.

!!! info "Implementation"
    It uses [*fish-helpText*](https://github.com/Drazape/fish-helpText "Fish library to generate formatted ANSI reference texts"){data-preview} for transpiling the input into ANSI

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre [<sub-command>…] --help
```

!!! info "Insignificance of Arguments"
    Any other arguments (`…`) have no significance
