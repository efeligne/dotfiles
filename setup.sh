#!/bin/sh

CONFIG=$HOME/.config
DOTFILES=$HOME/.dotfiles

echo '---- installing homebrew ----' &&
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)" &&

echo '---- installing nerd-font ----' &&
brew tap homebrew/cask-fonts &&
brew install --cask font-jetbrains-mono-nerd-font &&

echo '---- installing packages ----' &&
brew install exa bat ripgrep w3m pandoc tmux neovim tree-sitter luarocks starship rustup zsh-autosuggestions jq &&
brew install --cask iterm2 alacritty &&

echo '---- installing rust ----' &&
rustup-init -y &&

echo '---- installing node vesrsion manager ----' &&
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$(curl -sL https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r ".tag_name")/install.sh | bash &&
export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" &&
nvm install --lts &&

echo '---- applying configs ----' &&
mkdir -p $CONFIG/git &&
cp $DOTFILES/git/config $CONFIG/git/config &&
ln -s $DOTFILES/git/.gitignore $CONFIG/git/.gitignore &&
git config --global core.excludesfile $CONFIG/git/.gitignore &&
ln -s $DOTFILES/.zshrc $HOME/.zshrc &&
ln -s $DOTFILES/alacritty $CONFIG/alacritty &&
ln -s $DOTFILES/nvim $CONFIG/nvim &&
ln -s $DOTFILES/tmux $CONFIG/tmux &&

echo '---- installing ohmyzsh ----' &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc &&
/bin/zsh ~/.zshrc

