source $XDG_CONFIG_HOME/zsh/antigen/antigen.zsh
source $XDG_CONFIG_HOME/theme/shell/base16-ateliersavanna.dark.sh
eval "$(dircolors $XDG_CONFIG_HOME/theme/shell/dircolors)"

# Load the oh-my-zsh library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle docker
antigen bundle pip
antigen bundle command-not-found
antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tarruda/zsh-autosuggestions

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search


# Load the theme.
#antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# zsh-completions
autoload -U compinit
compinit

# Autosuggestions HACK commented because currently broken
# autosuggest-toggle
# AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

# zsh-history-substring-search
setopt HIST_IGNORE_ALL_DUPS
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Autocomplete command-line switches for aliases.
setopt completealiases

# nvim aliases.
alias vimdiff="nvim -d"

# fasd configuration
if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache

  function nvim_edit {
    # Try using fasd, fall back to nvim.
    if [ -f $@[$#] ]; then
      nvim $@
    else
      fasd -e nvim -f $@
      [[ -z "$(fasd -f $@)" ]] && nvim $@
    fi
  }

  alias e=nvim_edit
  alias o='a -e open_command'
fi

# Generate the histfile if it doesn't yet exist.
mkdir -p ${HISTFILE:h} && touch $HISTFILE
