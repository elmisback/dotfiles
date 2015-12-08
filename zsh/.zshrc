source $XDG_CONFIG_HOME/zsh/antigen/antigen.zsh
source $XDG_CONFIG_HOME/theme/shell/base16-ateliersavanna.dark.sh

# Load the oh-my-zsh library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# Command completion.
autoload -U compinit
compinit

# Autocomplete command-line switches for aliases.
setopt completealiases

# nvim aliases.
alias vimdiff="nvim -d"

# NOTE tmux can't be aliased because of its tpm dependency :(

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
    fasd -e nvim -f $@
    [[ -z "$(fasd -f $@)" ]] && nvim $@
  }

  alias e=nvim_edit
  alias o='a -e open_command'
fi
