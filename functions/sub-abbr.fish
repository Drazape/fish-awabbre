function sub-abbr --description='Create abbreviations for sub-commands'
    # Nix dependencies: string placements to be overridden with store paths
    for dependency_configurations in /dev/null # shell-startup directories
        for dependency_config in {$dependency_configurations}/*
            source -- {$dependency_config}
        end
    end
    set --function -- additional_function_paths PATHS-TO-DEPENDENCY-FUNCTIONS
    set --prepend -- fish_function_path {$additional_function_paths}

    begin
        set --local -- output_name (format text dim (status function))
        set --function -- argparse argparse --name={$output_name}
        set --function -- print echo {$output_name}(format text dim (format text color white ':'))
    end

    $argparse --stop-nonopt 'h/help&' -- {$argv}

    # general sub-command reference
    set --local -- add_description 'Create context-aware sub-command abbreviations'
    set --local -- list_description 'List the identifiers of each loaded abbreviation'
    set --local -- show_description 'Show the details of a context-aware Sub-Command abbreviation by its identifier'
    set --local -- erase_description 'Erase an abbreviation by it\'s identifier'
    if set --query --local -- _flag_help
        help-text --link=_sub-abbr_internal_helpText-linker 'Context-aware Sub-Command abbreviations' \
            --sub-command={
                'add | '{$add_description},
                'list | '{$list_description},
                'show | '{$show_description},
                'erase | '{$erase_description}
            } \
            --flag='help:h | Show a reference manual for a sub-command'
        _sub-abbr_internal_revert-paths
        return
    end

    set --function -- identifier_prefix _sub-abbr_definition_
    set --function -- internal_description_prefix 'subabbr: '
    # common prefix length data for identity sub-commands
    if contains -- {$argv[1]} list show erase
        set --function -- prefix_length (string length {$identifier_prefix})
        set --function -- identifier_start (math {$prefix_length} + 1)
    end

    set --local -- subcommand_args {$argv[2..]} # Trimmed sub-commands
    # individual sub-commands
    switch "$argv[1]"
        case list
            if ! $argparse \
                    'b/base=*&' \
                    'r/regex&' \
                    'i/invert&' \
                    'm/match=&!_sub-abbr_internal_verify-arg_match-type' \
                    'h/help&' \
                    -- {$subcommand_args}
                _sub-abbr_internal_revert-paths
                return 1
            end
            if set --query --local -- _flag_help
                _subabbr_help_list= help-text --link=_sub-abbr_internal_helpText-linker {$list_description} \
                    --flag={
                                'base:b | Filter by Base Commands that must be accepted',
                                'match:m | Only list identifiers with the specified Initials string match type',
                                'invert:i | Invert the match result',
                                'regex:r | Match command-line positionals with RegExp'
                            }
                _sub-abbr_internal_revert-paths
                return
            end

            _sub-abbr_internal_identifier-data_gather-list
            set --local -- filtered_identifiers
            for identifier in {$identifiers}
                set --local -- identifier_division (string split --max=1 -- '  ' {$identifier})
                set --local -- identifier_match_and_bases (commandline --tokens-expanded --input={$identifier_division[1]})
                if set --query --local -- _flag_match
                    switch (string split --{fields,max}=1 -- : {$identifier_match_and_bases[1]})
                        case =
                            test {$_flag_match} != fixed &&
                                continue
                        case r
                            test {$_flag_match} != regex &&
                                continue
                    end
                end
                if set --query --local -- _flag_base
                    for passed_base in {$_flag_base}
                        contains -- {$passed_base} {$identifier_match_and_bases[2..]} ||
                            set --function -- bases_unmatched # continue outside the current loop
                    end
                    if set --query --function -- bases_unmatched
                        set --erase --function -- bases_unmatched
                        continue
                    end
                end
                if test (count {$argv}) -gt 0
                    set --local -- identifier_initials (commandline --tokens-expanded --input={$identifier_division[2..]})
                    set --local -- index_count 1
                    for passed_init_match in {$argv}
                        string match --quiet {$_flag_regex} -- "$passed_init_match" "$identifier_initials[$index_count]" ||
                            set --function -- init_unmatched # continue outside the current loop
                        set -- index_count (math {$index_count} + 1)
                    end
                    if set --query --function -- init_unmatched
                        set --erase --function -- init_unmatched
                        continue
                    end
                end
                set --append -- filtered_identifiers {$identifier}
            end
            if set --query --local -- _flag_invert
                for identifier in {$identifiers}
                    contains -- {$identifier} {$filtered_identifiers} ||
                        echo {$identifier}
                end
            else
                string repeat -- 1 {$filtered_identifiers}
            end
        case show
            $argparse 'h/help&' -- {$subcommand_args}
            if set --query --local -- _flag_help
                help-text --link=_sub-abbr_internal_helpText-linker {$show_description} \
                    --positional='+Identifier | identifier of abbr to show details for'
                _sub-abbr_internal_revert-paths
                return
            end

            # main operation
            _sub-abbr_internal_identifier-data_gather-list description
            if test (count {$subcommand_args}) -eq 0
                set --function -- identifiers_to_show {$identifiers}
            else
                if ! _sub-abbr_internal_verify-arg_identifier-existance
                    _sub-abbr_internal_revert-paths
                    return 10
                end
                set --function -- identifiers_to_show {$subcommand_args}
            end
            for identifier in {$identifiers_to_show}
                # gather info
                ## info in non-identifier
                _sub-abbr_internal_identifier-data_individual-info {$identifier}

                # display: machine parsable: commandline evaluation → argparse
                set --local -- base_flag_value {$bases}
                test (count {$bases}) -ne 1 &&
                    set --local -- base_flag_value \{(
                                string join -- , {$bases})\}
                test -n "$regex_scopes" &&
                    set --local -- regex_equals '='
                test -n "$cursor_string" &&
                    set --local -- cursor_equals '='
                for command in echo emit
                    $command -- --base={$base_flag_value} --regex"$regex_equals"{$regex_scopes} --set-cursor"$cursor_equals"{$set_cursor_string} {$use_expander} {$forget_prefixes} {$regard_flags} -- {$initials} {$expander}
                end
            end
        case erase
            $argparse 'h/help&' -- {$subcommand_args}
            if set --query --local -- _flag_help
                help-text --link=_sub-abbr_internal_helpText-linker {$erase_description} --positional='+Identifier | the context-aware sub-command abbreviation identifier to erase'
                _sub-abbr_internal_revert-paths
                return
            end

            _sub-abbr_internal_identifier-data_gather-list description commands
            if ! _sub-abbr_internal_verify-arg_more-args 1 {$subcommand_args}
                _sub-abbr_internal_revert-paths
                return 2
            end
            if ! _sub-abbr_internal_verify-arg_identifier-existance
                _sub-abbr_internal_revert-paths
                return 3
            end

            # main operation
            ## erase depending on type
            for identifier in {$subcommand_args}
                set --local -- internal_identifier
                _sub-abbr_internal_identifier-data_individual-info {$identifier}
                if contains -- sub-command {$regex_scopes} || contains -- \0 {$regex_scopes}
                    set -- internal_identifier {$identifier_prefix}(
                                string sub --end=2 -- {$identifier}
                            )(string escape --style=var -- (
                                string sub --start=3 -- {$identifier}
                            ))
                else
                    set -- internal_identifier (
                                string split --right --max=1 --fields=2 -- ' ' {$identifier})
                end
                functions --erase -- {$internal_identifier} # internal specialized expander
                set --local -- commands_varname (string escape --style=var -- {$identifier})_commands
                abbr --erase --command={$$commands_varname} -- {$internal_identifier}
            end

            ## Hook to erase unknown runtime data used by wrappers.
            emit -- subabbr_erase {$subcommand_args}
        case add
            # arguments
            ## Switches
            if ! $argparse \
                    b/base=+!_sub-abbr_internal_verify-arg_base-command \
                    r/regex=\*!_sub-abbr_internal_verify-arg_regex-val \
                    e/expander \
                    c/set-cursor=? \
                    h/help\& \
                    0/unprefix \
                    s/regard-flags \
                    -- {$subcommand_args}
                _sub-abbr_internal_revert-paths
                return 5
            end
            ### Help
            if set --query --local -- _flag_help
                help-text --link=_sub-abbr_internal_helpText-linker 'Create context-aware Sub-Command abbreviations' \
                    --positional={
                        '+Initial Args | All arguments that come before the Sub-Command',
                        'Sub-Command | Comes after the Initial Args; replaced by the Expansion',
                        'Expansion | Replaces the Sub-Command'
                    } \
                    --flag={
                        'base:b | Specify the Base Commands that can precedes the Initial Args',
                        'unprefix:0 | Deactivate toleration of '(format background black --bright '$subabbr_prefix')' before the Base Command',
                        'regard-flags:s | Acknowledge flags in the Initial Args',
                        'set-cursor:c | Position the cursor at '(format background black --bright '%')' post-expansion',
                        'regex:r | Match command-line arguments with Regex',
                        'expander:e | Use the output of a command as the Expansion'
                    }
                _sub-abbr_internal_revert-paths
                return
            end
            if ! set --query --local -- _flag_base
                $print 'Missing required option:' (format background black --bright 'base')
                return 6
            end
            ### Set Cursor
            set --query --local _flag_set_cursor && if test -z {$_flag_set_cursor}
                set -- set_cursor --set-cursor
            else
                set -- set_cursor --set-cursor={$_flag_set_cursor}
            end
            ### RegExp
            for value in \0 sub-command
                contains -- {$value} {$_flag_regex} &&
                    set --function -- regex_subcommand
            end
            contains -- initials {$_flag_regex} &&
                set --function -- regex_initials --regex
            ## Positional
            begin
                # appropriate number of arguments. Not using `argparse` so that `--help can have as many arguments as it wants` and better formatted output
                if ! _sub-abbr_internal_verify-arg_more-args 2 {$argv}
                    _sub-abbr_internal_revert-paths
                    return 7
                end
                # Name arguments
                set --function -- initial_args {$argv[1..-3]}
                set --function -- subcommand {$argv[-2]}
                set --function -- expansion {$argv[-1]}
                # compatible subcommand name: must be a single token
                begin
                    if _sub-abbr_internal_verify-arg_subcommand-contains ' ' || _sub-abbr_internal_verify-arg_subcommand-contains \n
                        $print incompatible (format text italics 'Sub-Command') >&2
                        _sub-abbr_internal_revert-paths
                        return 8
                    end
                end
            end

            # main operation
            begin
                set --local -- regex_str =
                set --query --function -- regex_initials &&
                    set --local -- regex_str r

                set --local -- escaped_bases (string escape --style=script --no-quoted -- {$_flag_base})
                set --local -- escaped_arguments (string escape --style=script --no-quoted -- {$initial_args} {$subcommand})

                # name compatible hash; specific to the combination
                set --function -- identifier {$identifier_prefix}{$regex_str}:(
                    string escape --style=var -- " $escaped_bases  $escaped_arguments" # separate escaped lists with consequent unescaped spaces. It cannot be part of a token since the second space would always have `\` prefixed to it.
                )
            end
            begin
                _sub-abbr_internal_default-prefix
                set --query --local _flag_unprefix ||
                    set --local -- tolerate_prefixes --command={$subabbr_prefix}
                test -n "$_flag_regex" &&
                    set --local -- regex_equals '='
                test -n "$_flag_set_cursor" &&
                    set --local -- cursor_equals '='
                set --local -- escaped_nonidentifier_arguments (
                    string escape --style=script -- \
                        --regex"$regex_equals"{$_flag_regex} {$_flag_expander} --set-color"$cursor_equals"{$_flag_set_color} {$_flag_unprefix} {$_flag_regard_flags} -- {$expansion})
                set --local -- common_flags \
                    --add \
                    --description={$internal_description_prefix}"$escaped_nonidentifier_arguments" \
                    --command={$_flag_base} \
                    {$tolerate_prefixes} \
                    --function={$identifier} \
                    {$set_cursor}
                if set --query --local -- regex_subcommand
                    abbr {$common_flags} --regex="$subcommand" -- {$identifier}
                else
                    abbr {$common_flags} -- "$subcommand"
                end
            end
            function {$identifier} --argument-names=subcommand --inherit-variable={_flag_base,expansion,initial_args,regex_initials,_flag_{unprefix,regard_flags,expander}}
                _sub-abbr_internal_expand-subcommand --base={$_flag_base} {$regex_initials} {$_flag_expander} {$_flag_unprefix} {$_flag_regard_flags} -- {$subcommand} {$expansion} {$initial_args}
            end

            emit -- subabbr_add --identifier={$identifier} {$argv_opts} -- {$argv}
        case \*
            $print 'unknown sub-command:' (format text bold (format background red --bright {$argv[1]})) >&2
            _sub-abbr_internal_revert-paths
            return 9
    end
    _sub-abbr_internal_revert-paths
end
