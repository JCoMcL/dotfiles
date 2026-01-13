#!/bin/sh

 if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
   [ -x "$f" ] && . "$f"
  done
  unset f
 fi

xbindkeys

~/src/status/main &
xset r rate 200 50 &

#cool &
setsid gentoo-pipewire-launcher restart &
xwallpaper --zoom ~/media/images/wallpapers/DSC0510\ ladder.JPG &
unclutter &
dunst &
#/usr/lib/pentablet/PenTablet.sh \mini &

dwm

