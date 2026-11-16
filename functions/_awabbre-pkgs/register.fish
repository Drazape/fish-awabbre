function _awabbre-pkgs_register --description='Store loaded packages, and return its state' --argument-names=pkg
    for regex_query in $awabbre_mask_pkgs
        string match --regex --quiet -- {$regex_query} {$pkg} &&
            return 2
    end

    contains -- {$pkg} {$_awabbre_loaded_pkgs} &&
        return 1

    set --append --global -- _awabbre_loaded_pkgs {$pkg}
    return 0
end
