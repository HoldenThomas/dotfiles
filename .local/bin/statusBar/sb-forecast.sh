#!/bin/sh

weatherreport="${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport"
getforecast() { curl -sf "wttr.in/$LOCATION" > "$weatherreport" || exit 1 ;}

showweather() { printf "%s" "$(sed '16q;d' "$weatherreport" |
	grep -wo "[0-9]*%" | sort -rn | sed "s/^/☔/g;1q" | tr -d '\n')"
sed '13q;d' "$weatherreport" | grep -o "m\\([-+]\\)*[0-9]\\+" | sed 's/+//g' | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " 🥶" $1 "°","🌞" $2 "°"}' ;}

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e less -Srf "$weatherreport" ;;
	2) getforecast && showweather ;;
esac

[ "$(stat -c %y "$weatherreport" 2>/dev/null | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] ||
	getforecast

showweather
