{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time zone and locale
  time.timeZone = "Europe/Skopje";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user
  users.users.micho = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "micho";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes and experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable fish
  programs.fish.enable = true;

  # Enable Hyprland
  programs.hyprland.enable = true;

  # Set system state version (do not change once set)
  system.stateVersion = "25.05";
}

