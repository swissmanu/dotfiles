#!/bin/bash

# Thanks to http://mths.be/osx

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Show Time For Battery Live
defaults write com.apple.menuextra.battery ShowPercent -string "NO"                                                                 
defaults write com.apple.menuextra.battery ShowTime -string "YES"                                                                   

# Expand Save Panel By Default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true                                                         

# Expand Print Panel By Default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true                                                            

# Don't Save Into iCloud by Default:
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false                                                         

# Close Print Dialog After Queue Has Finished:
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true                                                        

# Disable Press-And-Hold-Key Annoyance:
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false