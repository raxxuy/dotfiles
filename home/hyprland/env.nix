let
  inherit
    (import ../../hosts/micho/variables.nix)
    cursor
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE, ${builtins.toString cursor.size}"
      "XCURSOR_THEME, ${cursor.name}"
    ];
  };
}
