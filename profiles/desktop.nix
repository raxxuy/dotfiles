{ ... }:

{
  imports = [
    ../modules/nixos/boot.nix
    ../modules/nixos/networking.nix
    ../modules/nixos/audio.nix
    ../modules/nixos/fonts.nix
    ../modules/nixos/desktop.nix
    ../modules/home/default.nix
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
}
