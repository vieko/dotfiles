set fish_greeting

# DOTFILES
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# GENERAL
alias y="xclip -selection clipboard -in"
alias p="xclip -selection clipboard -out"

# DIRECTORY
alias l="exa -1"
alias ll="exa -lg"
alias la="LC_COLLATE=c exa -la"

#CONVENIENCE
alias fd="fdfind"
alias rm="trash"
alias st="fast"
alias bat="batcat"
alias python="python3"
alias bottom="btm"
alias aliases="list_fish_aliases"

# EDITOR
alias vi="nvim"
alias vim="nvim"

# CLOUDOPS
alias gam="bin/gam/gam"
alias iftop="sudo iftop"
alias iotop="sudo iotop"

