if [[ $commands[VBoxClient] ]]; then
  pkill VBoxClient
fi

if [ -f $ZDOTDIR/zlogout-local ]; then
    . $ZDOTDIR/zlogout-local
fi
