{
  pkgs,
  globalConfig,
  inputs,
  ...
}:

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
      enable = false;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };

    limine = {
      enable = true;
      secureBoot.enable = true;

      extraEntries = ''
        /Windows
            protocol: efi
            path: uuid(345a9c33-285b-4d1e-b5f6-696ddf943d1d):/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };

  networking = {
    hostName = globalConfig.hostName;
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        53317
        8384
      ];
      allowedUDPPorts = [ 53317 ];
    };
  };

  security.rtkit.enable = true;
  security.pam.services.astal-auth = { };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    guiPasswordFile = "/etc/syncthing/password";

    user = "${globalConfig.user}";
    dataDir = "/home/${globalConfig.user}/.config/syncthing";
    configDir = "/home/${globalConfig.user}/.config/syncthing";

    settings = {
      devices = {
        "pc" = {
          id = "BKVLRMD-SC5KY43-UNBMZYI-JABRVXA-O7CVRU7-SGWU6EA-KNNBWYY-TQKFCA2";
        };
        "laptop" = {
          id = "KLTQBQD-7T6ZV4Y-SXZAJKG-3HVJCR4-4UTQU7L-EJX3R7M-SA27UMG-O35B7QB";
        };
      };
      folders = {
        "leta-shell" = {
          path = "/home/${globalConfig.user}/Public/leta-shell";
          devices = [
            "pc"
            "laptop"
          ];
        };
      };
    };
  };

  services.dbus = {
    enable = true;
    packages = with pkgs; [
      dconf
    ];
  };

  services.gvfs.enable = true;
  services.upower.enable = true;
  security.polkit.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.glib-networking.enable = true;
  services.power-profiles-daemon.enable = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    sbctl
    gparted
    inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  users.users.${globalConfig.user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = globalConfig.description;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.rocmSupport = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "26.05";
}
