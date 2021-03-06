#export XDG_CONFIG_HOME=$HOME/.config
#export XDG_DATA_HOME=$HOME/.local/share
#export XDG_CACHE_HOME=$HOME/.cache
#export XDG_RUNTIME_DIR=$HOME/.local/tmp

#export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
#export GOPATH=$XDG_DATA_HOME/go
#export GEM_HOME=$XDG_DATA_HOME/gem
#export PATH=~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
#export PATH=$GOPATH/bin:$PATH
#export PATH=$GEM_HOME/bin:$PATH
#
ZDOTDIR=$XDG_CONFIG_HOME/zsh
HISTFILE=$XDG_CACHE_HOME/zsh/history

function tmux {
	env tmux -2 -f ${XDG_CONFIG_HOME}/tmux/tmux.conf $argv
}
#
#export PAGER=less
#export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
#
#export EDITOR=vim
## Set vimrc's location and source it on vim startup
#export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
#
#export ANSIBLE_CONFIG=$XDG_CONFIG_HOME/ansible/ansible.cfg
#
#export PYLINTRC=$XDG_CONFIG_HOME/pylint/.pylintrc
#export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
#
#export TERMINAL=xterm
#
#export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
#export XAUTHORITY=$XDG_CACHE_HOME/X11/Xauthority
#export LANG=en_US.UTF-8
#
#if [ -f $ZDOTDIR/zshenv-local ]; then
#    . $ZDOTDIR/zshenv-local
#fi
