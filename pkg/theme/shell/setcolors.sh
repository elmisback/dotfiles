#!/bin/bash
# Set terminal colors 0 - 21 according to the lines in the file passed.
# Args:
#   0 - 21: terminal colors
#   22: foreground
#   23: background
#   24: cursor
#
# NOTE iTerm unsupported.
# Look at base16 project to add iTerm support.

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# Load the values into an array.
declare -a A
readarray -t A < "$1"

# 0 - 15: 16 color space
# 16 - 21: 256 color space
for i in `seq 0 21`
do
  printf $printf_template $i ${A[i]}
done

# foreground / background / cursor color
printf $printf_template_var 10 ${A[22]}  # foreground
printf $printf_template_var 11 ${A[23]}  # background
printf $printf_template_var 12 ${A[24]}  # cursor
