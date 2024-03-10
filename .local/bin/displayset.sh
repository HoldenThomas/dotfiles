#!/bin/sh

[ $# -eq 1 ] && input="$1" || input="$(printf "Monitors\\nTV" | dmenu -i -p "Select which monitor: ")" || exit 1;


case $input in
	"Monitors") xrandr --output DP-0 --primary --mode 5120x1440 --rate 240.00 --output DP-2 --mode 2560x1440 --rate 165.00 --right-of DP-0 --output HDMI-0 --off;;
	"TV") xrandr --output HDMI-0 --primary --mode 3840x2160 --rate 30.00 --scale .35 --output DP-0 --off --output DP-2 --off;;
esac
