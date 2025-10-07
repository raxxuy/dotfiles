{ pkgs, globalConfig, ... }:

let
  cursor = globalConfig.theme.cursor;
in
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.${cursor.package};
    name = cursor.name;
    size = cursor.size;
  };
}
