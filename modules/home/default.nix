{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.micho = {
      imports = [
        ./themes/default.nix
        ./programs/git.nix
        ./programs/zsh.nix
        ./programs/btop.nix
        ./programs/zen.nix
        ./programs/ghostty.nix
        ./programs/spotify.nix
        ./programs/hyprland
      ];

      home = {
        username = "micho";
        homeDirectory = "/home/micho";
        stateVersion = "26.05";

        packages = with pkgs; [
          # development
          zed-editor

          # applications
          discord
          obsidian
          nautilus

          # cli
          tree

          # nix
          nil
          nixd
          nixfmt

          # lua
          lua-language-server

          package-version-server
        ];

        sessionVariables = {
          TERMINAL = "ghostty";
          BROWSER = "zen-beta";
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
