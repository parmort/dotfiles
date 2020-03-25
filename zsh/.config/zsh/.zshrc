export PATH="$HOME/.local/bin:$PATH"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=.git/safe/../../bin:$PATH

export EDITOR='nvim'
[[ -n $SSH_CONNECTION ]] && export EDITOR='vim'

[ -f ~/.local/bin/fzf.zsh ] && source ~/.local/bin/fzf.zsh

autoload -U promptinit; promptinit
prompt spaceship

source $ZDOTDIR/alias.sh
source $ZDOTDIR/stow.sh
