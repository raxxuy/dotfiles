{ ... }:

{
  dotfilesName = "dotfiles";
  hostName = "nixos";

  timeZone = "Europe/Skopje";
  locale = "en_US.UTF-8";

  theme = {
    theme = {
      package = "adw-gtk3";
      name = "Adwaita";
    };

    iconTheme = {
      package = "adwaita-icon-theme";
      name = "Adwaita";
    };

    cursor = {
      package = "bibata-cursors";
      name = "Bibata-Modern-Classic";
      size = 20;
    };
  };
}

