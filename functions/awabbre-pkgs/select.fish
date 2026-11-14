function awabbre-pkgs_select --description='Package repository helper for Awabbre packages'
    test (count {$argv}) -eq 0 && emit awabbre-pkgs
    for repo_func in (functions --all | string match --entire --regex -- ^_awabbre_pkg_"$(string join -- _ {$argv})")
        contains -- {$repo_func} {$awabbre_mask_pkgs} ||
            $repo_func

        # List of selectively loaded packages — for use by dynamic helpers—for example, the official Lazy bind helper.
        contains -- {$repo_func} {$_awabbre_loaded_pkgs} ||
            set --append --global -- _awabbre_loaded_pkgs {$repo_func}
    end
end
