#!/bin/sh

input="$(printf "Website\\nNAS\\nPhone\\nExpansion" | dmenu -i -p "Select option: ")" || exit 1

case $input in
	"Website")
		syncWeb="$(printf "Pull websites\\nPull git\\nPush websites\\nPush git style.css" | dmenu -i -p "Choose Website sync option: ")" || exit 1
		case $syncWeb in
			"Pull websites") $TERMINAL -e zsh -c 'echo "Pulling website in 2 seconds"; sleep 2; rsync -vrP --exclude git --exclude html --delete-after root@holdenthomas.xyz:/var/www/ ~/Documents/websites/; read' ;;
			"Pull git") $TERMINAL -e zsh -c 'echo "Pulling git in 2 seconds"; sleep 2; rsync -vrLP --exclude "*.git" --delete-after root@holdenthomas.xyz:/var/www/git/ ~/Documents/websites/git/; read' ;;
			"Push websites") $TERMINAL -e zsh -c 'echo "Pushing website in 2 seconds"; sleep 2; rsync -vrP --exclude git --exclude html --delete-after ~/Documents/websites/ root@holdenthomas.xyz:/var/www/; read' ;;
			"Push git style.css") $TERMINAL -e zsh -c 'echo "Pushing git in 2 seconds"; sleep 2; rsync -vrP ~/Documents/websites/git/style.css git@holdenthomas.xyz:/var/www/git/style.css; read' ;;
		esac
		;;
	"NAS") $TERMINAL -e zsh -c 'echo "Syncing NasBox in 2 seconds"; sleep 2; rsync -rtgoD -vP --delete /run/media/holden/HDD8T/Sync/ /run/media/holden/Truenas/Storage/Sync/; read';;
	"Phone")
		$TERMINAL -e zsh -c 'echo "not ready yet"; read'; exit 1
		syncPhone="$(printf "Music\\nVideos\\nPhotos\\n" | dmenu -i -p "Choose Phone sync option: ")" || exit 1
		case $syncPhone in
			"Music") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=.thumbnails --exclude=iTunes --exclude="YouTube Music"/"10 Hours" --exclude="YouTube Music"/Videos /run/media/holden/HDD8T/Sync/Music/ ~/phone/android/Music/; read';;
			"Videos") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/HDD8T/Sync/Videos/AMV/ ~/phone/android/Videos/AMV/; read';;
			"Photos") $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude="iPod Photo Cache" /run/media/holden/HDD8T/Sync/Pictures/"Itunes Pictures"/ ~/phone/android/Pictures/"Itunes Pictures"/; read';;
		esac
		;;
    "Expansion") $TERMINAL -e zsh -c 'echo "Syncing Expansion disc in 2 seconds"; sleep 2; rsync -avP --delete /run/media/holden/HDD8T/Sync/ /run/media/holden/Expansion/Sync/; read';;
esac
