function _awabbre-pkgs_lazybind_map_bulk --description='Map multiple packages to multiple commands'
    argparse 'p/packages=+' -- {$argv}

    for command in {$argv}
        set --append --global -- _awabbre_pkgs_command_(string escape --style=var -- {$command}) _awabbre_pkg_{$packages}
    end
end
