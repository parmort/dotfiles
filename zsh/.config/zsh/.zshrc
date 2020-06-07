# Load fzf
[ -f ~/.local/bin/fzf.zsh ] && source ~/.local/bin/fzf.zsh

# Load aliases
source $ZDOTDIR/alias.sh
source $ZDOTDIR/stow.sh

# Auto cd into typed directory
setopt autocd

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# Theme
source $ZDOTDIR/plugs/spaceship_angular/spaceship_angular.zsh

autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  dir
  git
  node
  angular
  exit_code
  char
)

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_CHAR_SYMBOL=❯
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_GIT_STATUS_DELETED=x
export SPACESHIP_NODE_PREFIX="with "
export SPACESHIP_JOBS_AMOUNT_PREFIX=" "

# Set keymap to emacs mode. Because 'vi' is in my $EDITOR, zsh autosets it to
# vi-mode
bindkey -e

source $ZDOTDIR/plugs/fsh/fast-syntax-highlighting.plugin.zsh
