#!/bin/sh

# thanks to https://github.com/tacahilo/.dotfiles/blob/0c75dc897a307c976bc75e09bc40686e6f0533d1/Brewfile
# :)

PATH=/usr/local/bin:$PATH

TAPS=(
#    homebrew/binary
#    homebrew/dupes
#    homebrew/versions
#    homebrew/science
    # caskroom/versions
)

FORMULAS=(
    "git --with-brewed-curl --with-brewed-openssl --with-gettext --with-pcre"
    #caskroom/cask/brew-cask
    ssh-copy-id
    #zsh
    diff-so-fancy
    # thefuck
    git-extras
)

CASKS=(
    # dropbox
    # google-drive
    # firefox
    # google-chrome
#    iterm2
    # skitch
    # skype
    # virtualbox
    # vagrant

    qlcolorcode
    qlmarkdown
    quicklook-json
    qlstephen

    # controlplane
    # alfred
    # slate
    # caffeine
    # flux
    # appcleaner
    # spotify

    # atom
    # sublime-text3
)

function setup() {
    [ -x "/usr/local/bin/brew" ] || {
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    }
}

function install_brewfiles() {
    for tap in "${TAPS[@]}"; do
        brew tap $tap
    done

    for formula in "${FORMULAS[@]}"; do
        brew install $formula
    done
}

function install_caskfiles() {
    for cask in "${CASKS[@]}"; do
        brew cask install $cask
    done
}

function main() {
    setup

    brew update
    brew upgrade

    install_brewfiles
    install_caskfiles

    brew cleanup
    brew doctor
}

main
