function load_env --description "Export KEY=value lines from an env file"
    for line in (string match -rv '^\s*(#|$)' <$argv[1])
        set -l kv (string split -m1 = -- (string replace -r '^export\s+' '' -- $line))
        set -gx $kv[1] (string trim -c '"\'' -- $kv[2])
    end
end
