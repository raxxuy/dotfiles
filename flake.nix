{
  description = "NixOS desktop configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    apple-fonts = {
      url = "github:raxxuy/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/desktop
          inputs.apple-fonts.nixosModules.default
          inputs.home-manager.nixosModules.home-manager

          {
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };

            home-manager.sharedModules = [
              inputs.zen-browser.homeModules.default
              inputs.spicetify-nix.homeManagerModules.default
            ];
          }
        ];
      };
    };
}
