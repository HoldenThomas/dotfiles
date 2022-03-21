#!/bin/sh

input="$(printf "Split\\nTab\\nStack\\nReload\\nRestart" | dmenu -p "Select option: ")" || exit 1

case $input in
  "Split") i3-msg layout toggled split ;;
  "Tab") i3-msg layout tabbed ;;
  "Stack") i3-msg layout stacking ;;
  "Reload") i3-msg reload ;;
  "Restart") i3-msg restart ;;
esac
