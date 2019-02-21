# Folder Viewing
alias ls="exa --group-directories-first"
alias l="exa --group-directories-first"
alias la="exa -a --group-directories-first"
alias ll="exa -lahg --git --group-directories-first"
alias lc="clear && exa -lahg --git --group-directories-first"
alias lt="exa --tree"
alias c.="cd .."
alias q="clear"
alias e="exit"
alias c="cd ~"
alias cg="f() {; gdir=$(git rev-parse --show-toplevel); cd $gdir; echo $gdir; }; f"

# Easy source of config
alias sb="source ~/.zshrc"

# Git stuff
alias gh="git hist"
alias "gc-"="git checkout --"

# Program substitutions
alias more=less
alias which=whence
alias vim=nvim
alias mutt=neomutt
