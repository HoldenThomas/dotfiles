#!/bin/sh

echo "i3(Default) | dwm Enter a command"
read input

case $input in
  i3|"") exec startx $XINITRC i3;;
  dwm) exec startx $XINITRC dwm;;
  *) $input;;
esac
