begin
    set --local -- common_complete complete --command=awabbre-pkgs --no-files
    $common_complete \
        --condition='test (commandline --current-process --cut-at-cursor --tokens-expanded | count) -eq 1' \
        --description='Load context-aware abbreviation (awabbre) packages' \
        --arguments='
            select\t\'Forcefully load a package or a group from the package tree\'
            lazybind\t\'Lazily load compliant pkgs upon Base Command use\'
        '

    function _completion_awabbre-pkgs_select_next-pkg-or-group
        set --local -- path (__fish_print_cmd_args_without_options)[3..]

        set --local -- parent_group _awabbre_pkg_"$(string join -- _ {$path} \0)"
        for subfunc in (string match --regex --entire -- ^(string escape --style=regex -- {$parent_group}) (functions --all) (path basename --no-extension {$fish_function_path}/*))
            set --local sub_path (string split --max=1 --fields=2 -- {$parent_group} {$subfunc} | string split -- _)
            echo -n -- {$sub_path[1]}
            argparse --ignore-unknown /description=+\& -- (
                commandline --tokens-expanded --input=(
                    functions --no-details -- {$parent_group}{$sub_path[1]}
                )[1])
            echo -n -- \t{$_flag_description}
            echo # Separate new line from description, in case it doesn't exist
        end
    end
    $common_complete \
        --condition='test "$(commandline --current-process --tokens-expanded)[2]" = select' \
        --arguments='(_completion_awabbre-pkgs_select_next-pkg-or-group)'

    function _completion_awabbre-pkgs_lazybind_mapped-commands
        set --function -- filtered_commands (commandline --tokens-expanded --current-process)[3..]
        set --local -- var_prefix _awabbre_pkgs_command_

        for mapped_var in (set --names | string match --entire --regex -- ^{$var_prefix})
            contains -- {$mapped_var} {$var_prefix}{$filtered_commands} ||
                echo -- (string split --max=1 --fields=2 -- {$var_prefix} {$mapped_var})\t{$$mapped_var}
        end
    end
    $common_complete \
        --condition='test "$(commandline --current-process --tokens-expanded)[2]" = lazybind' \
        --arguments='(_completion_awabbre-pkgs_lazybind_mapped-commands)'
end
