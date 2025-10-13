{ config, globalConfig, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    hyprshot
    hyprpicker
    imagemagick
    brightnessctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "Super";

      exec-once = [
        "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false --working-directory=$HOME"
      ];

      monitor = [ ",1920x1080@180,auto,1" ];

      input = {
        kb_layout = "us,mk";
        kb_options = "grp:alt_shift_toggle";
      };

      debug = {
        disable_logs = false;
      };
    };
  };

  imports = [
    ./binds.nix
    ./appearance.nix
  ];
}

