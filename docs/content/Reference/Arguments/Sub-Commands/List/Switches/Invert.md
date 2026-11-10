---
comments: true
icon: lucide/rotate-ccw
description: Invert the filters applied applied to the abbreviations that to be listed
---

# Invert
Invert the filters applied using the other arguments, to the abbreviations that to be listed

## Properties
<table>
  <tbody>
    <tr><td><strong>Value</strong></td><td>None</td></tr>
    <tr><td><strong>Short</strong></td><td><code>i</code></td></tr>
    <tr><td><strong>Long</strong></td><td><code>invert</code></td></tr>
    <tr><td><strong>Sub-Command</strong></td><td><a href="../index.md" data-preview>List</a></td></tr>
    <tr><td><strong>Inherited</strong></td><td>❌ false</td></tr>
  </tbody>
</table>   

The command can invert both the [positionals][positionals]{data-preview}, and the switches applied.

!!! example "List abbreviations not made for Jujutsu"
    ```fish {title="Command"}
    awabbre list --invert jj
    ```


[positionals]: ../Positionals.md
