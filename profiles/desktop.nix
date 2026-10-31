{ ... }:

{
  imports = [
    ../modules/nixos/boot.nix
    ../modules/nixos/networking.nix
    ../modules/nixos/audio.nix
    ../modules/nixos/desktop.nix
    ../modules/home/default.nix
  ];

  services.printing.enable = true;

  programs.firefox.enable = true;
}
