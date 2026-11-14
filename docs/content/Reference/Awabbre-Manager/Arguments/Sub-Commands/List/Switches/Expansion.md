---
status: new
comments: true
icon: lucide/expand
description: Only list identifiers with the specified expansion token
---

# Expansion
Filter listed abbreviations to only those abbreviations that expand to the specified [*Expansion* value](../../../Common-Values/Components/Expansion.md){data-preview}.

## Properties
<table>
  <tbody>
    <tr><td><strong>Value</strong></td><td>Required</td></tr>
    <tr><td><strong>Short</strong></td><td><code>E</code></td></tr>
    <tr><td><strong>Long</strong></td><td><code>expansion</code></td></tr>
    <tr><td><strong>Sub-Command</strong></td><td><a href="../index.md" data-preview>List</a></td></tr>
    <tr><td><strong>Inherited</strong></td><td>❌ false</td></tr>
  </tbody>
</table>   

!!! example "List abbreviations that expand to `commit`"
    ```fish
    awabbre list --expansion=commit
    ```

!!! example "List abbreviations that expand to 8 letter tokens"
    ```fish
    awabbre list --value-regexp=expansion --expansion='^.{8}$'
    ```
