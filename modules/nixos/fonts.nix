{ ... }:

{
  fonts.apple = {
    enable = true;
    families = [
      "sf-pro"
      "sf-mono"
    ];
  };

  fonts.fontconfig = {
    enable = true;
    antialias = true;

    hinting = {
      enable = true;
      style = "slight";
      autohint = false;
    };

    subpixel = {
      rgba = "rgb";
      lcdfilter = "default";
    };

    defaultFonts = {
      sansSerif = [ "SF Pro" ];
      monospace = [ "SF Mono" ];
    };
  };
}
