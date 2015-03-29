#!/bin/bash

# Logging
echo "====="
echo "Starting on $(date)"
echo "====="

# Daemons
urxvtd -q -o -f

# Background
xsetroot -solid black -cursor_name left_ptr

which xbacklight &>/dev/null
if [ $? -eq 0 ]; then
  xbacklight -set 20
fi

# No screen blanking, thank you
xset -dpms
xset s off

# Extra keys
if [ -f ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

exec ssh-agent xmonad
