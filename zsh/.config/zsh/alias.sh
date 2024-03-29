function _git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Folder Viewing
alias ls="exa --group-directories-first"
alias l="exa --group-directories-first"
alias ll="exa -lahg --git --group-directories-first"
alias lt="exa --tree"

alias q="clear"
alias e="exit"
alias restart=reboot

# Folder switching shortcuts
alias c.="cd .."
alias c="cd ~"
alias cdd="cd ~/dotfiles && ls"
alias cdb="cd ~/build && ls"
alias cdc="cd ~/code && ls"
alias cdo="cd ~/documents && ls"
alias cdw="cd /mnt/windows/Users/parvu && ls"
alias cdv="cd ~/documents/vault/ && ls"

# Easy source of config
alias sb="source $ZDOTDIR/.zshrc"

# Git stuff
alias g="git"
alias gst="git status"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -v"
alias gca="git commit -v --amend"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpsup='git push --set-upstream origin $(_git_current_branch)'
alias gl="git pull --tags"
alias glf="git pull --tags --force"
alias ghist="git hist"
alias gcl="git clone"
alias "gc-"="git checkout --"
alias glast="git last"
alias gra="git remote add"
alias grbi="git rebase -i"
alias gsm="git submodule"
alias gd="git diff"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gbr="git branch"
alias grm="git rm"

# Smart git checkout master
gcm() {
  if [ "$(git branch | grep main)" ]; then
    git checkout main
  else
    git checkout master
  fi
}

# Tmux
alias t="tmux"
alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias tk="tmux kill-session -t"
alias tn="tmux new-session -s"

# Program substitutions
alias more="less -iFMRSX"
alias vim=nvim
alias "v."="nvim -c 'set rtp+=$(pwd)'"
alias which=whence
alias mutt=neomutt
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
alias "ec-"="ec -"

# Grep through aliases
gal() { alias | grep --color "^$1" }

# Generate rails project with solargraph definitions
rg() { rails new $1 -T --database=postgresql && wget -O $1/config/definitions.rb https://gist.githubusercontent.com/castwide/28b349566a223dfb439a337aea29713e/raw/d1d4462b92f411b378d87a39482b830e012513bd/rails.rb }

# Obsidian
alias vlt="cd ~/documents/vault/ && vim -c ':ObsidianToday'"
