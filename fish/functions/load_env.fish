function load_env
    export (grep -v '^#' $argv | xargs -L1)
end
