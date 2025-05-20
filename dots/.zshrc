HISTFILE=~/.config/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# tab autocompletion menu options
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

# load aliases
source ~/.config/aliasrc

# todo: setup auto suggestions and colours

fastfetch

eval "$(starship init zsh)"
