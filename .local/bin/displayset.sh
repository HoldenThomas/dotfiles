#!/bin/sh

[ $# -eq 1 ] && input="$1" || input="$(printf "TV\\nMonitors\\nMonitor 1\\nMonitor 2" | dmenu -i -p "Select which monitor: ")" || exit 1;


case $input in
	"TV") xrandr --output HDMI-A-0 --primary --mode 3840x2160 --rate 30.00 --scale .35 --set TearFree on --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off;;
	"Monitors") xrandr --output DisplayPort-0 --primary --mode 2560x1440 --rate 144.00 --set TearFree on --output DisplayPort-1 --mode 1920x1080 --rate 60.00 --left-of DisplayPort-0 --set TearFree on --output DisplayPort-2 --off --output HDMI-A-0 --off;;
	"Monitor 1") xrandr --output DisplayPort-0 --primary --mode 2560x1440 --rate 144.00 --set TearFree on --output DisplayPort-1 --off --output DisplayPort-2 --off --output HDMI-A-0 --off;;
	"Monitor 2") xrandr --output DisplayPort-1 --mode 1920x1080 --rate 60.00 --set TearFree on --output DisplayPort-0 --off --output DisplayPort-2 --off --output HDMI-A-0 --off;;
esac
