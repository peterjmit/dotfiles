# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/pete/.zshrc'

autoload zmv
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="kphoen"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vagrant git-flow knife brew)

source $ZSH/oh-my-zsh.sh

# remove auto correct
unsetopt correct_all

# vim
set -o vi
bindkey -v

for file in ~/.{exports,aliases,localrc}; do
    [ -r "$file" ] && source "$file"
done
