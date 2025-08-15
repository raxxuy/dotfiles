{ lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [ "swww-daemon" ] ++ lib.optionals (pkgs.ghostty != null) [
      "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
    ];
  };
}
