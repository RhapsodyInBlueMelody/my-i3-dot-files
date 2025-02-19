#!/bin/bash

# Wait for X to be ready
while ! xprop -root _XROOTPMAP_ID > /dev/null 2>&1; do
    sleep 0.1
done

# Start Picom (with your config file if you have one)
picom --experimental-backends -b --config ~/.config/picom/picom.conf & # The & makes it run in the background
#or just
#picom &
