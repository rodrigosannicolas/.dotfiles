#!/bin/bash

##################################################################################################
# Install or update multiple tools using MacOS's package manager homebrew
##################################################################################################

if [[ $(command -v brew) == "" ]]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Updating Homebrew..."
  brew update
fi

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing services..."
brew install neovim
brew install ripgrep
brew install skhd
brew install tmux
brew install yabai

##################################################################################################
# Create symbolic links to configuration files stored in ~/.dotfiles 
##################################################################################################

echo "Creating symlinks..."

if [ -e $HOME/.alacritty.yml ]; then rm -rf $HOME/.alacritty.yml; fi
ln -s $HOME/.dotfiles/alacritty/.alacritty.yml $HOME/.alacritty.yml

if [ -e $HOME/.gitconfig ]; then rm -rf $HOME/.gitconfig; fi
ln -s $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

if [ -d $HOME/.config/nvim ]; then rm -rf $HOME/.config/nvim; fi
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

if [ -e $HOME/.rubocop.yml ]; then rm -rf $HOME/.rubocop.yml; fi
ln -s $HOME/.dotfiles/rubocop/.rubocop.yml $HOME/.rubocop.yml

if [ -e $HOME/.skhdrc ]; then rm -rf $HOME/.skhdrc; fi
ln -s $HOME/.dotfiles/skhd/.skhdrc $HOME/.skhdrc

if [ -e $HOME/.tmux.conf ]; then rm -rf $HOME/.tmux.conf; fi
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf

if [ -e $HOME/.yabairc ]; then rm -rf $HOME/.yabairc; fi
ln -s $HOME/.dotfiles/yabai/.yabairc $HOME/.yabairc

##################################################################################################
# Restart the services of multiple packages installed with homebrew
##################################################################################################

echo "Restarting services..."

brew services restart neovim
brew services restart skhd
brew services reatart tmux
brew services restart yabai 
