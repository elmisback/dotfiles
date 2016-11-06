set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set PREFIX $HOME/.local
set -x XDG_DATA_HOME $PREFIX/share
set -x XDG_RUNTIME_DIR $PREFIX/tmp

set -x GEM_HOME $XDG_DATA_HOME/gem
set -x GOPATH $XDG_DATA_HOME/go
set -x npm_config_prefix $XDG_DATA_HOME/npm

set -x PATH $GOPATH/bin $GEM_HOME/bin $npm_config_prefix/bin $PREFIX/bin /usr/local/bin /usr/bin /bin

set -x VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

mkdir -p $XDG_CACHE_HOME/fasd
set -x _FASD_DATA $XDG_CACHE_HOME/fasd/data
