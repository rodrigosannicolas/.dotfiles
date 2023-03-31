#!/bin/bash

echo "Restarting services..."

brew services restart neovim
brew services restart skhd
brew services reatart tmux
brew services restart yabai 
