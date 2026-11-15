function awabbre-pkgs_select --description='Package repository helper for Awabbre packages'
    test (count {$argv}) -eq 0 && emit awabbre-pkgs
    for repo_func in (functions --all | string match --entire --regex -- ^_awabbre_pkg_"$(string join -- _ {$argv})")
        _awabbre-pkgs_register {$repo_func}
        test {$status} -lt 2 &&
            {$repo_func}
    end
end
