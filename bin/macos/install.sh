#!/bin/bash

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
