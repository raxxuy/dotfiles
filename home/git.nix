let
  inherit (import ../hosts/micho/variables.nix) git;
in
{
  programs.git = {
    enable = true;

    extraConfig = {
      user.name = git.name;
      user.email = git.email;
      init.defaultBranch = "main";
    };
  };
}
