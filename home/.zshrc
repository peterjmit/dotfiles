#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases

# Symfony 2 alias
alias sf='php app/console'
alias git-prune-local="git branch --merged master | grep -v 'master$' | xargs git branch -d"
