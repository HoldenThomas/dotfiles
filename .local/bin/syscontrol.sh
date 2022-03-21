#!/bin/sh

input="$(printf "Shutdown\\nReboot\\nLock\\nLogout" | dmenu -p "Select option: ")" || exit 1

case $input in
	"Shutdown") shutdown now ;;
	"Reboot") reboot ;;
	"Lock") i3lock -c 111111 ;;
  "Logout") pkill -KILL -u $(whoami) ;;
esac
