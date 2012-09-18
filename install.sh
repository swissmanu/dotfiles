#!/bin/bash

# Install dotfiles
# Shamelessly copied from github.com/pstadler/
for symlink in gitconfig gitignore_global slate zshrc
do
	rm ~/.$symlink
	ln -s $PWD/$symlink ~/.$symlink
done

# Install ZSH Theme
ln -s $PWD/ZSH\ Themes/manu.zsh-theme ~/.oh-my-zsh/themes/manu.zsh-theme