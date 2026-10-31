{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.micho = {
      home = {
        username = "micho";
        homeDirectory = "/home/micho";
        stateVersion = "26.05";

        packages = with pkgs; [
          zed-editor
          git-credential-manager
        ];
      };

      programs.git = {
        enable = true;

        settings = {
          credential = {
            helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
            credentialStore = "secretservice";
          };
        };
      };
    };
  };
}
