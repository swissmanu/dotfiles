## oh-my-zsh
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras compleat yarn)

source $ZSH/oh-my-zsh.sh



## Starhsip
# Load Starhsip
eval "$(starship init zsh)"

##
# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export LANG=en_US.UTF8

# fuck terminal command (Ensure thefuck homebrew cask is installed)
eval "$(thefuck --alias)"

# Source fzf Commands
source ~/.fzfcommands

# Environment specific additions:
if [ -f ~/.zshrc_local ]; then
	source ~/.zshrc_local
fi


