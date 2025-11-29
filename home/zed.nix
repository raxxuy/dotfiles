{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
  ];

  programs.zed-editor = {
    enable = true;

    userSettings = {
      vim_mode = true;

      agent = {
        default_model = {
          provider = "copilot_chat";
          model = "gpt-5-mini";
        };
        model_parameters = [ ];
      };

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

      project_panel = {
        hide_gitignore = true;
      };
    };

    extensions = [
      "nix"
      "html"
      "toml"
      "scss"
      "biome"
      "pylsp"
      "git-firefly"
      "macos-classic"
      "dockerfile"
      "docker-compose"
    ];
  };
}
