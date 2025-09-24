{ pkgs, ... }:

let
  inherit (import ../hosts/micho/variables.nix) git;
in
{
  home.packages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;

    extraConfig = {
      user.name = git.name;
      user.email = git.email;
      init.defaultBranch = "main";

      credential.helper = "manager";
      credential."https://github.com".username = git.name;
      credential.credentialStore = "cache";
    };
  };
}
