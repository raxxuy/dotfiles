{
  configName = "nixos-config";

  terminal = "ghostty --gtk-single-instance=true";
  explorer = "nautilus";
  launcher = "rofi -show drun";
  animations = false;

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

  # Blur
  blur = {
    size = 8;
    passes = 3;
  };
}
