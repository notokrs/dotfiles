#!/usr/bin/env sh
userResources=$HOME/.Xresources

# Merge in defaults and keymaps
if [ -f "$userResources" ]; then
    xrdb -load "$userResources"
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

# Default Session
exec dbus-launch --exit-with-session bspwm
