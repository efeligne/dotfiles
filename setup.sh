#!/bin/sh

## Define variables
CONFIG=$HOME/.config
DOTFILES=$HOME/.dotfiles

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --skip-chsh
rm $HOME/.zshrc

## Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Add nerd fonts repo and install one of them
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

## Install packages
brew install exa bat ripgrep w3m pandoc tmux neovim tree-sitter luarocks starship rustup
brew install --cask iterm2 alacritty

## Install Rust
rustup-init -y

mkdir -p $CONFIG/git

cp $DOTFILES/git/config $CONFIG/git/config
ln -s $DOTFILES/git/.gitignore $CONFIG/git/.gitignore
git config --global core.excludesfile $CONFIG/git/.gitignore

ln -s $DOTFILES/.zshrc $HOME/.zshrc
ln -s $DOTFILES/alacritty $CONFIG/alacritty
ln -s $DOTFILES/nvim $CONFIG/nvim
ln -s $DOTFILES/tmux $CONFIG/tmux
