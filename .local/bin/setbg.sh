#!/bin/sh

# This script does the following:
#	Run by itself, set the wallpaper (at X start).
#	If given a file, set that as the new wallpaper.
#	If given a directory, choose random file in it.

# Location of link to wallpaper link.
bgloc="${XDG_DATA_HOME:-$HOME/.local/share/}/wall.png"

trueloc="$(readlink -f "$1")" &&
case "$(file --mime-type -b "$trueloc")" in
	image/* ) cp "$(readlink -f "$1")" "$bgloc" && notify-send -i "$bgloc" "Changing wallpaper..." ;;
	inode/directory ) cp "$(find "$trueloc" -iregex '.*.\(jpg\|jpeg\|png\|gif\)' -type f | shuf -n 1)" "$bgloc" && notify-send -i "$bgloc" "Random Wallpaper chosen." ;;
	*) notify-send "Error" "Not a valid image." ; exit 1;;
esac

xwallpaper --zoom "$bgloc"