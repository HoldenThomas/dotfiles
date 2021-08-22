#!/bin/sh
[ -f ~/.Xresources ] && xrdb -merge -I $HOME ~/.Xresources
picom -f &
dunst &
setrgb &
setbg &
dwmblocks &
sxhkd &
remaps &
setMonitor &
while true; do
	dwm
done
exec dwm
