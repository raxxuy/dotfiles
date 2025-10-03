{ vars, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE, ${builtins.toString vars.cursor.size}"
      "XCURSOR_THEME, ${vars.cursor.name}"
    ];
  };
}
