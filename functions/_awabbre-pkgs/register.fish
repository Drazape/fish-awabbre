function _awabbre-pkgs_register --description='Store loaded packages, and return its state' --argument-names=pkg
    string match --regex --quiet -- {$pkg} {$awabbre_mask_pkgs} &&
        return 2

    if contains -- {$pkg} {$_awabbre_loaded_pkgs}
        return 1
    else
        set --append --global -- _awabbre_loaded_pkgs {$pkg}
        return 0
    end
end
