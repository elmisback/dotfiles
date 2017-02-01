function v --description 'Quickly open files with vim'
  # TODO: if isdir, use fzf on the dir
  if test -z (fasd -f "$argv")
    vim "$argv"
  else
    fasd -Rfl "$argv" | fzf -1 -0 --no-sort -m | tr '\n' ' '| read -l -a result; and vim $result
  end
end
