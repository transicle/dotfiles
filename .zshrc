clear

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd beep extendedglob notify share_history hist_fcntl_lock
bindkey -e
zstyle :compinstall filename '/home/lily/.zshrc'
autoload -Uz compinit
compinit
eval "$(starship init zsh)"

[[ ! -r '/home/lily/.opam/opam-init/init.zsh' ]] || source '/home/lily/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
