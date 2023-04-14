#!/bin/sh

input="$(printf "website\\nnas\\ntablet\\nphone\\nexpansion" | dmenu -i -p "Select option: ")" || exit 1

case $input in
	"website")
        $TERMINAL -e zsh -c 'echo "Pushing website in 2 seconds"; sleep 2; \
            rsync -vrP --exclude html --delete-after ~/Documents/holdenthomasxyz/public/ root@holdenthomas.xyz:/var/www/holdenthomasxyz/; \
            rsync -vrP --exclude html --delete-after ~/Documents/ticklemanxyz/public/ root@holdenthomas.xyz:/var/www/ticklemanxyz; \
            read' ;;

	"nas") 
        $TERMINAL -e zsh -c 'echo "Syncing NasBox in 2 seconds"; sleep 2; \
            rsync -rtgoD -vP --delete /run/media/holden/hdd-08t/sync/ /run/media/holden/truenas/Storage/sync/; \
            read';;

	"Tablet")
		syncTablet="$(printf "music artists\\nvideos\\nphotos\\n" | dmenu -i -p "Choose Tablet sync option: ")" || exit 1
		case $syncTablet in
			"music artists") 
                $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/hdd-08t/sync/music/Artists /run/media/holden/android/Music/Artists; \
                read';;
			"videos") 
                $TERMINAL -e zsh -c 'echo "Syncing videos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/hdd-08t/sync/videos/MV/AMV/ /run/media/holden/android/Videos/AMV/; \
                read';;
			"photos") 
                $TERMINAL -e zsh -c 'echo "Syncing photos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=Family/"Johns Pictures" /run/media/holden/hdd-08t/sync/pictures/ /run/media/holden/android/Pictures/; \
                read';;
		esac ;;

	"phone")
		syncPhone="$(printf "music artists\\nvideos\\nphotos\\n" | dmenu -i -p "Choose Phone sync option: ")" || exit 1
		case $syncPhone in
			"music artists") 
                $TERMINAL -e zsh -c 'echo "Syncing music in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/hdd-08t/sync/music/ ~/android/"Internal shared storage"/Music/; \
                read';;
			"videos") 
                $TERMINAL -e zsh -c 'echo "Syncing videos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete /run/media/holden/hdd-08t/sync/videos/MV/AMV/ ~/android/"Internal shared storage"/Videos/AMV/; \
                read';;
			"photos") 
                $TERMINAL -e zsh -c 'echo "Syncing photos in 2 seconds"; sleep 2; \
				rsync -vrPO --no-perms --inplace --size-only --delete --exclude=Family/"Johns Pictures" /run/media/holden/hdd-08t/sync/pictures/ ~/android/"Internal shared storage"/Pictures/; \
                read';;
		esac ;;

    "expansion") 
        $TERMINAL -e zsh -c 'echo "Syncing Expansion disc in 2 seconds"; sleep 2; \
            rsync -avP --delete /run/media/holden/hdd-08t/sync/ /run/media/holden/Expansion/sync/; \
            read';;
esac
