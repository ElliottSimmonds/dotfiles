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

fastfetch

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# custom prompt
eval "$(starship init zsh)"
# syntax highlighting, should be last
source ~/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
