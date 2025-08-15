{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swww-daemon"
      "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
    ];
  };
}
