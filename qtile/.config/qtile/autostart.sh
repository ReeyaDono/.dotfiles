#!/bin/bash

# Load Picom
picom &

# Setup Wallpaper and update colors
~/.config/qtile/wallpaper.sh init

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar -r bar-left 2>&1 | tee -a /tmp/polybar.log & disown
polybar -r bar-right 2>&1 | tee -a /tmp/polybar.log & disown
polybar -r bar-center 2>&1 | tee -a /tmp/polybar.log & disown
