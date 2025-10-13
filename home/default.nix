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
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  home.sessionVariables = {
    QML2_IMPORT_PATH = "/etc/profiles/per-user/micho/lib/qt-6/qml";
  };

  imports = [
    ./ghostty.nix
    ./vscode.nix
    ./theme.nix
    ./fish.nix
    ./nvim.nix
    ./git.nix
    ./hyprland
    ./quickshell
  ];
}
