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

# Link Sublime
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl