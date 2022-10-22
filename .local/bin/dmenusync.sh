#!/bin/sh

input="$(printf "website\\nnas\\ntablet\\nphone\\nexpansion" | dmenu -i -p "Select option: ")" || exit 1

case $input in
	"website")
		syncWeb="$(printf "push websites\\npull websites" | dmenu -i -p "Choose Website sync option: ")" || exit 1
		case $syncWeb in
			"push websites") $TERMINAL -e zsh -c 'echo "Pushing website in 2 seconds"; sleep 2; rsync -vrP --exclude git --exclude html --delete-after ~/Documents/websites/ root@holdenthomas.xyz:/var/www/; read' ;;
			"pull websites") $TERMINAL -e zsh -c 'echo "Pulling website in 2 seconds"; sleep 2; rsync -vrP --exclude git --exclude html --delete-after root@holdenthomas.xyz:/var/www/ ~/Documents/websites/; read' ;;
		esac ;;
	"nas") $TERMINAL -e zsh -c 'echo "Syncing NasBox in 2 seconds"; sleep 2; rsync -rtgoD -vP --delete /run/media/holden/HDD8T/Sync/ /run/media/holden/Truenas/Storage/Sync/; read';;
	"Tablet")
		syncTablet="$(printf "music\\nvideos\\nphotos\\n" | dmenu -i -p "Choose Tablet sync option: ")" || exit 1
		case $syncTablet in
			"music") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=.thumbnails --exclude=iTunes --exclude="YouTube Music"/"10 Hours" --exclude="YouTube Music"/Videos /run/media/holden/HDD8T/Sync/Music/ /run/media/holden/android/Music/; read';;
			"videos") $TERMINAL -e zsh -c 'echo "Syncing videos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/HDD8T/Sync/Videos/MV/AMV/ /run/media/holden/android/Videos/AMV/; read';;
			"photos") $TERMINAL -e zsh -c 'echo "Syncing photos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=Family/"Johns Pictures" /run/media/holden/HDD8T/Sync/Pictures/ /run/media/holden/android/Pictures/; read';;
		esac ;;
	"phone")
		syncPhone="$(printf "music\\nvideos\\nphotos\\n" | dmenu -i -p "Choose Phone sync option: ")" || exit 1
		case $syncPhone in
			"music") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=.thumbnails --exclude=iTunes --exclude="YouTube Music"/"10 Hours" --exclude="YouTube Music"/Videos /run/media/holden/HDD8T/Sync/Music/ ~/android/Internal\ shared\ storage/Music/; read';;
			"videos") $TERMINAL -e zsh -c 'echo "Syncing videos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/HDD8T/Sync/Videos/MV/AMV/ ~/android/Internal\ shared\ storage/Videos/AMV/; read';;
			"photos") $TERMINAL -e zsh -c 'echo "Syncing photos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=Family/"Johns Pictures" /run/media/holden/HDD8T/Sync/Pictures/ ~/android/Internal\ shared\ storage/Pictures/; read';;
		esac ;;
    "expansion") $TERMINAL -e zsh -c 'echo "Syncing Expansion disc in 2 seconds"; sleep 2; rsync -avP --delete /run/media/holden/HDD8T/Sync/ /run/media/holden/Expansion/Sync/; read';;
esac
