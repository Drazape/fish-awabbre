function _awabbre-pkgs_lazybind_map_pairs --description='map multiple commands to different packages'
    for command_or_pkg in {$argv}
        if set --query --function -- command
            set --global --append -- _awabbre_pkgs_command_(string escape --style=var -- {$command}) _awabbre_pkg_{$command_or_pkg}
            set --erase --function -- command
        else
            set --function -- command {$command_or_pkg}
        end
    end
end
