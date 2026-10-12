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
| `fish`  | fisher plugins (`fish/fish_plugins`), latest node LTS, latest python (uv) |
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
| `git/personal`      | `~/.config/git/personal` (personal `[user]` for `~/dotfiles`, wins over `~/.gitconfig.local`) |
| `hammerspoon/init.lua` | `~/.hammerspoon/init.lua` |
| `karabiner/`        | `~/.config/karabiner` (whole dir; Karabiner won't reload a symlinked file) |

## Neovim tooling

LSP servers and formatters are installed per-user by Mason into
`~/.local/share/nvim/mason`, so nothing goes in global npm/pip. Mason only needs
`node`/`npm` (from nvm.fish) and `python3` on PATH to build them. To add a tool,
reference it in `nvim/lua/configs/lspconfig.lua` or `conform.lua`, then run
`:MasonInstallAll`.

## Python (uv)

[uv](https://docs.astral.sh/uv/) replaces pyenv, virtualfish, pip and pipx. It
installs prebuilt Pythons, so there are no build deps (openssl/readline/xz).
`./install.sh fish` installs the latest Python as the default
`python`/`python3` in `~/.local/bin`.

### Python versions

| Task                          | Before (pyenv)               | Now (uv)                              |
| ----------------------------- | ---------------------------- | ------------------------------------- |
| List installable versions     | `pyenv install --list`       | `uv python list`                      |
| Install a version             | `pyenv install 3.13`         | `uv python install 3.13`              |
| Install latest 3.x            | `pyenv install $(pyenv latest -k 3)` | `uv python install`           |
| List installed                | `pyenv versions`             | `uv python list --only-installed`     |
| Set the global default        | `pyenv global 3.13`          | `uv python install 3.13 --default`    |
| Pin a version for a project   | `pyenv local 3.13`           | `uv python pin 3.13`                  |
| Find the interpreter path     | `pyenv which python`         | `uv python find`                      |
| Uninstall                     | `pyenv uninstall 3.12`       | `uv python uninstall 3.12`            |
| Upgrade to the latest patch   | install new patch + re-point | `uv python upgrade 3.13`              |

Both read `.python-version`, so existing pins keep working.

### Virtualenvs

virtualfish kept named envs in `~/.virtualenvs`; uv keeps one `.venv` per project.

| Task                          | Before (virtualfish)         | Now (uv)                              |
| ----------------------------- | ---------------------------- | ------------------------------------- |
| Create an env                 | `vf new myproj`              | `uv venv` (makes `./.venv`)           |
| Create with a specific Python | `vf new -p python3.12 myproj`| `uv venv --python 3.12`               |
| Activate                      | `vf activate myproj`         | `va` (= `source .venv/bin/activate.fish`) |
| Run without activating        | `vf activate myproj; cmd`    | `uv run cmd`                          |
| Deactivate                    | `vf deactivate`              | `deactivate`                          |
| Delete an env                 | `vf rm myproj`               | `rm -rf .venv`                        |

### Packages and CLI tools

| Task                          | Before (pip / pipx)          | Now (uv)                              |
| ----------------------------- | ---------------------------- | ------------------------------------- |
| Install into the active env   | `pip install requests`       | `uv pip install requests`             |
| Install from requirements     | `pip install -r requirements.txt` | `uv pip install -r requirements.txt` |
| Freeze                        | `pip freeze > requirements.txt` | `uv pip freeze > requirements.txt` |
| Start a project               | hand-written `pyproject.toml`| `uv init`                             |
| Add a dependency (+ lockfile) | `pip install x` + edit reqs  | `uv add x` (`pyproject.toml` + `uv.lock`) |
| Add a dev dependency          | `requirements-dev.txt`       | `uv add --dev pytest`                 |
| Recreate env from lockfile    | `pip install -r requirements.txt` | `uv sync`                        |
| Lock / compile pins           | `pip-compile`                | `uv lock` or `uv pip compile`         |
| Run a script                  | `python script.py`           | `uv run script.py`                    |
| Install a CLI tool            | `pipx install httpie`        | `uv tool install httpie`              |
| Run a tool once               | `pipx run cowsay`            | `uvx cowsay`                          |
| Upgrade all tools             | `pipx upgrade-all`           | `uv tool upgrade --all`               |
| List tools                    | `pipx list`                  | `uv tool list`                        |

### Gotchas

- **No shims.** uv doesn't hijack `python`; use `uv run`, activate `.venv`, or the `--default` python in `~/.local/bin`.
- **`uv pip` needs an env.** It won't touch the system Python without `--system`.
- **`uv run` auto-syncs** a `pyproject.toml` project's deps before running.
- **AWS CLI** comes from Homebrew (`awscli`, v2); PyPI's `awscli` is the old v1.

#### Screenshots
![lua-packer-plugins](https://imgur.com/98relTf.png)
![git-status](https://imgur.com/I5jtbNG.png)
