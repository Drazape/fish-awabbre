# Main Callables (visible)
(`awabbre` `awabbre-pkgs_select`)
Functions called directly by the end-users

## `awabbre`
Create personal Sub-Command abbreviations in the scope
## `awabbre-pkgs_select`
Conveniently access Sub-Command abbreviation packages from the official repository


# hidden
(`_awabbre/*`)
Hidden functions installed on the end-user's system.  

## Internal
(`internal/`)
Helper functions called by `awabbre`

## Packages
(`pkg/official/`)
Packages that users typically enable using `awabbre-pkgs_select` in their Fish shell-initialization configuration

> [!TIP]
> See the [Contribution Guide](../CONTRIBUTING.md#official-packages) to learn how to add more packages — correctly

## Library
Functions for creating [packages](#Packages)
