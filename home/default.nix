{ globalConfig, pkgs, ... }:

{
  home.username = globalConfig.user;
  home.homeDirectory = "/home/${globalConfig.user}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    bun
    tree
    discord
    firefox
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    python3
  ];

  home.sessionVariables = {
    QML2_IMPORT_PATH = "/etc/profiles/per-user/micho/lib/qt-6/qml";
  };

  imports = [
    ./caelestia.nix
    ./ghostty.nix
    ./theme.nix
    ./fish.nix
    ./nvim.nix
    ./git.nix
    ./zed.nix
    ./hyprland
  ];
}
