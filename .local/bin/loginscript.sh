#!/bin/sh

echo "DWM(Enter/dwm) | i3(i/i3) | KDE(k/kde) Enter a command"
read input

case $input in
  dwm|"") exec startx $XINITRC dwm;;
  i|i3) exec startx $XINITRC i3;;
  k|kde) exec startx $XINITRC kde;;
  *) $input;;
esac
