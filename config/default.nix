{ ... }:

{
  dotfilesName = "dotfiles";
  hostName = "nixos";

  timeZone = "Europe/Skopje";
  locale = "en_US.UTF-8";

  theme = {
    cursor = {
      package = "bibata-cursors";
      name = "Bibata-Modern-Classic";
      size = 20;
    };
  };
}

