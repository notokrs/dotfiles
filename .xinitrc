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

# Default Session
exec bspwm
exec dbus-launch --sh-syntax --exit-with-session bspwm
