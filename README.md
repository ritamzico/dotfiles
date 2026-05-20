# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Contents |
|---------|----------|
| `zsh` | `.zshrc`, `.zsh/` |
| `oh-my-posh` | `.oh-my-posh/` |
| `nvim` | `.config/nvim/` |
| `tmux` | `.config/tmux/` |
| `ghostty` | `.config/ghostty/` |
| `bat` | `.config/bat/` |
| `eza` | `.config/eza/` |

## Install

```bash
git clone <your-repo-url> ~/dotfiles
bash ~/dotfiles/install.sh
```

## After install

1. Restart terminal (or `source ~/.zshrc`)
2. Open `nvim` — Lazy installs plugins automatically
3. In nvim run `:MasonUpdate` to install LSP servers
4. Open tmux, press `<prefix>I` to install tpm plugins
5. Run `bat cache --build` to load bat themes

## Adding a new config

```bash
mkdir -p ~/dotfiles/<name>/.config/<name>
mv ~/.config/<name> ~/dotfiles/<name>/.config/<name>
cd ~/dotfiles && stow -t ~ <name>
```

## Removing symlinks

```bash
cd ~/dotfiles && stow -D -t ~ <name>
```
