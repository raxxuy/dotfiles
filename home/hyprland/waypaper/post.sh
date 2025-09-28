#!/run/current-system/sw/bin/bash
wallpaper="$1"

echo "Setting wallpaper and generating color scheme for: $wallpaper"

wal -i "$wallpaper"

echo "Applying new colors..."

if [ -f "$HOME/.cache/wal/colors.fish" ]; then
    fish -c "source $HOME/.cache/wal/colors.fish"
    echo "Fish colors updated in real time."
else
    echo "Warning: Fish color file not found at $HOME/.cache/wal/colors.fish"
fi

(ags quit; ags run) &
ags_pid=$! # Store the PID of the background process
echo "AGs quit and run initiated in the background (PID: $ags_pid)."

echo "Restarting Ghostty for new colors..."

pkill -f "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false --working-directory=$HOME"

sleep 1

ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false --working-directory=$HOME &
ghostty_pid=$!
echo "New Ghostty instance opened (PID: $ghostty_pid)."

echo "Script finished."
