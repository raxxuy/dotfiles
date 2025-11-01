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

  networking = {
    hostName = globalConfig.hostName;
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };

  services.gvfs.enable = true;
  services.upower.enable = true;
  security.polkit.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.power-profiles-daemon.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  environment.systemPackages = with pkgs; [
    gparted
  ];

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
