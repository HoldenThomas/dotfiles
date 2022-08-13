#!/bin/sh

input="$(printf "Website\\nNAS\\nTablet\\nExpansion" | dmenu -i -p "Select option: ")" || exit 1

case $input in
	"Website")
		syncWeb="$(printf "Push websites\\nPull websites" | dmenu -i -p "Choose Website sync option: ")" || exit 1
		case $syncWeb in
			"Push websites") $TERMINAL -e zsh -c 'echo "Pushing website in 2 seconds"; sleep 2; rsync -vrP --exclude git --exclude html --delete-after ~/Documents/websites/ root@holdenthomas.xyz:/var/www/; read' ;;
			"Pull websites") $TERMINAL -e zsh -c 'echo "Pulling website in 2 seconds"; sleep 2; rsync -vrP --exclude git --exclude html --delete-after root@holdenthomas.xyz:/var/www/ ~/Documents/websites/; read' ;;
		esac ;;
	"NAS") $TERMINAL -e zsh -c 'echo "Syncing NasBox in 2 seconds"; sleep 2; rsync -rtgoD -vP --delete /run/media/holden/HDD8T/Sync/ /run/media/holden/Truenas/Storage/Sync/; read';;
	"Tablet")
		syncTablet="$(printf "Music\\nVideos\\nPhotos\\n" | dmenu -i -p "Choose Tablet sync option: ")" || exit 1
		case $syncTablet in
			"Music") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=.thumbnails --exclude=iTunes --exclude="YouTube Music"/"10 Hours" --exclude="YouTube Music"/Videos /run/media/holden/HDD8T/Sync/Music/ /run/media/holden/android/Music/; read';;
			"Videos") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/HDD8T/Sync/Videos/AMV/ /run/media/holden/android/Videos/AMV/; read';;
			"Photos") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude="iPod Photo Cache" /run/media/holden/HDD8T/Sync/Pictures/Itunes\ Pictures/ /run/media/holden/android/Pictures/Itunes\ Pictures/; read';;
		esac ;;
	"Phone")
		syncTablet="$(printf "Music\\nVideos\\nPhotos\\n" | dmenu -i -p "Choose Phone sync option: ")" || exit 1
		case $syncTablet in
			"Music") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=.thumbnails --exclude=iTunes --exclude="YouTube Music"/"10 Hours" --exclude="YouTube Music"/Videos /run/media/holden/HDD8T/Sync/Music/ /run/media/holden/android/Music/; read';;
			"Videos") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/HDD8T/Sync/Videos/AMV/ /run/media/holden/android/Videos/AMV/; read';;
			"Photos") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude="iPod Photo Cache" /run/media/holden/HDD8T/Sync/Pictures/Itunes\ Pictures/ /run/media/holden/android/Pictures/Itunes\ Pictures/; read';;
		esac ;;
    "Expansion") $TERMINAL -e zsh -c 'echo "Syncing Expansion disc in 2 seconds"; sleep 2; rsync -avP --delete /run/media/holden/HDD8T/Sync/ /run/media/holden/Expansion/Sync/; read';;
esac
