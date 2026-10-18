function _sub-abbr_internal_identifier-data_individual-info --no-scope-shadowing --argument-names=identifier --inherit-variable=internal_description_prefix --description='Accept an identifier, and parse it to gather data into the outer scope'
    # info embedded in identifier
    set --local -- escaped_identifier_positionals (
        string sub --start=4 -- {$identifier} |
        string split --max=1 -- '  ')
    set --function -- bases (
        string split -- ' ' {$escaped_identifier_positionals[1]})
    set --function -- initials {$escaped_identifier_positionals[2]}

    # info from internal description
    set --local -- identifier_description_var_name (
            string escape --style=var -- {$identifier}
        )_description
    set --query --local -- {$identifier_description_var_name} ||
        return 1 # only sets embedded information
    $argparse \
        r/regex=\* \
        c/set-cursor=? \
        e/expander \
        0/unprefix \
        s/regard-flags \
        -- (
            commandline --tokens-expanded --input=(
                string sub --start=(
                    math 1 + (
                        string length -- {$internal_description_prefix}
                    )) -- {$$identifier_description_var_name}))
    set --function -- regex_scopes {$_flag_regex}
    set --function -- cursor_string {$_flag_set_cursor}
    string repeat -- 1 {$_flag_expander} {$_flag_unprefix} {$_flag_regard_flags} |
        read --function --line -- use_expander forget_prefixes regard_flags

    set --function -- expander {$argv}
end
