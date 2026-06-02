#!/usr/bin/env bash
# Usage: clone repo to ~/dotfiles, then run this script
#   git clone <your-repo-url> ~/dotfiles && bash ~/dotfiles/install.sh
set -e

DOTFILES="$HOME/dotfiles"

if [ ! -d "$DOTFILES" ]; then
    echo "Error: $DOTFILES not found. Clone your dotfiles repo there first:"
    echo "  git clone <your-repo-url> ~/dotfiles"
    exit 1
fi

echo "==> Checking Homebrew..."
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Installing CLI tools..."
brew install \
    stow \
    git \
    neovim \
    tmux \
    fzf \
    fd \
    ripgrep \
    eza \
    bat \
    oh-my-posh

if [ -z "$CI" ]; then
    echo "==> Installing apps..."
    brew install --cask ghostty

    echo "==> Installing fonts..."
    brew install --cask font-jetbrains-mono-nerd-font
fi

echo "==> Installing Node..."
brew install node

echo "==> Installing oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "==> Installing zsh-syntax-highlighting..."
ZSH_PLUGINS="$HOME/.zsh/plugins"
mkdir -p "$ZSH_PLUGINS"
if [ ! -d "$ZSH_PLUGINS/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_PLUGINS/zsh-syntax-highlighting"
fi

echo "==> Installing tpm (tmux plugin manager)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "==> Stowing dotfiles..."
# Remove files that oh-my-zsh or other installers may have created
rm -f ~/.zshrc
cd "$DOTFILES"
stow -t ~ zsh oh-my-posh bat eza ghostty nvim tmux karabiner raycast

echo ""
echo "Done. Manual steps remaining:"
echo "  1. Restart terminal (or: source ~/.zshrc)"
echo "  2. Open nvim — Lazy will auto-install plugins"
echo "  3. In nvim run :MasonUpdate to install LSP servers"
echo "  4. Open tmux, press <prefix>I to install tpm plugins"
echo "  5. Run 'bat cache --build' to load bat themes"
