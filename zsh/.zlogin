export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
export PATH=~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

if [[ $commands[VBoxClient] ]]; then
  VBoxClient --clipboard
fi

if [ -f $ZDOTDIR/.zlogin-local ]; then
    . $ZDOTDIR/.zlogin-local
fi
