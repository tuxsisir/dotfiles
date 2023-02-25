# sisir's dotfiles

<h1 align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim" width="40%">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Tmux_logo.svg/2560px-Tmux_logo.svg.png" alt="tmux" width="40%">
</h1>

### Find the configurations for following:

- [Alacritty](https://github.com/alacritty/alacritty) *A fast, cross-platform, OpenGL terminal emulator*
- [Neovim](https://neovim.io/) *hyperextensible Vim-based text editor*
- [tmux](https://github.com/tmux/tmux) *terminal multiplexer*
- [fish](https://github.com/fish-shell/fish-shell) *the friendly interactive shell* 
- [starship](https://starship.rs/) *Rust-Powered cross-shell prompt*

#### Screenshots
![lua-packer-plugins](https://imgur.com/98relTf.png)
![git-status](https://imgur.com/I5jtbNG.png)

##### fisher (A plugin manager for fish)
```console
$ fisher ls
jorgebucaran/fisher
jorgebucaran/nvm.fish
patrickf1/fzf.fish
```

### Create Symlinks
- individual files
`ln -s -f ~/dotfiles/fish/functions/tswap.fish ~/.config/fish/functions/tswap.fish`

- whole directory (skip the directory at the end)
`ln -s -f ~/dotfiles/nvim ~/.config/`
