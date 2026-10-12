#!/usr/bin/env bash
# Set up a Mac from this repo. Safe to re-run: it installs what's missing and
# updates everything else to the latest version (nothing is pinned).
#
#   ./install.sh            # everything
#   ./install.sh link nvim  # only some steps (see `steps` below)

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SUFFIX="bak-$(date +%Y%m%d-%H%M%S)"

steps=(brew link shell fish rust tmux nvim)

info() { printf '\n\033[1;35m==> %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m  ! %s\033[0m\n' "$*"; }

# ---------------------------------------------------------------------------

step_brew() {
  info "Homebrew"
  if ! command -v brew >/dev/null && [ ! -x /opt/homebrew/bin/brew ]; then
    # also installs the Xcode Command Line Tools (git, make, clang)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew update
  brew bundle --file="$DOTFILES/Brewfile" # installs missing, upgrades outdated
}

# link <path in repo> <target>; an existing file/dir at target is moved aside
link() {
  local src="$DOTFILES/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    return
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.$BACKUP_SUFFIX"
    warn "moved existing $dst -> $dst.$BACKUP_SUFFIX"
  fi
  ln -s "$src" "$dst"
  echo "  $dst -> $src"
}

step_link() {
  info "Symlinks"
  link nvim ~/.config/nvim
  link tmux/.tmux.conf ~/.tmux.conf
  link ghostty/config ~/.config/ghostty/config
  link starship.toml ~/.config/starship.toml
  link .gitconfig ~/.gitconfig
  link git/ignore ~/.config/git/ignore
  link git/personal ~/.config/git/personal
  link hammerspoon/init.lua ~/.hammerspoon/init.lua
  link amethyst/amethyst.yml ~/.config/amethyst/amethyst.yml
  # whole dir: Karabiner watches the directory and won't reload a symlinked file
  link karabiner ~/.config/karabiner

  link fish/config.fish ~/.config/fish/config.fish
  link fish/fish_plugins ~/.config/fish/fish_plugins
  # per-file, because fisher also installs plugin functions into this directory
  for f in "$DOTFILES"/fish/functions/*.fish; do
    link "fish/functions/$(basename "$f")" ~/.config/fish/functions/"$(basename "$f")"
  done
}

step_shell() {
  info "fish as login shell"
  local fish=/opt/homebrew/bin/fish
  if ! grep -qx "$fish" /etc/shells; then
    echo "$fish" | sudo tee -a /etc/shells >/dev/null
  fi
  if [ "$(dscl . -read ~/ UserShell | awk '{print $2}')" != "$fish" ]; then
    chsh -s "$fish"
  else
    echo "  already fish"
  fi
}

step_fish() {
  info "fish plugins (fisher) + latest node LTS + latest python (uv)"
  # fisher update installs everything listed in fish_plugins, at their latest
  fish -c 'type -q fisher; or curl -fsSL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; fisher update'

  # node for Mason's npm-based tools (pyright, ts_ls, vue_ls, prettier, ...)
  fish -c 'nvm install lts; and set -U nvm_default_version lts'

  # latest python as the default python/python3 in ~/.local/bin
  if command -v uv >/dev/null; then
    uv python install --default
    uv python upgrade
  fi
}

step_rust() {
  info "Rust (rustup, latest stable)"
  local rustup=~/.cargo/bin/rustup
  if [ ! -x "$rustup" ]; then
    # --no-modify-path: config.fish already puts ~/.cargo/bin on PATH
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
  else
    "$rustup" self update
  fi
  "$rustup" update stable # includes rustfmt and clippy
  "$rustup" default stable
}

step_tmux() {
  info "tmux plugins (tpm)"
  local tpm=~/.tmux/plugins/tpm
  if [ -d "$tpm" ]; then
    git -C "$tpm" pull --quiet
  else
    git clone --quiet https://github.com/tmux-plugins/tpm "$tpm"
  fi
  "$tpm/bin/install_plugins"
  "$tpm/bin/update_plugins" all
  "$tpm/bin/clean_plugins"
}

step_nvim() {
  info "neovim: plugins, treesitter parsers, Mason LSPs/formatters"
  local log="${TMPDIR:-/tmp}/nvim-bootstrap.log"
  if ! fish -c 'nvm use --silent lts; and type -q npm' 2>/dev/null; then
    warn "node not found: run './install.sh fish' first (Mason needs npm)"
    return 1
  fi
  # run through fish so nvm's node is on PATH for Mason's npm installs
  fish -c "nvm use --silent lts; nvim --headless -c 'luafile $DOTFILES/scripts/nvim_bootstrap.lua'" 2>&1 >"$log" ||
    warn "nvim bootstrap failed, see $log"
}

# ---------------------------------------------------------------------------

[ "$(uname)" = Darwin ] || { echo "macOS only" >&2; exit 1; }

selected=("$@")
[ ${#selected[@]} -eq 0 ] && selected=("${steps[@]}")

for s in "${selected[@]}"; do
  if [[ " ${steps[*]} " != *" $s "* ]]; then
    echo "unknown step: $s (steps: ${steps[*]})" >&2
    exit 1
  fi
done

for s in "${selected[@]}"; do
  "step_$s"
done

info "Done"
cat <<'EOF'
  - Open Ghostty (fonts and config are in place) and start a new shell.
  - Work Mac only: set the work email in the untracked ~/.gitconfig.local
    (never `git config --global`, it writes into the tracked ~/.gitconfig):
        git config --file ~/.gitconfig.local user.email you@work.com
EOF
