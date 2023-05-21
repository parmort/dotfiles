# Load fzf
[ -f ~/.local/bin/fzf.zsh ] && source ~/.local/bin/fzf.zsh

# Load aliases
source $ZDOTDIR/alias.sh
source $ZDOTDIR/stow.sh

# Auto cd into typed directory
setopt autocd

# Stop freezing
stty stop undef

# Set keymap to emacs mode. Because 'vi' is in my $EDITOR, zsh autosets it to
# vi-mode
bindkey -e

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# Theme
SPACESHIP_PROMPT_ORDER=(
  dir
  git
  exit_code
  char
)

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_RPROMPT_ADD_NEWLINE=true
export SPACESHIP_CHAR_SYMBOL="->"
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_GIT_STATUS_DELETED=x
export SPACESHIP_GIT_STATUS_AHEAD="↑"
export SPACESHIP_GIT_STATUS_BEHIND="↓"
export SPACESHIP_GIT_STATUS_DIVERGED="↨"
export SPACESHIP_JOBS_AMOUNT_PREFIX=" "

source ~/.config/zsh/plugs/spaceship-prompt/spaceship.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"

# Plugins
source $ZDOTDIR/plugs/fsh/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugs/zsh-autosuggestions/zsh-autosuggestions.zsh
