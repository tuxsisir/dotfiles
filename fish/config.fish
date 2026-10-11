set -gx LC_ALL en_US.UTF-8
set -gx EDITOR nvim

# Homebrew (fish doesn't read /etc/paths.d for it)
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# PATH — fish_add_path silently skips directories that don't exist
set -gx PNPM_HOME ~/Library/pnpm
# pipx's macOS default (~/Library/Application Support) has a space, which
# virtualfish can't handle
set -gx PIPX_HOME ~/.local/pipx
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
    # abbreviations expand on the command line as you type, so they never shadow
    # real programs for scripts. git names follow the oh-my-zsh git plugin.
    abbr -a g git
    abbr -a gst git status
    abbr -a ga git add
    abbr -a gaa git add --all
    abbr -a gap git add --patch
    abbr -a gcm --set-cursor 'git commit -m "%"'
    abbr -a gca git commit --amend
    abbr -a gcan git commit --amend --no-edit
    abbr -a gd git diff
    abbr -a gds git diff --staged
    abbr -a gsw git switch
    abbr -a gcb git switch -c
    abbr -a gb git branch
    abbr -a gl git pull
    abbr -a gp git push
    abbr -a gpf git push --force-with-lease
    abbr -a glog git log --oneline --graph --decorate
    abbr -a gsta git stash
    abbr -a gstp git stash pop
    abbr -a lg lazygit

    abbr -a v nvim
    abbr -a t tmux new -A -s main
    abbr -a bu 'brew update && brew upgrade'

    abbr -a ni npm install
    abbr -a nr npm run
    abbr -a nrd npm run dev
    abbr -a py python3
    abbr -a va source .venv/bin/activate.fish

    if type -q pyenv
        pyenv init - fish | source
    end

    # virtualfish (`vf`), installed with pipx. Loaded here instead of the
    # conf.d file `vf install` writes, which hardcodes a python3.X path.
    set -l vf_fish $PIPX_HOME/venvs/virtualfish/lib/python3*/site-packages/virtualfish/virtual.fish
    if set -q vf_fish[1]
        set -g VIRTUALFISH_PYTHON_EXEC $PIPX_HOME/venvs/virtualfish/bin/python
        set -g VIRTUALFISH_DEFAULT_PYTHON ~/.pyenv/shims/python3 # new envs use pyenv's global python
        source $vf_fish[1]
        emit virtualfish_did_setup_plugins
    end

    if type -q starship
        starship init fish | source
    end
end
