function awabbre-pkgs_lazybind --description='Lazily load complaint awabbre pkgs upon Base Command use'
    _awabbre_internal_default-prefix
    bind space expand-abbr _awabbre-pkgs_lazybind_load
end
