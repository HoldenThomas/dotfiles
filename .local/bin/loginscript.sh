#!/bin/sh

echo "dwm(Default) | i3 Enter a command"
read input

case $input in
  dwm|"") exec startx $XINITRC dwm;;
  i3) exec startx $XINITRC i3;;
  *) $input;;
esac
