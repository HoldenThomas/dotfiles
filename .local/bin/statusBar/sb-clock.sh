#!/bin/sh

case $BLOCK_BUTTON in
	1) notify-send "This Month" "$(cal --color=always | sed "s/..7m/<b><span color=\"red\">/;s/..27m/<\/span><\/b>/")";;
esac

date "+(%a)%D %I:%M%p"
