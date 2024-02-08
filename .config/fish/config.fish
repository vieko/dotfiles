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

# GIT
alias g="git"
alias gs="git status"
alias ga="git add"
alias gp="git push origin"
alias gl="git ll"
alias gd="git diff -w"
alias gds="git diff --staged"
alias gbr="git br"
alias gco="git co"

# CONVENIENCE
alias fd="fdfind"
alias rm="trash"
alias st="fast"
alias bat="batcat"
alias bottom="btm"
alias lg="lazygit"
alias fa="list_aliases"
alias sc="source ~/.config/fish/config.fish"
alias cl="clear"
alias re="reset"
alias pn="pnpm"
alias upn="~/.config/functions/update-pnpm.sh"

# EDITOR
alias vi="nvim"
alias vim="nvim"
alias demons="nvim"
alias summon="tmux"

# APT
alias apt="sudo apt-get"
alias cs="sudo apt-cache search"

# CLOUDOPS
alias gam="bin/gam/gam"
alias iftop="sudo iftop"
alias iotop="sudo iotop"

# APPIMAGES
alias heptabase="nohup ~/AppImages/Heptabase.AppImage >/dev/null 2>&1 disown"

# FIXES
alias fixeasy="~/.config/functions/reset-easyeffects.sh"
alias fefx="~/.config/functions/reset-easyeffects.sh"
alias toggledns="~/.config/functions/toggle-dns.sh"
alias resetaudio="~/.config/functions/reset-audio.sh"

# GAMES
alias chessx="nohup ~/Documents/Chess/Apps/chessx/release/chessx >/dev/null 2>&1 disown"

# PYTHON
pyenv init - | source
alias py="python3"
alias snake="python3"
alias python="python3"

# pnpm
set -gx PNPM_HOME "/home/vieko/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
