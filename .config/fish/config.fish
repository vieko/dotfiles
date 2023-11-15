set fish_greeting

set -Ux PAGER most
set -Ux MANPAGER most
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux TMPDIR /home/vieko/tmp

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

# EDITOR
alias vi="nvim"
alias vim="nvim"
alias summon="nvim"

# APT
alias apt="sudo apt-get"
alias cs="sudo apt-cache search"

# CLOUDOPS
alias gam="bin/gam/gam"
alias iftop="sudo iftop"
alias iotop="sudo iotop"

# APPIMAGES
alias heptabase="nohup ~/AppImages/Heptabase-1.9.0.AppImage >/dev/null 2>&1 disown"

# FIXES
alias fixeasy="pw-metadata -n settings 0 clock.force-quantum 2048"
alias fefx="pw-metadata -n settings 0 clock.force-quantum 2048"

# GAMES
alias chessx="nohup ~/Documents/Chess/Apps/chessx/release/chessx >/dev/null 2>&1 disown"
