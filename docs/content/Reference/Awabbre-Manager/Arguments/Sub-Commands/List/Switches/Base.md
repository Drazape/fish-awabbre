---
comments: true
icon: lucide/terminal
description: List identifiers that accept all the specified Base Commands
---

# Base
Filter out the abbreviations that don't accept all the *Base Commands* specified as the value

## Properties
<table>
  <tbody>
    <tr><td><strong>Value</strong></td><td>Optional</td></tr>
    <tr><td><strong>Short</strong></td><td><code>b</code></td></tr>
    <tr><td><strong>Long</strong></td><td><code>base</code></td></tr>
    <tr><td><strong>Sub-Command</strong></td><td><a href="../index.md" data-preview>List</a></td></tr>
    <tr><td><strong>Inherited</strong></td><td>❌ false</td></tr>
  </tbody>
</table>   

!!! note "Logical And"
    The listed identifiers must accept all the *Base Commands* specified as the value, not just one of them.
    In other words, when this switch is specified, the list of identifiers will be filtered to only include those that accept all the *Base Commands* specified as the value.

!!! note "Reusable with Add"
    To find abbreviations, you can use the same *Base* flag tokens that were used to create the abbreviation with the [Base flag of the Add sub-command][base-of-add]{data-preview}.


!!! example "List all abbreviations defined for Jujutsu"
    ```fish
    awabbre list --base=jj
    ```

!!! example "List all abbreviations defined for Nix helpers"
    ```fish
    awabbre list --base={nix,nh}
    ```

[base-of-add]: ../../Add/Switches/Base.md
