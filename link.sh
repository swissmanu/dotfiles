#!/bin/bash

# Install dotfiles
# Shamelessly copied from github.com/pstadler/
for symlink in hammerspoon tmux.conf gitconfig gitignore_global zshrc vimrc fzfcommands alacritty.yml
do
	rm ~/.$symlink
	ln -s $PWD/$symlink ~/.$symlink
done

# Install ZSH Theme
ln -s $PWD/ZSH\ Themes/manu.zsh-theme ~/.oh-my-zsh/themes/manu.zsh-theme

# Link Sublime
# ln -s "$PWD/Sublime Text 2/Preferences.sublime-settings" "~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings"
