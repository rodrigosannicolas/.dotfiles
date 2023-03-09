#!/bin/sh

echo "Creating symlinks..."

create_symlink () {
  if [ -e $HOME/$2 ]; then rm -rf $HOME/$2; fi
  ln -s $HOME/.dotfiles/$1 $HOME/$2
}

create_symlink "alacritty/.alacritty.yml" ".alacritty.yml"
create_symlink "git/.gitconfig"           ".gitconfig"
create_symlink "i3/config"                ".config/i3/config"
create_symlink "nvim"                     ".config/nvim"
create_symlink "p10k/.p10k.zsh"           ".p10k.zsh"
create_symlink "rubocop/.rubocop.yml"     ".rubocoop.yml"
create_symlink "skhd/.skhdrc"             ".skhdrc"
create_symlink "tmux/.tmux.conf"          ".tmux.tmux"
create_symlink "yabai/.yabairc"           ".yabairc"
create_symlink "zsh/.zsh_aliases"         ".zsh_aliases"
create_symlink "zsh/.zshrc"               ".zshrc"
