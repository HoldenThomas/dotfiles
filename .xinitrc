#!/bin/sh
session=${2:-i3}

case $session in
    i3) exec i3;;
    dwm) picom -f &
	dunst &
	#xrdb ${XDG_CONFIG_HOME:-$HOME/.config}/x11/xresources &
	setrgb &
	setbg &
	dwmblocks &
	exec dwm ;;
    *) exec $1;;
esac
