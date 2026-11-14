function _awabbre-pkgs_lazybind_map_pkg-commands --description='Map a single package to multiple commands' --argument-names=pkg
    for command in {$argv[2..]}
        set --append --global -- _awabbre_pkgs_command_(string escape --style=var -- {$command}) _awabbre_pkg_{$pkg}
    end
end
