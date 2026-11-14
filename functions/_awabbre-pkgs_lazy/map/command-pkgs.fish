function _awabbre-pkgs_lazybind_map_command-pkgs --description='Map a single command to multiple packages' --argument-names=command
    set --local -- pkgs {$argv[2..]}
    set --global --append -- _awabbre_pkgs_command_(string escape --style=var -- {$command}) _awabbre_pkg_{$pkgs}
end
