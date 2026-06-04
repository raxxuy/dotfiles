{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nautilus
    hyprshot
    hyprpicker
    brightnessctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    extraConfig = builtins.readFile ./config.lua;
  };
}
