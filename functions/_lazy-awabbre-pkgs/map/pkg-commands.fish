function _lazy-awabbre-pkgs_map_pkg-commands --description='Map a single package to multiple commands' --argument-names=pkg
    set --local -- abbreviated_commands {$argv[2..]}
    for command in {$abbreviated_commands}
        set --append --global -- _awabbre_pkgs_command_(string escape --style=var -- {$command}) _awabbre_pkg_{$pkg}
    end
end
