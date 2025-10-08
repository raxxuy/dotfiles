{ config, pkgs, globalConfig, ... }:

let
  theme = globalConfig.theme.theme;
  cursor = globalConfig.theme.cursor;
  iconTheme = globalConfig.theme.iconTheme;
in
{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.${theme.package};
      name = theme.name;
    };

    iconTheme = {
      package = pkgs.${iconTheme.package};
      name = iconTheme.name;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.${cursor.package};
    name = cursor.name;
    size = cursor.size;
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
