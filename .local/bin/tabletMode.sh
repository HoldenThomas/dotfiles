#!/bin/sh
fconfig="$HOME/.local/share/.keyboard"
id=12

keyfunc() {
	[ ! -f $fconfig ] && echo "Creating config file" && echo "enabled" > $fconfig && var="enabled" || var=$(cat $fconfig)

	[ $var = "disabled" ] && \
		( echo "enable" > $fconfig && xinput reattach 12 3 && xrandr --output eDP-1 --rotate normal --auto && xinput set-prop 11 --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0 && notify-send "Keyboard Enabled" ) || \
		( echo "disabled" > $fconfig && xinput float 12 && xrandr --output eDP-1 --rotate left --auto && xinput set-prop 11 --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1 && notify-send "Keyboard Disabled" )

}

keyfunc
