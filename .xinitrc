#!/bin/sh

userresources=$HOME/.config/X11/hidpi
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#dunst -font "LiberationSans 18" &
xbindkeys

~/src/status/main &
xset r rate 200 50 &
picom -b

#cool &
setsid gentoo-pipewire-launcher restart &
xwallpaper --zoom ~/media/images/wallpapers/DSC0510\ ladder.JPG &
picom -b
unclutter &

dwm

