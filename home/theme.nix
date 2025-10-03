{ vars, pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.${vars.cursor.package};
    name = vars.cursor.name;
    size = vars.cursor.size;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.adw-gtk3;
      name = "Adwaita";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
