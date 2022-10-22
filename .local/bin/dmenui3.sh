#!/bin/sh

input="$(printf "split\\ntab\\nstack\\nreload\\nrestart" | dmenu -p "Select option: ")" || exit 1

case $input in
  "split") i3-msg layout toggled split ;;
  "tab") i3-msg layout tabbed ;;
  "stack") i3-msg layout stacking ;;
  "reload") i3-msg reload ;;
  "restart") i3-msg restart ;;
esac
