# dotfiles

<h1 align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim" width="40%">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Tmux_logo.svg/2560px-Tmux_logo.svg.png" alt="tmux" width="40%">
</h1>

My macOS setup: [Neovim](https://neovim.io/) on [NvChad](https://nvchad.com/),
[tmux](https://github.com/tmux/tmux), [fish](https://fishshell.com/),
[starship](https://starship.rs/) and [Ghostty](https://ghostty.org/).

## New Mac

```sh
git clone https://github.com/tuxsisir/dotfiles ~/dotfiles
cd ~/dotfiles && ./install.sh
```

`install.sh` is safe to re-run, and nothing is pinned: each run installs what's
missing and updates everything else to latest. Run single steps with
`./install.sh <step> ...`:

| step    | does                                                                  |
| ------- | --------------------------------------------------------------------- |
| `brew`  | Homebrew + everything in `Brewfile`                                    |
| `link`  | symlinks configs into `~` (existing files are moved to `*.bak-<date>`) |
| `shell` | makes fish the login shell                                             |
| `fish`  | fisher plugins (`fish/fish_plugins`), latest node LTS, latest python   |
| `rust`  | rustup + latest stable toolchain (rustfmt, clippy)                     |
| `tmux`  | tpm + tmux plugins                                                     |
| `nvim`  | lazy.nvim plugins, treesitter parsers, Mason LSPs/formatters           |

## Layout

| repo                | linked to                  |
| ------------------- | -------------------------- |
| `nvim/`             | `~/.config/nvim`           |
| `tmux/.tmux.conf`   | `~/.tmux.conf`             |
| `fish/config.fish`  | `~/.config/fish/`          |
| `fish/fish_plugins` | `~/.config/fish/`          |
| `fish/functions/*`  | `~/.config/fish/functions/`|
| `ghostty/config`    | `~/.config/ghostty/config` |
| `starship.toml`     | `~/.config/starship.toml`  |
| `.gitconfig`        | `~/.gitconfig` (+ untracked `~/.gitconfig.local` for overrides) |
| `git/ignore`        | `~/.config/git/ignore`     |
| `hammerspoon/init.lua` | `~/.hammerspoon/init.lua` |

## Neovim tooling

LSP servers and formatters are installed per-user by Mason into
`~/.local/share/nvim/mason`, so nothing goes in global npm/pip. Mason only needs
`node`/`npm` (from nvm.fish) and `python3` on PATH to build them. To add a tool,
reference it in `nvim/lua/configs/lspconfig.lua` or `conform.lua`, then run
`:MasonInstallAll`.

#### Screenshots
![lua-packer-plugins](https://imgur.com/98relTf.png)
![git-status](https://imgur.com/I5jtbNG.png)
