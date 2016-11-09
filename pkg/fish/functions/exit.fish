function exit --description 'Prints a message and exits'
  printf "%*s\r" (tput cols) "SEE YOU SPACE COWBOY..."; sleep 2
  printf "%*s\r" (tput cols) " "
  builtin exit
end
