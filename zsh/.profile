# Default programs
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"

# Ensure XDG is set correctly
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Stock vim support (to load $XDG_CONFIG_HOME/nvim/init.vim)
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim" | source $MYVIMRC'

# Golang path
export GOPATH="$XDG_DATA_HOME/go"

# Clean up home dir
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEAuthority
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME"/solargraph

# Fivemat config (see https://github.com/tpope/fivemat)
export FIVEMAT_PROFILE=1

# Path
export PATH="$GOPATH:$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/share/npm/bin:$PATH"
export PATH=.git/safe/../../bin:$PATH
