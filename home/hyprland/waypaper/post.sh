#!/run/current-system/sw/bin/bash
wallpaper=$1
wal -i $wallpaper
source ~/.config/fish/config.fish

# Run ags commands in a subshell to prevent directory change
(ags quit | ags run)
sleep 1

# Kill background Ghostty process
bg_pids=$(pgrep -f "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false")
if [ -n "$bg_pids" ]; then
    kill $bg_pids
    sleep 1
fi

ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false
