let
  mod = "$mod";

  baseBinds = [
    "${mod}, left, movefocus, l"
    "${mod}, right, movefocus, r"
    "${mod}, up, movefocus, u"
    "${mod}, downa, movefocus, d"
    "${mod}, Q, exec, ghostty --gtk-single-instance=true"
    "${mod}, E, exec, nautilus"
    "${mod}, R, exec, ags toggle launcher"
    "${mod}, C, killactive"
    "${mod}, F, togglefloating"
    "${mod}, M, exit"
    "${mod}, S, togglespecialworkspace, magic"
    "${mod} SHIFT, S, movetoworkspace, special:magic"
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
in
{
  wayland.windowManager.hyprland.settings = {
    bind = baseBinds ++ workspaceBinds;
  };
}
