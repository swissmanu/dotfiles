#!/bin/bash

# Install dotfiles
# Shamelessly copied from github.com/pstadler/
for symlink in hammerspoon tmux.conf gitconfig gitignore_global zshrc vimrc fzfcommands alacritty.yml
do
	rm ~/.$symlink
	ln -s $PWD/$symlink ~/.$symlink
done

mkdir ~/.config
ln -s $PWD/.config/starship.toml ~/.config/starship.toml
