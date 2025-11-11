{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    nautilus
    hyprshot
    hyprpicker
    brightnessctl
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "Super";

      exec-once = [
        "/home/micho/Public/leta-shell/build/bin/leta-shell"
        #  "caelestia-shell"
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
    ./appearance.nix
  ];
}
