{ pkgs, ... }:

{
  programs.fuzzel.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    extraLuaFiles = {
      settings = {
        content = ./settings.lua;
        autoLoad = false;
      };

      bindings = {
        content = ./bindings.lua;
        autoLoad = false;
      };

      monitors = {
        content = ./monitors.lua;
        autoLoad = false;
      };

      appearance = {
        content = ./appearance.lua;
        autoLoad = false;
      };

      autostart = {
        content = ./autostart.lua;
        autoLoad = false;
      };
    };

    extraConfig = ''
      require("bindings")
      require("monitors")
      require("appearance")
      require("autostart")
    '';
  };

  home.file.".local/share/hypr/stubs".source = "${pkgs.hyprland}/share/hypr/stubs";
}
