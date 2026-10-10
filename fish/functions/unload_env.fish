function unload_env --description "Erase the variables named in an env file"
    for line in (string match -rv '^\s*(#|$)' <$argv[1])
        set -e (string split -m1 = -- (string replace -r '^export\s+' '' -- $line))[1]
    end
end
