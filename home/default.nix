{ globalConfig, pkgs, ... }:

{
  home.username = globalConfig.user;
  home.homeDirectory = "/home/${globalConfig.user}";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    # cli
    tree
    btop
    xdg-utils
    deepfilternet
    docker-compose

    # rust
    gcc
    rustc
    cargo
    rust-analyzer

    # programs
    vlc
    discord
    obsidian
    localsend
    obs-studio
    pavucontrol
    qbittorrent
    neovim

    # dev
    jetbrains.idea
    jetbrains.webstorm

    # fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # gpu
    rocmPackages.rocm-smi
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "zeditor";
    LADSPA_PATH = "${pkgs.deepfilternet}/lib/ladspa";
  };

  systemd.user.services.deepfilternet = {
    Unit = {
      Description = "DeepFilterNet Noise Suppression";
      After = [ "pipewire.service" ];
    };

    Service = {
      ExecStart = "${pkgs.deepfilternet}/bin/deep-filter pipewire";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

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
  xdg.userDirs.setSessionVariables = false;

  xdg.portal = {
    enable = true;
    config.common.default = "hyprland";
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "ghostty.desktop" ];
  };

  imports = [
    ./leta-shell.nix
    ./ghostty.nix
    ./spotify.nix
    ./theme.nix
    ./fonts.nix
    ./fish.nix
    # ./nvim.nix
    ./git.nix
    ./zed.nix
    ./zen.nix
    ./hyprland
  ];
}
