#!/usr/bin/env zsh

# Dependencies: zsh, curl, git, and GNU stow.

# TODO
# * Work out bootstrapping process.

# Exit on error.
set -e

# (the script's directory)
dotfiles=${0:a:h}

# Use proper zsh environment.
source $dotfiles/zsh/.zshenv

echo "Generating internal configuration symlinks..."

printf "vim... "
mkdir $dotfiles/nvim/autoload 2>/dev/null || :
ln -sf $dotfiles/nvim/init.vim $dotfiles/vim/.vimrc
ln -sf $dotfiles/nvim/autoload $dotfiles/vim/autoload
echo "[x]"

printf "vim-plug... "
ln -sf $dotfiles/vim/vim-plug/plug.vim $dotfiles/nvim/autoload/plug.vim
ln -sf $dotfiles/vim/vim-plug/plug.vim $dotfiles/vim/autoload/plug.vim
echo "[x]"

echo ""

echo "Linking $dotfiles to $XDG_CONFIG_HOME..."

# Make sure $XDG_CONFIG_HOME exists first.
mkdir $XDG_CONFIG_HOME 2>/dev/null || :
for pkg in $(ls -d $dotfiles/*); do
  mkdir $XDG_CONFIG_HOME/$pkg 2>/dev/null || :
  stow --dir=$dotfiles --target=$XDG_CONFIG_HOME/$pkg $pkg
done

# function manual_link {
#   if [ -d $XDG_CONFIG_HOME ]; then
#     stow
#     read -q "REPLY?$XDG_CONFIG_HOME will be overwritten. Back up to ${XDG_CONFIG_HOME}_old?[y/n]"
#     if [ $REPLY = 'y' ]; then
#       echo "Backing up..."
#       cp -r $XDG_CONFIG_HOME ${XDG_CONFIG_HOME}_old
#     fi
#   fi
#   ln -sF $dotfiles $XDG_CONFIG_HOME
# }

#if [ ! -e $antigen ]; then
#  git clone $antigen_url $antigen
#fi
#
#
### antigen -- zsh package/theme manager
## git clone https://github.com/zsh-users/antigen.git
#antigen="$XDG_CONFIG_HOME/zsh/antigen"
#antigen_url="https://github.com/zsh-users/antigen.git"
#if [ ! -d $antigen ]; then
#  git clone $antigen_url $antigen
#fi
#
## vim/nvim setup
### Link nvim.
#nvim="$XDG_CONFIG_HOME/nvim/init.vim"
#if [ ! -e $nvim ]; then
#  ln -s nvim/init.vim $nvim
#fi
#
### vim-plug -- vim plugin manager
#vim_plug="$XDG_CONFIG_HOME/nvim/autoload/plug.vim"
#vim_plug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
#if [ ! -f $vim_plug ]; then
#  echo 'Installing vim-plug...'
#  curl -fLo $vim_plug --create-dirs $vim_plug_url
#fi
