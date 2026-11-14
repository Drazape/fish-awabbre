# Main Callables (visible)
(`awabbre` `awabbre-pkgs`)
Functions called directly by the end-users

## `awabbre`
Create personal Sub-Command abbreviations in the scope
## `awabbre-pkgs`
Conveniently access Sub-Command abbreviation packages from the official repository


# hidden
(`_awabbre/*`)
Hidden functions installed on the end-user's system.  

## Internal
(`internal/`)
Helper functions called by `awabbre`

## Packages
(`pkg/official/`)
Packages that users typically enable using the [Repository Helper](https://drazape.github.io/fish-awabbre/Reference/Packages/Repository-Helper/ "documentation") in their Fish shell-initialization configuration

> [!TIP]
> See [Package Distribution](https://drazape.github.io/fish-awabbre/Guides/Meta/Distribution/#official-repository "documentation") to learn how to add more packages — correctly

## Library
(`lib/`)
Functions for creating [packages](#Packages)
