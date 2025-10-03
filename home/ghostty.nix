{ vars, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = vars.ghostty.font-size;
      window-padding-x = 10;
      window-padding-y = 10;
      background-opacity = 0.8;
      theme = "/home/micho/.cache/wal/ghostty.conf";
      gtk-toolbar-style = "flat";
    };
  };
}
