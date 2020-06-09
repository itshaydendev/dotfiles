#!/bin/sh
setxkbmap gb
$HOME/.local/bin/fehbg &
picom &
xsetroot -cursor_name left_ptr &
nm-applet &
[[ -f $XDG_CONFIG_HOME/laptop ]] && { cbatticon & }
dunst &
[[ -f $XDG_CONFIG_HOME/laptop ]] || $XDG_CONFIG_HOME/xrandr/main.sh
[[ -f /usr/lib/kdeconnectd ]] && /usr/lib/kdeconnectd &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec bspwm
