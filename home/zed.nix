{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
  ];

  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;

    userSettings = {
      vim_mode = true;
      
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "macOS Classic Dark";
      };

      autosave = {
        after_delay = {
          milliseconds = 50;
        };
      };

      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };
    };
    
    extensions = [
      "nix"
      "html"
      "macos-classic"
      "dockerfile"
      "docker-compose"
    ];
  };
}
