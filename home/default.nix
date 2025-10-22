{ globalConfig, pkgs, ... }:

{
  home.username = globalConfig.user;
  home.homeDirectory = "/home/${globalConfig.user}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tree
    discord
    localsend
    pavucontrol
    jetbrains.idea-ultimate

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

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
