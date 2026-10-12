function abbrs --description 'fuzzy-search abbreviations'
    abbr --show | string replace -r '^abbr .*?-- ' '' | fzf --query "$argv"
end
