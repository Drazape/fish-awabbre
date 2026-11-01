---
comments: true
icon: lucide/share
description: Distribution ways
---

# Package Distribution
Guide for distributing fish-awabbre packages
## Comparison
|  ~  | [Official Repository](#official-repository) | [3rd-party](#3rd-party) |
| :-: | :-----------------------------------------: | ---------------------- |
| **Distribution** | From base package | Yourself. Users will have to install the package before using it. |
| **Configuration** | ❌ Unsupported | ❔ Optional |
| **Updates** | Delayed for review | Direct |
| **Suffix** | Prohibited | Required |

## Package activation
For the package to be loaded by the official repository helper `awabbre-pkgs`, and be indexable by helpers compatible with the standard repository structure, the package must comply with some requirements specified based on how the function is distributed.
### Function naming convention (recommended)
Regardless of how the function is distributed, it can be activated using the function naming convention method.

For compliance, the package's function name must be prefixed with `_awabbre_pkg_`.  
[Groups](../../Reference/Packages/Repository-Helper/Package-Tree.md){data-preview} are separated with a `_`; the group organisation is up to the developer, or the packager/distributor.
```fish {title="Function Name Format"}
_awabbre_pkg_[<groups(sep:_)>_]<pkgname>
```

### Event trigger (static function only)
In case of static functions, you additionally have the choice of activate your [static][static-function]{data-preview}[^static-function] (non-[dynamic][dynamic-function]{data-preview}[^dynamic-function]) package with a [Fish event trigger][fish-events]{data-preview}.

[fish-events]: https://fishshell.com/docs/current/language.html#event-handlers "Official Fish documentation"

!!! warning "Unselective Activation"
    Packages that use this method can only be activated with `awabbre-pkgs` when the user chooses to activate all the packages—the only condition when `awabbre-pkgs` will trigger the event.  
    In other words, if the user chooses to selectively enable package groups or packages, the static package using this method will not be activated, and the abbreviations will not be available.

[static-function]: https://fishshell.com/docs/current/tutorial.html#startup-where-s-bashrc "Official Fish documentation"
[^static-function]: A function is statically distributed if it is part of the shell initialization configuration. Functions distributed as such are automatically loaded on the shell start-up; that is, it can be listed with `functions`

[dynamic-function]: https://fishshell.com/docs/current/tutorial.html#autoloading-functions "Official Fish documentation"
[^dynamic-function]: A function is dynamically distributed if it is distributed as a file in one of `$fish_function_path`; The file is sourced the first time the function is called

To utilize this feature, you must add a trigger to the package function for the event: `awabbre-pkgs`

```fish {title="Function Definition Format"}
function <arbitrary-name> --on-event=awabbre-pkgs
    … # body
end
```

!!! warning "Single Trigger only"
    In general, you must only use a single method to activate your package: either the prefix convention, or the event.
    If you use multiple triggers, then the amount of time it takes for `awabbre-pkgs` to execute would double each time in the same session.

## Methods
Different methods of distributing packages, with each having their pros and cons.
### Official Repository
Each package is a single function in the repository which provides abbreviations (regular and context-aware) for the specific command it corresponds to.  

!!! info "Official Root Group"
    The root group for the repository is `official`.

!!! tip "Gaze at Pre-existing Packages"
    Have a look at other packages defined in the [repository](https://github.com/Drazape/fish-awabbre/tree/main/functions/awabbre/pkg/official/ "Official Package Repository"){data-preview} before pushing your own here.

!!! tip "Library"
    Use the [function library](../../Reference/Packages/Software-Development-Kit/Expanders){data-preview} to create packages more easily using abstractions

### 3rd-party
3rd-party packages/repositories can use the program however they want. For example:

- Simple packages can directly distribute the abbreviations into shell-initialization configuration. This way they don't need to be enabled after they have been installed (it was installed for the purpose of using it after all)
- Complex packages can ship their own commands and front ends to configure the abbreviations and provide other features
- Packages may or may not choose to maintain compatibility with the official repository helper: `awabbre-pkgs`.
You might be able to get some creative inspiration by exploring existing packages/repositories, or you may also choose to contribute to an unofficial repository — if it suits your project better. 

!!! tip "Discovery"
    Make your 3rd-party project discoverable with the [topic](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics#adding-topics-to-your-repository){data-preview}: [`fish-awabbre`](https://github.com/topics/fish-awabbre){data-preview}
