{ config, pkgs, ... }:

{
  home.username = "micho";
  home.homeDirectory = "/home/micho";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    bun
    discord
    firefox
    pavucontrol

    # fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  # Enable XDG user directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true; # makes sure they're created
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
    desktop = "${config.home.homeDirectory}/Desktop";
    publicShare = "${config.home.homeDirectory}/Public";
    templates = "${config.home.homeDirectory}/Templates";
  };

  imports = [
    ./ghostty.nix
    ./vscode.nix
    ./theme.nix
    ./fish.nix
    ./git.nix
    ./hyprland
    ./nvim
    ./ags
  ];
}
