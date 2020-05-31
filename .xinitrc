#!/bin/sh
setxkbmap gb
polybar top -r &
$HOME/.local/bin/fehbg &
picom &
xsetroot -cursor_name left_ptr &
nm-applet &
cbatticon &
dunst &
exec bspwm
