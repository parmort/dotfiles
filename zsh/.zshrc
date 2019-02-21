stty -ixon

autoload -Uz compinit
compinit

# Reload Xresources
xrdb ~/.Xresources

# Source needed scripts
source ~/.scripts/functions.sh
source ~/.scripts/tmuxinator.zsh

# hostname[user]%  ...  [folder] branch
setopt PROMPT_SUBST
PROMPT='%F{1}%m%F{13}[%n]%F{3}%F{3}%#%f '
RPROMPT='%F{4}[$(dir)]%F{2}$(gbr)%f'

HISTFILE=~/.tmp/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
export GPG_TTY=$(tty)

bindkey -e

#=========#
# Exports #
#=========#

# Set the default editor
export EDITOR='nvim'

# Add local folders
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

# Add ruby gems to the PATH
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Have go be in ~/code/go rather ~/go
export GOPATH=$HOME/code/go

#=========#
# Aliases #
#=========#

# Folder Switching/Viewing
alias ls="exa --group-directories-first"
alias l="exa --group-directories-first"
alias la="exa -a --group-directories-first"
alias ll="exa -lahg --git --group-directories-first"
alias lc="clear && exa -lahg --git --group-directories-first"
alias lt="exa --tree"
alias c.="cd .."
alias q="clear"
alias e="exit"
alias c="cd"

# cd to directories
alias cds="cd ~/sketchbook"

# Pacman
alias PS="packer"
alias Ps="sudo pacman -Syy"
alias PR="sudo pacman -Rns"
alias PU="sudo pacman -Syu"

# Rm Aliases
alias rm="rm"
alias rd="rm -r"

# Git
alias g="hub"

# Tmux
alias t="tmux -2u"
alias tls="tmux -2u list-sessions"
alias tds="tmux -2u kill-session -t"
alias ta="tmux -2u attach -t"
alias tns="tmux -2u new-session -s"
tmux_alias d dot
tmux_alias e editor
tmux_alias p drop
tmux_alias l ledger

alias tss="tmux_sketch"

# Source .bashrc
alias sb="source ~/.zshrc"

# Scan keycode
alias keys="bash ~/.scripts/keyScan.sh"

# Colors
alias colors="bash ~/.scripts/colors.sh"

# Use less instead of more
alias more="less"

# Use $EDITOR
alias vi=$EDITOR
alias vim=$EDITOR

# Mutt
alias mutt="neomutt"
