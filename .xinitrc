#!/bin/sh
[ -f ~/.Xresources ] && xrdb -merge -I $HOME ~/.Xresources
picom -f &
dunst &
setrgb &
setbg &
dwmblocks &
sxhkd &
remaps &
while true; do
	dwm
done
exec dwm
