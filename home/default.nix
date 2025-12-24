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
    docker-compose
    jetbrains.idea

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    rocmPackages.rocm-smi
  ];

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "hyprland.target" ];
      After = [ "hyprland.target" ];
    };
    Install = {
      WantedBy = [ "hyprland.target" ];
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

  xdg.portal = {
    enable = true;
    config.common.default = "hyprland";
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  imports = [
    ./leta-shell.nix
    ./ghostty.nix
    ./spotify.nix
    ./theme.nix
    ./fonts.nix
    ./fish.nix
    ./nvim.nix
    ./git.nix
    ./zed.nix
    ./zen.nix
    ./hyprland
  ];
}
