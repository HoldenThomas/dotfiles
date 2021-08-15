#!/bin/sh
session=${2:-dwm}

case $session in
    i3) exec i3;;
    dwm) picom -f &
	dunst &
	setrgb &
	setbg &
	dwmblocks &
	exec dwm ;;
    *) exec $1;;
esac
