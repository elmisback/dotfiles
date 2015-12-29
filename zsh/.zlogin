if [[ $commands[VBoxClient] ]]; then
  VBoxClient --clipboard
fi

if [[ -a $HOME/.local/bin/virtualenvwrapper.sh ]]; then
  source $HOME/.local/bin/virtualenvwrapper.sh
fi
