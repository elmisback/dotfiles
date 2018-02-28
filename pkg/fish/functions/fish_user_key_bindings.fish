if status --is-interactive
  functions -q fzf_key_bindings; and fzf_key_bindings
  bind -M insert \cc kill-whole-line force-repaint
end
