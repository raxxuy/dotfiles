{ inputs, ... }:

{
  imports = [ inputs.leta-shell.homeManagerModules.default ];

  programs.leta-shell.enable = true;
}
