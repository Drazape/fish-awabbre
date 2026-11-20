function _awabbre_internal_dependencies_load-plugins --no-scope-shadowing --description='Nix dependencies: string placements to be overridden with store paths'
    for dependency_configurations in /dev/null # shell-startup directories
        for dependency_config in {$dependency_configurations}/*
            source -- {$dependency_config}
        end
    end
    set --function -- additional_function_paths PATHS-TO-DEPENDENCY-FUNCTIONS
    set --prepend -- fish_function_path {$additional_function_paths}

    # run `awabbre_internal_dependenices_revert-paths` to unload dependencies before returning
end
