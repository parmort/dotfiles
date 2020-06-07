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
autoload -U promptinit; promptinit
prompt spaceship

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_CHAR_SYMBOL=❯
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_GIT_STATUS_DELETED=x
export SPACESHIP_HG_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_NODE_SHOW=false
export SPACESHIP_RUBY_SHOW=false
export SPACESHIP_ELM_SHOW=false
export SPACESHIP_ELIXIR_SHOW=false
export SPACESHIP_XCODE_SHOW_LOCAL=false
export SPACESHIP_XCODE_SHOW_GLOBAL=false
export SPACESHIP_SWIFT_SHOW_LOCAL=false
export SPACESHIP_SWIFT_SHOW_GLOBAL=false
export SPACESHIP_GOLANG_SHOW=false
export SPACESHIP_PHP_SHOW=false
export SPACESHIP_RUST_SHOW=false
export SPACESHIP_HASKELL_SHOW=false
export SPACESHIP_JULIA_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_AWS_SHOW=false
export SPACESHIP_VENV_SHOW=false
export SPACESHIP_CONDA_SHOW=false
export SPACESHIP_PYENV_SHOW=false
export SPACESHIP_DOTNET_SHOW=false
export SPACESHIP_EMBER_SHOW=false
export SPACESHIP_KUBECTL_SHOW=false
export SPACESHIP_KUBECONTEXT_SHOW=false
export SPACESHIP_TERRAFORM_SHOW=false
export SPACESHIP_BATTERY_SHOW=false
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_JOBS_AMOUNT_PREFIX=" "

# Set keymap to emacs mode. Because 'vi' is in my $EDITOR, zsh autosets it to
# vi-mode
bindkey -e

source $ZDOTDIR/plugs/fsh/fast-syntax-highlighting.plugin.zsh
