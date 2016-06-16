export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

HISTFILE=$XDG_DATA_HOME/zsh/history
ZDOTDIR=$XDG_CONFIG_HOME/zsh

export PAGER=less

export EDITOR=vim
# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

export PYLINTRC=$XDG_CONFIG_HOME/pylint/.pylintrc
export WORKON_HOME=$XDG_DATA_HOME/virtualenvs

export TERMINAL=xterm

export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export LANG=C.UTF-8

if [ -f $ZDOTDIR/.zshenv-local ]; then
    . $ZDOTDIR/.zshenv-local
fi
