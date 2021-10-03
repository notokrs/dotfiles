#!/usr/bin/env sh
userresources=$HOME/.Xresources

# Merge in defaults and keymaps
if [ -f "$userresources" ]; then
    xrdb -load "$userresources"
fi

# start some nice programs
# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#   [ -x "$f" ] && . "$f"
#  done
#  unset f
# fi

# Default cursor
xsetroot -cursor_name left_ptr

#xscreensaver setting
xset s 600 dpms 600 600 600

#init keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

# Default Session
exec dbus-launch --exit-with-session bspwm
