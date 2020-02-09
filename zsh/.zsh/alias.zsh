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
alias gcaa="git commit -v --amend"
alias glast="git last"

# Program substitutions
alias more=less
alias which=whence
alias vim=nvim
alias mutt=neomutt

alias "ec-"="ec -"

#===========#
#-Functions-#
#===========#

# Grep through aliases
gal() { alias | grep "^$1" }

# Generate rails project with solargraph definitions
rg() { rails new $1 -T --database=postgresql && wget -O $1/config/definitions.rb https://gist.githubusercontent.com/castwide/28b349566a223dfb439a337aea29713e/raw/d1d4462b92f411b378d87a39482b830e012513bd/rails.rb }
