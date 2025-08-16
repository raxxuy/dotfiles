{ pkgs, ... }:

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
    };
  };

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
