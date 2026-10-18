function _sub-abbr_internal_verify-arg_identifier-existance --description='Ensure existance of all identifiers in the sub-command arguments' --inherit-variable={subcommand_args,identifiers,print}
    for identifier in {$subcommand_args}
        if ! contains -- {$identifier} {$identifiers}
            $print 'unknown context-aware sub-command abbreviation:' (format text bold (format text italics (format text color red {$identifier}))) >&2
            return 1
        end
    end
    return 0
end
