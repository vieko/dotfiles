set fish_greeting

set -Ux PAGER most
set -Ux MANPAGER most
set -Ux EDITOR nvim
set -Ux VISUAL nvim

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
alias lg="lazygit"
alias fa="list_aliases"
alias sc="source ~/.config/fish/config.fish"
alias cl="clear"
alias re="reset"
alias fefx="pw-metadata -n settings 0 clock.force-quantum 2048"

# EDITOR
alias vi="nvim"
alias vim="nvim"

# APT
alias apt="sudo apt-get"
alias cs="sudo apt-cache search"

# CLOUDOPS
alias gam="bin/gam/gam"
alias iftop="sudo iftop"
alias iotop="sudo iotop"

# FIXES
alias fixeasy="pw-metadata -n settings 0 clock.force-quantum 2048"
