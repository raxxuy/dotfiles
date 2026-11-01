{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.micho = {
      imports = [
        ./programs/git.nix
        ./programs/zsh.nix
        ./programs/btop.nix
        ./programs/zen.nix
        ./programs/ghostty.nix
        ./programs/spotify.nix
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

          # cli
          tree

          # nix
          nil
          nixd
          nixfmt
        ];
      };
    };
  };
}
