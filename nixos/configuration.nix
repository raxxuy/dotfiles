{ pkgs, globalConfig, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  time.timeZone = globalConfig.timeZone;
  i18n.defaultLocale = globalConfig.locale;

  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = globalConfig.hostName;
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.gvfs.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.gnome.gnome-keyring.enable = true;

  users.users.${globalConfig.user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = globalConfig.description;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.fish.enable = true;
  programs.hyprland.enable = true;

  system.stateVersion = "25.05";
}
