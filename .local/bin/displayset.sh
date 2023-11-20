#!/bin/sh

[ $# -eq 1 ] && input="$1" || input="$(printf "Monitors\\nTV" | dmenu -i -p "Select which monitor: ")" || exit 1;


case $input in
	"Monitors") xrandr --output DisplayPort-4 --primary --mode 2560x1440 --rate 165.00 --set TearFree on --output DisplayPort-5 --mode 1920x1080 --rate 60.00 --left-of DisplayPort-4 --set TearFree on --output HDMI-A-4 --off;;
	"TV") xrandr --output HDMI-A-4 --primary --mode 3840x2160 --rate 30.00 --scale .35 --set TearFree on --output DisplayPort-4 --off --output DisplayPort-5 --off;;
esac
