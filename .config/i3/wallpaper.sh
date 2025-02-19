#! /bin/bash
nice xwinwrap -b -s -fs -st -sp -nf -ov -fdt -- mpv -wid WID --really-quiet --framedrop=vo --no-audio --panscan="1.0" --no-border --ontop --no-input-default-bindings --no-osd-bar --no-osc --loop --fullscreen ~/.wallpaper.gif
