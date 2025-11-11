{ config, globalConfig, ... }:

let
  hyprland = globalConfig.hyprland;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_out = 10;
      resize_on_border = true;
      allow_tearing = true;
      snap.enabled = true;
      "col.active_border" = "$color10";
    };

    decoration = {
      blur = {
        enabled = hyprland.blur.enabled;
        size = hyprland.blur.size;
        passes = hyprland.blur.passes;
        new_optimizations = true;
        xray = true;
        popups = true;
        noise = 0;
      };

      shadow.enabled = hyprland.shadow.enabled;
    };

    animations = {
      enabled = hyprland.animations.enabled;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = false;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
      vfr = true;
      vrr = 1;
    };

    xwayland = {
      use_nearest_neighbor = false;
      force_zero_scaling = true;
    };

    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };

    source = [
      "${config.home.homeDirectory}/.cache/leta-shell/wal/colors-hyprland.conf"
    ];
  };
}
