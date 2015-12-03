#!/usr/bin/env zsh

# Dependencies: zsh, curl, git, and GNU stow.

# TODO
# * Work out bootstrapping process.
# * Add debug flag.
# * Maybe add an optional victory tune.

# (the script's directory)
dotfiles=${0:a:h}
packages=(${$(ls -d $dotfiles/*/):t})

# Use proper zsh environment.
source $dotfiles/zsh/.zshenv

function main {
  # Exit on error.
  set -e

  # Parse flags.
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
    rm -rf $XDG_CONFIG_HOME/$pkg 2>/dev/null || :
    echo "removed!"
  done
  while read ptr_path; do
    rm $HOME/${ptr_path:t};
  done < $dotfiles/home.pointers
}

function link_dotfiles {
  # Make sure $XDG_CONFIG_HOME exists first.
  mkdir $XDG_CONFIG_HOME 2>/dev/null || :
  for pkg in $packages; do
    printf "  $pkg... "
    mkdir $XDG_CONFIG_HOME/$pkg 2>/dev/null || :
    stow $stow_flags --dir=$dotfiles --target=$XDG_CONFIG_HOME/$pkg $pkg
    echo "done!"
  done
}

function install_plugins {
  printf "  vim-plug... "
  vim=$XDG_CONFIG_HOME/vim
  rm -rf $vim/vim-plug
  git clone -q https://github.com/junegunn/vim-plug $vim/vim-plug
  echo "done!"
  printf "  antigen... "
  zsh=$XDG_CONFIG_HOME/zsh
  rm -rf $zsh/antigen
  git clone -q https://github.com/zsh-users/antigen $zsh/antigen
  echo "done!"
  printf "  tpm... "
  tmux=$XDG_CONFIG_HOME/tmux
  rm -rf $tmux/tpm
  git clone -q https://github.com/tmux-plugins/tpm $tmux/plugins/tpm
  echo "done!"
}

function link_internals {
  printf "  vim/nvim... "
  vim=$XDG_CONFIG_HOME/vim
  nvim=$XDG_CONFIG_HOME/nvim
  mkdir $vim/autoload 2>/dev/null || :
  ln -sf $nvim/init.vim $vim/.vimrc
  ln -sF $vim/autoload $nvim/
  ln -sf $vim/vim-plug/plug.vim $vim/autoload/plug.vim
  echo "done!"
}

function link_home {
  while read ptr_path; do 
    printf "  ${ptr_path:t}... "
    ln -sf $XDG_CONFIG_HOME/$ptr_path $HOME/${ptr_path:t}
    echo "done!"
  done < $dotfiles/home.pointers
}

function install {
  echo "Linking $dotfiles to $XDG_CONFIG_HOME..."
  link_dotfiles
  echo ""
  echo "Installing plugins..."
  install_plugins
  echo ""
  echo "Generating internal configuration symlinks..."
  link_internals
  echo ""
  echo "Generating HOME symlinks..."
  link_home
}

main "$@"
