---
status: new
comments: true
icon: lucide/workflow
description: Lazy Bind helper usage reference
---

# Lazy Bind
The Lazy Bind repository helper (`awabbre-pkgs lazybind`), once called, lazily loads packages into the session.  
By *lazily*, it is meant that the package is not loaded into the session until one of the Base Commands it provides packages for is entered on the command-line.

!!! info "Skipping through prefixes"
    If any [global prefixes](../../../../Prefix.md){data-preview} are encountered on the command-line, the loader binded by the helper skips through them and continues to search for the Base Command in the remaining arguments.

## Usage
The following sections describe how to activate lazy loading, and how to mask certain commands from triggering loading of packages.
### Activation
For activation, execute the Lazy bind helper function `awabbre-pkgs lazybind`.  
Once you do, the helper will start listening for Base Commands entered on the command-line.
Whenever a command is found, compliant packages are automagically loaded into the session.


### Masking
When a command is masked, the helper will not load any packages for it, even if it is a Base Command provided by a compliant package.

To mask a command, pass it as an argument to the `awabbre-pkgs lazybind` function.
```fish {title="Format"}
awabbre-pkgs lazybind [<masked-command>…]
```

!!! warning "Transient mask state"
    When the helper function is called, it only applies the changes to the current session.  
    For masking, that means the commands you pass as arguments will only be masked for the current session.

    Furthermore, if you call the helper function again, the previous mask state is lost and replaced by the new one.
    That is, it is not cumulative, and you will have to pass all commands you want to mask again.

!!! tip "Auto-activate session"
    If this is the helper of your choice, you can automatically activate the Lazy Bind helper with your applied filters on each shell session.  
    To do so, add the command along with your filters to your Fish's shell initialization configuration.

## Compliance
For a package to be compliant with the Lazy Bind helper, it must be mapped to a variable for each of the Base Commands the package awabbreviates.

When a Base Command is found on the command-line, the helper reads said variable and loads all the packages that comprise the variable.

As such, the variable name has the format
```env
_awabbre_pkgs_command_<escaped_baseCommand> = [<full-package-name>…] # (1)!
```

1. `full-package-name` is the exact function name that would be called by the helper. As such, the helper doesn't internally prefix the name to follow the naming convention.

The Base Command is escaped to be a valid variable name.  
To escape, Fish's built-in command `string escape --style=var` can be used on the Base Command.

!!! example "Definitions for official packages"
    Following are mappings for some of the official packages that are compliant with the Lazy Bind helper.

    !!! note "Showcase only"
        The following mappings are only to showcase the format.
        As such, these definitions are already included with the installed with fish-awabbre and you don't need to define them yourself.

        Furthermore, rather than manual definitions like the ones below, fish-awabbre uses the [mapping library](./Mapping-Library/index.md){data-preview} to define the mappings for all official packages.

        <table>
          <tbody>
            <tr><td><strong><code>_awabbre_pkgs_command_jj</code></strong></td><td><code>_awabbre_pkg_official_jj</code></td></tr>
            <tr><td><strong><code>_awabbre_pkgs_command_nh</code></strong></td><td><code>_awabbre_pkg_official_nix_nh</code></td></tr>
            <tr><td><strong><code>_awabbre_pkgs_command_nix</code></strong></td><td><code>_awabbre_pkg_official_nix_nix3</code></td></tr>
          </tbody>
        </table>   

!!! info "Model: completion directory, but for awabbres"
    The lazy bind helper is inspired by the completion directory model, but instead of completions, it is for awabbres.

    Since awabbres are fundamentally different from completions, their designs are also paramountly specialized.  
    Said difference is that command tab completions come from a single file, while awabbres can come from multiple packages.

    So instead of mapping commands to a single definition file, package developers include their packages in a variable that is mapped to the Base Command.

    Moreover, since completion files are simply Fish scripts that are sourced into the session, on the surface we could use them for awabbres.  
    But as previously attempted, this approach is not feasable because completion files are not instantaneously loaded when a command is entered on the command-line, and may need the user to press ++tab++ for the loading.

!!! info "Internal Design"
    ## Implementation
    The following sections describe the internal design and implementation details of the Lazy Bind helper.  
    As such, they are not relevant to the user.
    ### Requirements
    Unlike completions, awabbres must be loaded instantaneously when a Base Command is entered on the command-line; If they aren't, tokens may be flakily expanded.

    ### Trigger
    The Base Command is checked every time the user presses ++space++ on the command-line.  
    This is done by binding the internal loader `_awabbre-pkgs_lazybind_load` to the ++space++ key, which is the default key for token expansion.

    #### Working around side-effects
    When unbinded, the ++space++ key does 2 things:

    - It expands the token under the cursor, if any.
    - It, of course, inserts a space character at the cursor position.

    When the ++space++ key is binded, the default behavior is lost.  
    This is worked around by performing these operations manually.

    ##### Expanding abbreviations
    The abbreviation under the cursor are expanded with the [special input function][special-input-functions] `expand-abbr`

    [special-input-functions]: https://fishshell.com/docs/current/cmds/bind.html#special-input-functions "Official Fish shell documentation: Bind built-in: ##special input functions"

    This is directly done unconditionally in the ++space++ binding made by the helper, and not in the loader.

    ##### Inserting a space character
    Unlike raw abbreviations, the special input function `expand-abbr` does not insert a space character after the expanded abbreviation.

    The space insertion is done conditionally in the loader, depending on data from `awabbre`

    - If the cursor is manually positioned to a specific spot, then a space mustn't be inserted.
    - If the cursor is not manually positioned, then a space must be inserted after the expanded abbreviation to preserve the default behavior.

    A cursor is not manually positioned if the following conditions are met:

    - The [Set Cursor switch](../../../../Awabbre-Manager/Arguments/Sub-Commands/Add/Switches/Set-Cursor.md) is not used.
    - The Set Cursor switch is used, but the cursor position string is not present in the Expansion.

    ### Caching
    A list of loaded packages and commands is kept in Fish global variables.

    If found, it is not redundantly loaded .
