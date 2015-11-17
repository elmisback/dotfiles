#!/usr/bin/env zsh

# Dependencies: zsh, curl, git, and GNU stow.

# TODO
# * Work out bootstrapping process.
# * Maybe add an optional victory tune.

# (the script's directory)
dotfiles=${0:a:h}
packages=(${$(ls -d $dotfiles/*/):t})

# Use proper zsh environment.
source $dotfiles/zsh/.zshenv

function main {
  # Exit on error.
  set -e

  set -- "$@"
  zparseopts h=help U=uninstall R=reinstall
  helptext="Run without flags to install.\n"
  helptext+="-U  uninstall\n"
  helptext+="-R  reinstall\n"
  helptext+="-h  display this message\n"
  if [ $help ]; then
    echo $helptext
    return
  elif [ $uninstall ]; then
    echo "Removing $dotfiles from $XDG_CONFIG_HOME..."
    uninstall
    return
  elif [ $reinstall ]; then
    stow_flags="-R"
  else 
    install
  fi
}

function uninstall {
  for pkg in $packages; do
    printf "  $pkg dotfiles... "
    if [ $pkg = 'home' ]; then
      stow -D --dir=$dotfiles --target=$HOME $pkg
    else
      rm -r $XDG_CONFIG_HOME/$pkg 2>/dev/null || :
    fi
    echo "removed!"
  done
}

function link_dotfiles {
  # Make sure $XDG_CONFIG_HOME exists first.
  mkdir $XDG_CONFIG_HOME 2>/dev/null || :
  for pkg in $packages; do
    printf "  $pkg... "
    if [ $pkg = 'home' ]; then
      stow $stow_flags --dir=$dotfiles --target=$HOME $pkg
    else
      mkdir $XDG_CONFIG_HOME/$pkg 2>/dev/null || :
      stow $stow_flags --dir=$dotfiles --target=$XDG_CONFIG_HOME/$pkg $pkg
    fi
    echo "done!"
  done
}

function link_internals {
  printf "  vim/nvim... "
  vim=$XDG_CONFIG_HOME/vim
  nvim=$XDG_CONFIG_HOME/nvim
  mkdir $vim/autoload 2>/dev/null || :
  ln -sf $nvim/init.vim $vim/.vimrc
  ln -sF $vim/autoload $nvim/
  echo "done!"

  printf "  vim-plug... "
  ln -sf $vim/vim-plug/plug.vim $vim/autoload/plug.vim
  echo "done!"
}

function install {
  echo "Linking $dotfiles to $XDG_CONFIG_HOME..."
  link_dotfiles
  echo ""
  echo "Generating internal configuration symlinks..."
  link_internals
}

main "$@"

#if [ ! -e $antigen ]; then
#  git clone $antigen_url $antigen
#fi
