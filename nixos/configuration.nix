{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
  };

  # Enable networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };

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

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services = {
    # Kubernetes
    k3s = {
      enable = true;
      role = "server";
    };

    # Keyboard layout
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    gvfs = {
      enable = true;
      package = pkgs.gnome.gvfs;
    };
  };

  # Define a user
  users.users.micho = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "micho";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ];
  };

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes and experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable fish
  programs.fish.enable = true;

  # Enable Hyprland
  programs.hyprland.enable = true;

  # Enable Docker 
  virtualisation.docker.enable = true;

  # Set system state version (do not change once set)
  system.stateVersion = "25.05";
}

