export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

HISTFILE=$XDG_DATA_HOME/zsh/history
ZDOTDIR=$XDG_CONFIG_HOME/zsh
PAGER=less
EDITOR=nvim
export MYVIMRC=$XDG_CONFIG_HOME/vim/.vimrc

# TODO is this necessary?
# Set CLICOLOR if you want Ansi Colors in iTerm2 
# CLICOLOR=1

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Library/TeX/texbin
