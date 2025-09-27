{ config, pkgs, ... }:

{
  imports = [
    ./appearance.nix
    ./autostart.nix
    ./binds.nix
    ./env.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "Super";
      monitor = [ ",1920x1080@180,auto,1" ];

      input = {
        kb_layout = "us,mk";
        kb_options = "grp:alt_shift_toggle";
      };
    };
  };

  home.file.".config/waypaper".source = ./waypaper;

  home.packages = with pkgs; [
    swww
    pywal16
    nautilus
    waypaper
    hyprshot
    hyprpicker
    imagemagick
    brightnessctl
  ];
}
