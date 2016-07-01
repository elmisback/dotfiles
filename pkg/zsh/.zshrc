#source $XDG_CONFIG_HOME/zsh/antigen/antigen.zsh
source $XDG_CONFIG_HOME/theme/shell/base16-ateliersavanna.dark.sh
eval "$(dircolors $XDG_CONFIG_HOME/theme/shell/dircolors)"

# Load the oh-my-zsh library.
#antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle docker
#antigen bundle pip
#antigen bundle command-not-found
#antigen bundle vi-mode

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle tarruda/zsh-autosuggestions

#antigen bundle zsh-users/zsh-completions
#antigen bundle zsh-users/zsh-history-substring-search

# Tell antigen that you're done.
#antigen apply

# zsh-completions
autoload -U compinit
mkdir -p $XDG_CACHE_HOME/zsh
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

# Autosuggestions HACK commented because currently broken
# autosuggest-toggle
# AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

# Autocomplete command-line switches for aliases.
setopt completealiases

# nvim aliases.
alias vimdiff="vim -d"

# Generate the histfile if it doesn't yet exist.
mkdir -p ${HISTFILE:h} && touch $HISTFILE

# fasd caching, if necessary
#fasd_cache="$XDG_DATA_HOME/fasd/.fasd-init-zsh"
#mkdir -p $XDG_DATA_HOME/fasd
#if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#  fasd --init auto >| "$fasd_cache"
#fi
#source "$fasd_cache"
#unset fasd_cache

mkdir -p $XDG_CACHE_HOME/fasd
export _FASD_DATA=$XDG_CACHE_HOME/fasd/data
eval "$(fasd --init auto)"

alias v='f -e vim' # quick opening files with vim
alias h='vim -M <(tmux capture-pane -S - -p) +' # read history with vim

export TMUX_TMPDIR="$XDG_RUNTIME_DIR"/tmux
mkdir -p $TMUX_TMPDIR
alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf"

if [ -f $ZDOTDIR/zshrc-local ]; then
    . $ZDOTDIR/zshrc-local
fi
