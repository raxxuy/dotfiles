{ globalConfig, pkgs, ... }:

{
  home.username = globalConfig.user;
  home.homeDirectory = "/home/${globalConfig.user}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    vlc
    btop
    tree
    pywal16
    discord
    dart-sass
    localsend
    imagemagick
    pavucontrol
    jetbrains.idea-ultimate

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  imports = [
    ./caelestia.nix
    ./ghostty.nix
    ./spotify.nix
    ./theme.nix
    ./fish.nix
    ./nvim.nix
    ./git.nix
    ./zed.nix
    ./zen.nix
    ./hyprland
  ];
}
