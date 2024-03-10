#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
ZDOTDIR=~/.config/zsh/

# merge in defaults and keymaps

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

dunst -font "LiberationSans 18" &
xbindkeys

#set locale for volume buttons
inputid=$(xinput list | sed -n 's/.*Intel Virtual.*id=\([0-9]*\).*keyboard.*/\1/p')
test -f ~/.config/volume-keys.xkb && xkbcomp -i $inputid ~/.config/volume-keys.xkb $DISPLAY

status &
xset r rate 200 50 &
picom -b

cool &

dwm 2> ~/.dwm.log

