#!/bin/sh

neofetch
figlet Welcome $(whoami)
echo "DWM(Enter/dwm) | i3(i/i3) | KDE(k/kde) Enter a command"
read input

case $input in
  dwm|"") exec startx dwm;;
  i|i3) exec startx i3;;
  k|kde) exec startx kde;;
  *) $input;;

esac
