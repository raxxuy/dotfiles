{ globalConfig, pkgs, ... }:

{
  home.username = globalConfig.user;
  home.homeDirectory = "/home/${globalConfig.user}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tree
    discord
    firefox
    code-cursor-fhs

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  imports = [
    ./ghostty.nix
    ./vscode.nix
    ./theme.nix
    ./fish.nix
    ./nvim.nix
    ./git.nix
    ./hyprland
  ];
}
