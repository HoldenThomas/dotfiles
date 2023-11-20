#!/bin/sh

###############################################################
### gnome-keyring setup
# Edit /etc/pam.d/login
# auth	    optional	pam_gnome_keyring.so
# session 	optional 	pam_gnome_keyring.so	auto_start
# Edit /etc/pam.d/passwd
# password 	optional 	pam_gnome_keyring.so
###############################################################
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Desktop startup applications
if [ ! -z $(uname -n | grep dt) ] ; then
  displayset.sh Monitors
  setrgb.sh &
  imwheel -b 45 &
fi

# If running dwm start dwmblocks
[ "$1" = "dwm" ] && dwmblocks &

# Applications
picom -f &
dunst &
remaps.sh &
! pidof -s redshift >/dev/null 2>&1 && redshift -l 42.51:-73.61 &
sxhkd &
setbg.sh
nextcloud --background &
syncthing --no-browser &
