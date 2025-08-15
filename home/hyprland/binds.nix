let
  inherit
    (import ../../hosts/micho/variables.nix)
    terminal
    explorer
    launcher
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        "$mod, Q, exec, ${terminal}"
        "$mod, E, exec, ${explorer}"
        "$mod, R, exec, ${launcher}"
        "$mod, A, exec, ags quit | ags run"
        "$mod, C, killactive"
        "$mod, F, togglefloating"
        "$mod, M, exit"
        ",PRINT, exec, hyprshot -zm region --clipboard-only"
      ]
      ++ (
        builtins.concatLists (
          builtins.genList
            (i:
              let
                ws = if i == 9 then 10 else (i + 1); # 0 key is last, workspace 10
                keyNum = if i == 9 then "0" else builtins.toString (i + 1);
              in
              [
                "$mod, ${keyNum}, workspace, ${builtins.toString ws}"
                "$mod SHIFT, ${keyNum}, movetoworkspace, ${builtins.toString ws}"
              ]
            ) 10 # generate 10 entries: 0–9 index
        )
      );
  };
}
