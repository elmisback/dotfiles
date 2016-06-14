export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

HISTFILE=$XDG_DATA_HOME/zsh/history
ZDOTDIR=$XDG_CONFIG_HOME/zsh

export PAGER=less

export EDITOR=vim
export MYVIMRC=$XDG_CONFIG_HOME/vim/.vimrc

export PYLINTRC=$XDG_CONFIG_HOME/pylint/.pylintrc
export WORKON_HOME=$XDG_DATA_HOME/virtualenvs

export TERMINAL=xterm
export LANG=en_US.UTF-8

export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

if [ -f $ZDOTDIR/.zshenv-local ]; then
    . $ZDOTDIR/.zshenv-local
fi
