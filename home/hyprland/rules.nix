{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "no_anim on, match:namespace leta-shell"
      "blur on, match:namespace leta-shell"
      "blur_popups on, match:namespace leta-shell"
      "ignore_alpha 0.3, match:namespace leta-shell"
      "xray on, match:namespace leta-shell"
    ];
  };
}
