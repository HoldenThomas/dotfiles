#!/bin/sh

###########################################
###### For Saving Application passwords such as nextcloud
### Edit /etc/pam.d/login
### auth	optional	pam_gnome_keyring.so
### session 	optional 	pam_gnome_keyring.so	auto_start
### Edit /etc/pam.d/passwd
### password 	optional 	pam_gnome_keyring.so
### Open seahorse and add new password keyring called Login with same password as user and make default
###########################################

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
if [ ! -z $(pacman -Qqe | grep liquidctl) ] ; then
  displayset Monitors
  setrgb &
  imwheel -b 45 &
  ckb-next -b &
fi
[ "$1" = "dwm" ] && dwmblocks &
[ "$1" = "openbox" ] && tint2 &
picom -f &
dunst &
remaps &
redshift -l 42.51:-73.61 &
sxhkd &
setbg
nextcloud --background &
