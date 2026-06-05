{ globalConfig, ... }:

let
  ghostty = globalConfig.ghostty;
in
{
  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = ghostty.font-size;
      window-padding-x = 10;
      window-padding-y = 10;
      background-opacity = 0.9;
      theme = "leta-shell";
      gtk-toolbar-style = "flat";
    };
  };
}
