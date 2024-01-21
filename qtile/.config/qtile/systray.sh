#!/usr/bin/env bash

hidden=/tmp/syshide.lock
file="$HOME/.config/polybar/modules.ini"

	if [[ ! -e $hidden ]]; then
			polybar-msg action "#systray.hook.1"
			xdo hide -n stalonetray
			touch "$hidden"
			# sed -i 's/systray\ninitial=.*/systray\ninitial=2/g' "$file"
		else
			polybar-msg action "#systray.hook.0"
			xdo show -n stalonetray
			xdo raise -n stalonetray
			rm "$hidden"
			# sed -i 's/systray\ninitial=.*/systray\ninitial=1/g' "$file"
	fi
