#!/bin/sh

input="$(printf "website" | dmenu -i -p "Select option: ")" || exit 1

case $input in
	"website")
        $TERMINAL -e zsh -c 'echo "Pushing website in 2 seconds"; sleep 2; \
            rsync -vrP --exclude html --delete-after ~/Documents/holdenthomasxyz/public/ root@holdenthomas.xyz:/var/www/holdenthomasxyz/; \
            rsync -vrP --exclude html --delete-after ~/Documents/ticklemanxyz/public/ root@holdenthomas.xyz:/var/www/ticklemanxyz; \
            read' ;;
esac
