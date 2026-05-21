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

    extraConfig = builtins.readFile ./config.lua;
  };
}
