# Folder Viewing
alias ls="exa --group-directories-first"
alias l="exa --group-directories-first"
alias ll="exa -lahg --git --group-directories-first"
alias lt="exa --tree"

alias q="clear"
alias e="exit"

# Folder switching shortcuts
alias c.="cd .."
alias c="cd ~"
alias cdd="cd ~/dotfiles && ls"
alias cdb="cd ~/build && ls"
alias cdc="cd ~/code && ls"

# Easy source of config
alias sb="source ~/.zshrc"

# Git stuff
alias gh="git hist"
alias "gc-"="git checkout --"
alias gapr="git apply -R"
alias gcaa="git commit -v --amend"
alias gdf="git difftool"

# Program substitutions
alias more=less
alias which=whence
alias vim=nvim
alias mutt=neomutt
alias man=manpages

alias "ec-"="ec -"
alias ds=~/.scripts/drivesync

#===========#
#-Functions-#
#===========#

gal() { alias | grep "^$1" }
# ses() { find ~/.vim/sessions/* -type f | fzf | xargs -r $EDITOR -S }
theme() { sed 1q ~/.xrdb/theme.xrdb | cut -c 10- }
