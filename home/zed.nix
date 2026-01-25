{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
    nix-ld
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

      project_panel = {
        hide_gitignore = true;
      };

      lsp = {
        biome = {
          settings = {
            require_config_file = false;
          };
        };
      };

      languages = {
        TypeScript = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          language_servers = [
            "biome"
            "!vtsls"
            "..."
          ];
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        TSX = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          language_servers = [
            "biome"
            "!vtsls"
            "..."
          ];
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
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
