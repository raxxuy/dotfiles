{ globalConfig, pkgs, ... }:

{
  home.username = globalConfig.user;
  home.homeDirectory = "/home/${globalConfig.user}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tree
    discord
    firefox
  ];

  imports = [
    ./ghostty.nix
    ./theme.nix
    ./nvim.nix
    ./git.nix
    ./hyprland
  ];
}
