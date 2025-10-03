{
  configName = "dotfiles";
  type = "desktop";

  # Hyprland-specific
  terminal = "ghostty --gtk-single-instance=true";
  explorer = "nautilus";
  launcher = "ags toggle launcher";
  animations = true;

  blur = {
    size = 8;
    passes = 3;
  };

  # Git
  git = {
    name = "raxxuy";
    email = "milanilkov@gmail.com";
  };

  # Cursor
  cursor = {
    package = "bibata-cursors";
    name = "Bibata-Modern-Classic";
    size = 20;
  };

  # Ghostty
  ghostty = {
    font-size = 14;
  };
}
