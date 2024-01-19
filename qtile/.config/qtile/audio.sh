#!/bin/bash
#

case $1 in 
    "up")
        pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;

    "down")
        pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
esac
