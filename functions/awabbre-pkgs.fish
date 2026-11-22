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
        case \*
            _awabbre_internal_dependencies_load-plugins # load `format`
            set --local -- print echo -- (format text dim (status function))(format text dim (format text color white ':'))

            # print error
            if set --query --local -- argv[1]
                $print 'invalid loader (sub-command):' (format text bold (format background red --bright {$argv[1]})) >&2
            else
                $print 'no loader (sub-command) specified.' >&2
            end

            # recommend a loader
            if set --query --global -- _awabbre_loaded_pkgs_commands # lazybind is already active
                set --function -- subcommand_suggestion select
                set --function -- subcommand_purpose 'explicitly load packages'
            else
                set --function -- subcommand_suggestion lazybind
                set --function -- subcommand_purpose 'load packages on-demand'
            end
            set --local -- recommended_command (status current-function)\ {$subcommand_suggestion}
            $print (format text color yellow 'TIP:') run (format background black --bright {$recommended_command}) to {$subcommand_purpose}
            commandline --current-buffer -- {$recommended_command}

            _awabbre_internal_dependencies_revert-paths # unload `format`
            return 1
    end
end
