#!/usr/bin/env bash

hidden=/tmp/syshide.lock
file="$HOME/.config/polybar/modules.ini"

	if [[ ! -e $hidden ]]; then
			polybar-msg action "#systray.hook.1"
			xdo hide -n stalonetray
			# qtile cmd-obj -o group scratchpad -f dropdown_toggle -a systray
			touch "$hidden"
			# sed -i 's/systray\ninitial=.*/systray\ninitial=2/g' "$file"
		else
			polybar-msg action "#systray.hook.0"
			xdo show -n stalonetray
			# xdo raise -n stalonetray
			# qtile cmd-obj -o group scratchpad -f dropdown_toggle -a systray
			rm "$hidden"
			# sed -i 's/systray\ninitial=.*/systray\ninitial=1/g' "$file"
	fi
