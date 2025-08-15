let
  inherit (import ../../hosts/micho/variables.nix) terminal explorer launcher;

  mod = "$mod";

  baseBinds = [
    "${mod}, left, movefocus, l"
    "${mod}, right, movefocus, r"
    "${mod}, up, movefocus, u"
    "${mod}, down, movefocus, d"
    "${mod}, Q, exec, ${terminal}"
    "${mod}, E, exec, ${explorer}"
    "${mod}, R, exec, ${launcher}"
    "${mod}, C, killactive"
    "${mod}, F, togglefloating"
    "${mod}, M, exit"
    "${mod}, S, togglespecialworkspace, magic"
    "${mod} SHIFT, S, movetoworkspace, special:magic"
    "${mod}, A, exec, ags quit | ags run"
    ",Print, exec, hyprshot -zm region --clipboard-only"
  ];

  workspaceBinds =
    builtins.concatLists (
      builtins.genList
        (i:
          let
            ws = if i == 9 then 10 else (i + 1);
            keyNum = if i == 9 then "0" else builtins.toString (i + 1);
          in
          [
            "${mod}, ${keyNum}, workspace, ${builtins.toString ws}"
            "${mod} SHIFT, ${keyNum}, movetoworkspace, ${builtins.toString ws}"
          ]
        )
        10
    );

  mouseBinds = [
    "${mod}, mouse:272, movewindow"
    "${mod}, mouse:273, resizewindow"
  ];
in
{
  wayland.windowManager.hyprland.settings = {
    bind = baseBinds ++ workspaceBinds;
    bindm = mouseBinds;
  };
}
