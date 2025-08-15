{ pkgs, ... }:

{
  home.username = "micho";
  home.homeDirectory = "/home/micho";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    discord
    firefox
    pavucontrol
  ];

  imports = [
    ./ghostty.nix
    ./theme.nix
    ./git.nix
    ./hyprland
    ./nvim
  ];
}
