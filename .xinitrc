#!/bin/sh
setxkbmap gb
polybar top -r &
$HOME/.local/bin/fehbg &
picom &
xsetroot -cursor_name left_ptr &
nm-applet &
[[ -f $XDG_CONFIG_HOME/laptop ]] && { cbatticon & }
dunst &
exec bspwm
