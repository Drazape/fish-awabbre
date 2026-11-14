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

!!! warning "Single Trigger only"
    In general, you must only use a single method to activate your package: either the prefix convention, or the event.
    If you use multiple triggers, then the amount of time it takes for `awabbre-pkgs_select` to execute would double each time in the same session.

## Official Repository
Each package is a single function in the repository that provides arbitrary awabbres.

!!! info "Official Root Group"
    The root group for the repository is `official`.

!!! tip "Gaze at Pre-existing Packages"
    Have a look at other packages defined in the [repository](https://github.com/Drazape/fish-awabbre/tree/main/functions/awabbre/pkg/official/ "Official Package Repository"){data-preview} before pushing your own here.

!!! tip "Library"
    Use the [function library](../../Reference/Packages/Software-Development-Kit/){data-preview} to create packages more easily using abstractions

## 3rd-party
3rd-party packages/repositories can use the program however they want. For example:

- Simple packages can directly distribute the abbreviations into shell-initialization configuration. This way they don't need to be enabled after they have been installed (it was installed for the purpose of using it after all)
- Complex packages can ship their own commands and front ends to configure the abbreviations and provide other features
- Packages may or may not choose to maintain compatibility with the [official repository helpers](../../Reference/Packages/Repository-Helpers/index.md).

You might be able to get some creative inspiration by exploring existing packages/repositories, or you may also choose to contribute to an unofficial repository — if it suits your project better. 

!!! tip "Discovery"
    Make your 3rd-party project discoverable with the [topic](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics#adding-topics-to-your-repository){data-preview}: [`fish-awabbre`](https://github.com/topics/fish-awabbre){data-preview}
