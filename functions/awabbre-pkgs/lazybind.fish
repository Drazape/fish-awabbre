function awabbre-pkgs_lazybind --description='Lazily load complaint awabbre pkgs upon Base Command use'
    _awabbre_internal_default-prefix

    set --local -- escaped_masked_commands "$(string escape --style=script -- {$argv})"
    bind space expand-abbr '_awabbre-pkgs_lazybind_load '"$escaped_masked_commands"
end
