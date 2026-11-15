function awabbre-pkgs --description='Package repository helper'
    set --local -- subcommand_args {$argv[2..]}
    switch {$argv[1]}
        case select
            test (count {$subcommand_args}) -eq 0 &&
                emit awabbre-pkgs
            for repo_func in (functions --all | string match --entire --regex -- ^_awabbre_pkg_"$(string join -- _ {$subcommand_args})")
                _awabbre-pkgs_register {$repo_func}
                test {$status} -lt 2 &&
                    $repo_func
            end
        case lazybind
            _awabbre_internal_default-prefix

            set --local -- escaped_masked_commands (string escape --style=script -- {$subcommand_args})
            bind space expand-abbr '_awabbre-pkgs_lazybind_load '"$escaped_masked_commands"
    end
end
