---
comments: true
icon: lucide/replace
description: Only list identifiers that expand the specified Sub-Command
---

# Sub-Command
Filter listed context-aware abbreviations (awabbres) to only those awabbres that expand the specified [*Sub-Command* value](../../../Common-Values/Components/Sub-Command.md){data-preview}.

## Properties
<table>
  <tbody>
    <tr><td><strong>Value</strong></td><td>Required</td></tr>
    <tr><td><strong>Short</strong></td><td><code>S</code></td></tr>
    <tr><td><strong>Long</strong></td><td><code>sub-command</code></td></tr>
    <tr><td><strong>Sub-Command</strong></td><td><a href="../index.md" data-preview>List</a></td></tr>
    <tr><td><strong>Inherited</strong></td><td>❌ false</td></tr>
  </tbody>
</table>   

!!! example "List awabbres that expand `ci`"
    ```fish
    awabbre list --sub-command=ci
    ```

!!! example "List awabbres that expand 4 letter tokens"
    ```fish
    awabbre list --value-regexp=sub-command --sub-command='^.{4}$'
    ```
