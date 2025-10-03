{ vars, pkgs, ... }:

{
  home.packages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;

    extraConfig = {
      user.name = vars.git.name;
      user.email = vars.git.email;
      init.defaultBranch = "main";

      credential.helper = "manager";
      credential."https://github.com".username = vars.git.name;
      credential.credentialStore = "cache";
    };
  };
}
