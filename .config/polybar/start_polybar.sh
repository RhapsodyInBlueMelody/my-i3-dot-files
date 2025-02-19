#!/bin/bash

# Kill any existing polybar instances
killall -q polybar

# Wait for processes to die
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar bars
polybar top --config=~/.config/polybar/config.ini &
polybar bottom --config=~/.config/polybar/config.ini &
