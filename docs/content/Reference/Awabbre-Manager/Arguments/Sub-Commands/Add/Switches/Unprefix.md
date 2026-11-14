---
comments: true
icon: lucide/arrow-big-down-dash
description: Deactivate `$awabbre_prefix` command-prefix toleration
---

# Unprefix
Deactivate toleration of tokens part of [`$awabbre_prefix`][prefix-config]{data-preview} when encountered before the Base Command

[prefix-config]: ../../../../Configuration/Prefix.md

Normally, if a token from `$awabbre_prefix` precedes the Base Command on the command-line, it is ignored, and the abbreviation is still performed.  
With this switch enabled for the respective abbreviations, those tokens are no longer respected.

## Properties
<table>
  <tbody>
    <tr><td><strong>Value</strong></td><td>None</td></tr>
    <tr><td><strong>Short</strong></td><td><code>0</code></td></tr>
    <tr><td><strong>Long</strong></td><td><code>unprefix</code></td></tr>
    <tr><td><strong>Sub-Command</strong></td><td><a href="../index.md" data-preview>Add</a></td></tr>
    <tr><td><strong>Inherited</strong></td><td>❌ false</td></tr>
  </tbody>
</table>   

## Details
Relation
:   *Initial Arguments*: an argument that is one of `$awabbre_prefix` would no longer be specially tolerated

Use-case
:   For abbreviating commands that must be elevated for the expansion to occur

!!! note "internally handled base-prefix: `exec`"
    The command prefix `exec` is especially internally respected, with no switch to available to deactivate the behavior.

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-command> … <UNPREFIX-FLAG> (?:`--`) …
```

!!! example "Expanding only with `run0`"
    Only bypass *root check* on an attempt to run as `root`
    ```fish {title="command" .no-select}
    awabbre add -0c --base=run0 nh os switch{,' % --bypass-root-check'}
    ```

!!! example "abbreviating `run0`"
    The following awabbre definition adds the `--empower` flag when `touch` is used with `run0`.
    ```fish {title="command" .no-select}
    awabbre add --unprefix --base=run0 -- {,--empower\ }touch
    ```
    Here, *Unprefix* is used since you typically wouldn't prefix `run0`—the prefixes are usually elevation commands.
