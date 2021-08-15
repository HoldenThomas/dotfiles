#!/bin/sh
picom -f &
dunst &
setrgb &
setbg &
dwmblocks &
sxhkd &
while true; do
	dwm
done
exec dwm
