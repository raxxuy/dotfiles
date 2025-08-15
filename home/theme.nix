{ pkgs, ... }:
let
  inherit
    (import ../hosts/micho/variables.nix)
    cursor
    ;
in
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.${cursor.package};
    name = cursor.name;
    size = cursor.size;
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
