function unload_env
    unset (grep -v '^#' $argv | sed -E 's/(.*)=.*/\1/' | xargs -0)
end
