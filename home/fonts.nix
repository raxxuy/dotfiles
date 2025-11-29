{ inputs, ... }:

{
  imports = [
    inputs.apple-fonts.homeManagerModules.default
  ];

  fonts.apple.enable = true;
}
