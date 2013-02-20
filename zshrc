# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="manu"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Example aliases
alias lla="ls -la"
alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby compleat gem textmate thor)

source $ZSH/oh-my-zsh.sh

#export CLICOLOR=1
#export LSCOLORS='ExFxCxDxbxegedabagacad'

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/usr/local/share/npm/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# My own additions:
if [ -f ~/.zshrc_local ]; then
	source ~/.zshrc_local
fi
