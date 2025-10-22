{ ... }:

let
  mod = "$mod";

  baseBinds = [
    "${mod}, left, movefocus, l"
    "${mod}, right, movefocus, r"
    "${mod}, up, movefocus, u"
    "${mod}, down, movefocus, d"
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

  workspaceBinds = builtins.concatLists (
    builtins.genList (
      i:
      let
        ws = if i == 9 then 10 else (i + 1);
        keyNum = if i == 9 then "0" else builtins.toString (i + 1);
      in
      [
        "${mod}, ${keyNum}, workspace, ${builtins.toString ws}"
        "${mod} SHIFT, ${keyNum}, movetoworkspace, ${builtins.toString ws}"
      ]
    ) 10
  );

  mouseBinds = [
    "${mod}, mouse:272, movewindow"
    "${mod}, mouse:273, resizewindow"
  ];

  multimediaBinds = [
    ",XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",XF86MonBrightnessUp, exec, caelestia brightnessUp"
    ",XF86MonBrightnessDown, exec, caelestia brightnessDown"
    "ALT, Shift_L, exec, hyprctl switchxkblayout main next"
  ];

  caelestiaBinds = [
    "Super, R, global, caelestia:launcher"
    "Super, mouse:272, global, caelestia:launcherInterrupt"
    "Super, mouse:273, global, caelestia:launcherInterrupt"
  ];

  windowActionBinds = [
    "Super+Shift, left, movewindow, l"
    "Super+Shift, right, movewindow, r"
    "Super+Shift, up, movewindow, u"
    "Super+Shift, down, movewindow, d"
    "Ctrl+Super, Backslash, centerwindow, 1"
    "Ctrl+Super+Alt, Backslash, resizeactive, exact 55% 70%"
  ];
in
{
  wayland.windowManager.hyprland.settings = {
    bind = baseBinds ++ workspaceBinds ++ caelestiaBinds ++ windowActionBinds;
    bindm = mouseBinds;
    bindl = multimediaBinds;
  };
}
