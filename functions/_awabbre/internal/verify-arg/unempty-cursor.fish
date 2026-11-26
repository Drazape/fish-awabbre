function _awabbre_internal_verify-arg_unempty-cursor --description='ensure cursor replacement string is not null'
    if test (count {$_flag_value}) -ne 0 && test -z {$_flag_value}
        echo -- (format text dim 'awabbre'
            )(format text dim (
                format text color white ':')
            ) (format text italics 'Set Cursor'
            ): 'position replacement string cannot be empty'
        return 1
    end
end
