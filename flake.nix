{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      auto-cpufreq,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";

      loadConfig =
        { host, user }:
        lib.recursiveUpdate (import ./config/default.nix { inherit lib; }) (
          lib.recursiveUpdate (import ./config/hosts/${host}.nix { inherit lib; }) (
            import ./config/users/${user}.nix { inherit lib; }
          )
        );

      globalConfig = loadConfig {
        host = "desktop";
        user = "micho";
      };
    in
    {
      nixosConfigurations.${globalConfig.hostName} = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs globalConfig; };
        modules = [
          ./nixos/configuration.nix
          auto-cpufreq.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs globalConfig; };
              users.${globalConfig.user} = import ./home;
            };
          }
        ];
      };
    };
}
