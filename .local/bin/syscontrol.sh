#!/bin/sh

input="$(printf "shutdown\\nreboot\\nlock\\nlogout" | dmenu -p "Select option: ")" || exit 1

case $input in
	"shutdown") shutdown now ;;
	"reboot") reboot ;;
	"lock") i3lock ;;
  "logout") pkill -KILL -u $(whoami) ;;
esac
