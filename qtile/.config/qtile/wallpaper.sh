#!/bin/bash
# Modified from Stephan Raabe script
#

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"

# Create cache file if not exists
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "$HOME/wallpaper/default.jpg" > "$cache_file"
fi

current_wallpaper=$(cat "$cache_file")

case $1 in

    # Load wallpaper from .cache of last session 
    "init")
        if [ -f $cache_file ]; then
            wal -q -i $current_wallpaper --backend colorz
        else
            wal -q -i ~/Pictures/Wallpapers/ --backend colorz
        fi
    ;;

    # Randomly select wallpaper 
    *)
        wal -q -i ~/Pictures/Wallpapers/ --backend colorz
    ;;

esac

# ----------------------------------------------------- 
# Reload qtile to color bar
# ----------------------------------------------------- 
qtile cmd-obj -o cmd -f reload_config

# ----------------------------------------------------- 
# Get new theme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"
echo "Wallpaper: $wallpaper"
newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"

sleep 1

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
notify-send "Colors and Wallpaper updated" "with image $newwall"
echo "Done."
