export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

HISTFILE=$XDG_DATA_HOME/zsh/history
ZDOTDIR=$XDG_CONFIG_HOME/zsh
PAGER=less
EDITOR=nvim
export MYVIMRC=$XDG_CONFIG_HOME/vim/.vimrc
export WORKON_HOME=$XDG_DATA_HOME/virtualenvwrapper
export TERM="xterm-256color"
export PYLINTRC=$XDG_CONFIG_HOME/pylint/.pylintrc

export PATH=~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
