{ pkgs, globalConfig, ... }:

{
  home.packages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;

    settings = {
      user.name = globalConfig.git.name;
      user.email = globalConfig.git.email;
      init.defaultBranch = "main";

      credential.helper = "manager";
      credential."https://github.com".username = globalConfig.git.name;
      credential.credentialStore = "cache";
    };
  };
}
