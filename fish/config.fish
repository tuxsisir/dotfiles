set -gx LC_ALL en_US.UTF-8
set -gx EDITOR nvim

# Homebrew (fish doesn't read /etc/paths.d for it)
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# PATH — fish_add_path silently skips directories that don't exist
set -gx PNPM_HOME ~/Library/pnpm
fish_add_path -g \
    ~/.local/bin \
    ~/.cargo/bin \
    $PNPM_HOME \
    ~/.opencode/bin \
    ~/.antigravity/antigravity/bin \
    /opt/homebrew/opt/ruby/bin

# gem executables live under a ruby-version directory
for dir in /opt/homebrew/lib/ruby/gems/*/bin
    fish_add_path -g $dir
end

if status is-interactive
    if type -q pyenv
        pyenv init - fish | source
    end

    if type -q starship
        starship init fish | source
    end
end
