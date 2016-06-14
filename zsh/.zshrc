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
compinit

# Autosuggestions HACK commented because currently broken
# autosuggest-toggle
# AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

# Autocomplete command-line switches for aliases.
setopt completealiases

# nvim aliases.
alias vimdiff="vim -d"

# Generate the histfile if it doesn't yet exist.
mkdir -p ${HISTFILE:h} && touch $HISTFILE
