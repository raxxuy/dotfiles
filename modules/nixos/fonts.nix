{ ... }:

{
  fonts.apple = {
    enable = true;
    families = [
      "sf-pro"
      "sf-mono"
    ];
  };

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "SF Pro" ];
    monospace = [ "SF Mono" ];
  };
}
