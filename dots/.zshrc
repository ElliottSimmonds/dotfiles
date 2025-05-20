# Lines configured by zsh-newuser-install
HISTFILE=~/.config/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/elliott/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# aliases
alias zyp='sudo zypper'
alias ff='fastfetch'
alias ll='ls -ll'

eval "$(starship init zsh)"
