{ config, inputs, pkgs, ... }:
let
  inherit (import ../../hosts/micho/variables.nix) configName;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = config.lib.file.mkOutOfStoreSymlink "/home/micho/${configName}/home/ags/config";

    extraPackages = [
      inputs.astal.packages.${pkgs.system}.apps
      inputs.astal.packages.${pkgs.system}.bluetooth
      inputs.astal.packages.${pkgs.system}.hyprland
      inputs.astal.packages.${pkgs.system}.notifd
      inputs.astal.packages.${pkgs.system}.wireplumber
      inputs.astal.packages.${pkgs.system}.tray
    ];
  };
}
