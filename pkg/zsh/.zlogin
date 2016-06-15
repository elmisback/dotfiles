export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
export GOPATH=$XDG_DATA_HOME/go
export PATH=~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$GOPATH:$GOPATH/bin:$PATH

if [[ $commands[VBoxClient] ]]; then
  VBoxClient --clipboard
fi

if [ -f $ZDOTDIR/.zlogin-local ]; then
    . $ZDOTDIR/.zlogin-local
fi
