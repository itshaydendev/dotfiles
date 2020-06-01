#!/bin/sh
setxkbmap gb
pb &
$HOME/.local/bin/fehbg &
picom &
xsetroot -cursor_name left_ptr &
nm-applet &
[[ -f $XDG_CONFIG_HOME/laptop ]] && { cbatticon & }
dunst &
~/.config/xrandr/main.sh
/usr/lib/kdeconnectd
exec bspwm
