#!/bin/bash

wallpaper=$1

wal -i $wallpaper

# Kill any running Ghostty processes
pkill -f ghostty

# Wait a moment for processes to fully terminate
sleep 1

# Start Ghostty with the specified options
ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false

ags quit | ags run
