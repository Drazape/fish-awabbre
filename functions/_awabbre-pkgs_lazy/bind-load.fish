function _awabbre-pkgs_lazybind_load --description='Load packages based on Base Command'
    for base_or_prefix in (commandline --current-process --tokens-expanded)[1]
        if contains -- {$base_or_prefix} {$awabbre_prefix}
            continue
        else
            set --function -- base_command {$base_or_prefix}
            break
        end
    end

    # When using the `expand-abbr` input function, a space isn't automatically suffixed after the expansion.
    # This is worked around by the expander of each awabbre reporting if teh abbreviation doesn't manually set the cursor's position.
    if set --query --global -- _awabbre_expanded_with_setcursor
        set --erase --global -- _awabbre_expanded_with_setcursor
    else
        commandline --insert -- ' '
    end

    # load each package only once
    if test (count {$base_command}) -eq 0 || contains -- {$base_command} {$_awabbre_loaded_pkgs_commands}
        return 1
    else
        set --append --global -- _awabbre_loaded_pkgs_commands {$base_command}
    end

    set --local -- pkglist_varname _awabbre_pkgs_command_(string escape --style=var -- {$base_command})
    if set --query -- {$pkglist_varname}
        for pkg in {$$pkglist_varname}
            if contains -- {$pkg} {$_awabbre_loaded_pkgs} {$awabbre_mask_pkgs}
                continue
            else
                set --append --global -- _awabbre_loaded_pkgs {$pkg}
                $pkg
            end
        end
    end
end
