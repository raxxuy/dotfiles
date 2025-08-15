let
  inherit (import ../../hosts/micho/variables.nix) animations blur;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_out = 10;
      resize_on_border = true;
      allow_tearing = true;
      snap.enabled = true;
    };

    decoration = {
      blur = {
        size = blur.size;
        passes = blur.passes;
        new_optimizations = true;
        xray = true;
        popups = true;
        noise = 0;
      };

      shadow.enabled = false;
    };

    animations = {
      enabled = animations;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = false;
      vfr = true;
      vrr = 1;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
    };

    xwayland = {
      use_nearest_neighbor = false;
      force_zero_scaling = true;
    };

    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };
  };
}
