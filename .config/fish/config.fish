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

# EDITOR
alias vi="nvim"
alias vim="nvim"

# VERSION CONTROL
alias ga="git add"
alias gap="git add --patch"
alias gai="git add --interactive"
alias gb="git branch -av"
alias gba="git for-each-ref --sort=-committerdate --color="always" --format='%(committerdate:short) %(authorname) %(color:red) %(refname:lstrip=1) %(color:reset)' refs/heads refs/remotes"
alias gop="git open"
alias gc="git commit"
alias gcm="git commit -m"
alias gcl="git clone"
alias gco="git checkout"
alias gcoo="git checkout --"
alias gdl="git_last_diff"
alias gf="git fetch"
alias gi="git init"
alias gl="git log --graph --pretty='format:%C(yellow)%h%Creset %C(red)%G?%Creset%C(green)%d%Creset %s %Cblue(%cr) %C(bold blue)<%aN>%Creset'"
alias gll="git log --pretty='format:%C(yellow)%h%Creset %C(red)%G?%Creset%C(green)%d%Creset %s %Cblue(%cr) %C(bold blue)<%aN>%Creset'"
alias gL="gl --stat"
alias gp="git push"
alias gpl="git pull --rebase --autostash"
alias gs="git status --short ."
alias gss="git status"
alias gst="git stash"
alias gr="git reset HEAD"
alias grv="git rev-parse"

# CLOUDOPS
alias gam="bin/gam/gam"
alias iftop="sudo iftop"
alias iotop="sudo iotop"

