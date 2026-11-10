---
comments: true
icon: lucide/flag
description: Acknowledge flags part of the *Initial Arguments*
---

# Regard Flags
Acknowledge the flag tokens part of *Initial Arguments*

## Properties
<table>
  <tbody>
    <tr><td><strong>Value</strong></td><td>None</td></tr>
    <tr><td><strong>Short</strong></td><td><code>s</code></td></tr>
    <tr><td><strong>Long</strong></td><td><code>regard-flags</code></td></tr>
    <tr><td><strong>Sub-Command</strong></td><td><a href="../index.md" data-preview>Add</a></td></tr>
    <tr><td><strong>Inherited</strong></td><td>❌ false</td></tr>
  </tbody>
</table>   

## Details
Relation
:   [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding *Sub-Command*"){data-preview} (command-line): flags — when found to be one of the [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding *Sub-Command*"){data-preview} — aren't ignored, and must match for the expansion to occur

Use-case
:   Abbreviations only meaningful with a specific flag

Effect
:   It doesn't affect the passed *Initial Arguments*'s parsing, but makes abbreviations with flags passed (before `--`, obviously) expandable

!!! info "Implementation"
    It otherwise uses the `argparse` built-in to filter the flags (ignoring positionals after `--` disguised as “flags”)

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-commands>… {-s|--regard-flags} -- <initials-with-flags> <subcommand> <expansion>
```

!!! example
    #### `eza` Git status only in the long form with icons
    Only show the Git status of files when in the long form, and icons are turned on
    ```fish {title="command" .no-select}
    awabbre add -s --base=eza -- --long --icons{,\ --git}
    ```
