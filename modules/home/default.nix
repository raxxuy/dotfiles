{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.micho = {
      imports = [
        ./programs/hyprland
        ./programs/btop.nix
        ./programs/ghostty.nix
        ./programs/git.nix
        ./programs/spotify.nix
        ./programs/zed.nix
        ./programs/zen.nix
        ./programs/zsh.nix
        ./themes/default.nix
      ];

      home = {
        username = "micho";
        homeDirectory = "/home/micho";
        stateVersion = "26.05";

        packages = with pkgs; [
          # applications
          discord
          obsidian
          nautilus

          # cli
          tree
        ];

        sessionVariables = {
          FILE_MANAGER = "nautilus";
        };
      };

      gtk = {
        enable = true;
        font = {
          name = "SF Pro";
          size = 11;
        };
      };

      dconf.settings."org/gnome/desktop/interface".monospace-font-name = "SF Mono 11";

      xdg.portal = {
        enable = true;
        config.common.default = "hyprland";
        extraPortals = [
          pkgs.xdg-desktop-portal-hyprland
          pkgs.xdg-desktop-portal-gtk
        ];
      };
    };
  };
}
