# read history with vim
function h
  tmux capture-pane -S - -p | vim + -M -R -
end
