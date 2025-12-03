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

    settings = {
      "$mod" = "Super";

      exec-once = [
        "leta-shell"
        "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false --working-directory=$HOME"
      ];

      monitor = [ ",1920x1080@180,auto,1" ];

      input = {
        kb_layout = "us,mk";
      };

      debug = {
        disable_logs = false;
      };
    };
  };

  imports = [
    ./binds.nix
    ./rules.nix
    ./appearance.nix
  ];
}
