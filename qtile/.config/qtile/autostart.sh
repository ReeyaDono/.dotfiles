#!/bin/bash

# Load Picom
picom &

# Load notification service
dunst &

# Setup Wallpaper and update colors
~/.config/qtile/wallpaper.sh init

# Terminate already running bar instances
killall -q polybar
# killall -q stalonetray

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# qtile cmd-obj -o group scratchpad -f dropdown_toggle -a systray
# xdo hide -N stalonetray && touch "/tmp/syshide.lock"
polybar -r bar-left 2>&1 | tee -a /tmp/polybar.log & disown
polybar -r bar-right 2>&1 | tee -a /tmp/polybar.log & disown
polybar -r bar-center 2>&1 | tee -a /tmp/polybar.log & disown
