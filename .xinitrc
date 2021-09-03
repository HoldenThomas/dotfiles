#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] &&  xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

###########################################
###### For Saving Application passwords such as nextcloud
### Edit /etc/pam.d/login
### auth	optional	pam_gnome_keyring.so
### session 	optional 	pam_gnome_keyring.so	auto_start
### Edit /etc/pam.d/passwd
### password 	optional 	pam_gnome_keyring.so
### Open seahorse and add new password keyring called Login with same password as user and make default
### Uncommit first two lines below
###########################################
#eval $(gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK
#nextcloud --background &

picom -f &
dunst &
setrgb &
setbg &
dwmblocks &
sxhkd &
remaps &
setMonitor &
while true; do
	dwm
done
exec dwm
