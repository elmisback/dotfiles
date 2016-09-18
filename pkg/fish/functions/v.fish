function v --description 'Quickly open files with vim'
  if test -z (fasd -f "$argv")
    vim "$arg"
  else
    fasd -fe vim "$argv"
  end
end
