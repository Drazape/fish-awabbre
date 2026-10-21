---
comments: true
icon: lucide/arrow-right
description: Escape awabbre definitions as if they were to be passed to the shell
---

# Switch: Escape
Change the definitions output to be escaped as if they were to be passed to the shell.

## Properties
| Value | Short | Long | Sub-Command | Inherited |
| :---: | :---: | :--: | :---------: | :-------: |
| None | `e` | `escape` | [Show][show] | No |

## Description
By default, the definitions are printed just as they are stored after being parsed by the shell into separate elements.

With this switch enabled, the definitions are turned back into unexpanded tokens, and escaped with quotes as if they are to be passed to the shell.

## Effect
If the switch is enabled, the following additional operations are performed on the definitions before they are printed:

### Escaping
If a value contains characters that are special to the shell, such as spaces, quotes, or backslashes, they will be escaped with quotes so that they can be safely passed to the shell.

!!! note "Lazy escaping"
    The escaping is done lazily, meaning that only the values that need to be escaped will be quoted.  
    Any values that don't need to be escaped remain unquoted.

### Brace unexpansion
If a flag accepts multiple values, and so are provided, they are turned into their unexpanded brace form.

!!! example "Change after applying switch"
    ```diff {title="Regular Expression scopes"}
    - --regex=initials --regex=sub-command
    + --regex={initials,sub-command}
    ```
    ```diff {title="Accepted Base Commands"}
    - --base=command foo --base=command bar
    + --base={'command-foo','command-bar'}
    ```
