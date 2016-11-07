# Preferred prefix
  # Allows PREFIX=$PREFIX when building to install for command-line use
  # Necessary for below.
  set PREFIX $HOME/.local

# XDG Base Directory definitions (keep $HOME clean)
  set -x XDG_CACHE_HOME $HOME/.cache
  set -x XDG_CONFIG_HOME $HOME/.config
  set -x XDG_DATA_HOME $PREFIX/share
  set -x XDG_RUNTIME_DIR $PREFIX/tmp

# Help various tools with XDG compliance

  # gem
    set -x GEM_HOME $XDG_DATA_HOME/gem

  # go
    set -x GOPATH $XDG_DATA_HOME/go

  # node
    set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history

  # npm
    set -x npm_config_prefix $XDG_DATA_HOME/npm

  # http
    set -x HTTPIE_CONFIG_DIR $XDG_CONFIG_HOME/httpie

  # ipython
    set -x IPYTHONDIR $XDG_DATA_HOME/ipython

  # terminfo
    set -x TERMINFO $XDG_DATA_HOME/terminfo
    set -x TERMINFO_DIRS $XDG_DATA_HOME/terminfo /usr/share/terminfo

  # fasd
    mkdir -p $XDG_CACHE_HOME/fasd
    set -x _FASD_DATA $XDG_CACHE_HOME/fasd/data

  # vim
    # Set vimrc's location and source it on vim startup
    set -x VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

  # less
    mkdir -p $XDG_CACHE_HOME/less
    set -x LESSHISTFILE $XDG_CACHE_HOME/less/history
    set -x LESSKEY $XDG_CONFIG_HOME/less/lesskey

  # X11
    set -x XINITRC $XDG_CONFIG_HOME/X11/xinitrc
    set -x XAUTHORITY $XDG_CACHE_HOME/X11/Xauthority

# other variables
  set -x PAGER less
  set -x EDITOR vim
  set -x LANG en_US.UTF-8

# set PATH
  set -x PATH $GOPATH/bin $GEM_HOME/bin $npm_config_prefix/bin $PREFIX/bin /usr/local/bin /usr/bin /bin
