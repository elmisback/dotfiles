if status --is-interactive
  bind -M insert \cn forward-word
  bind -M insert \cc kill-whole-line force-repaint
end

fzf_key_bindings
