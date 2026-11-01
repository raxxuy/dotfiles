{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    mutableUserTasks = true;

    extensions = [
      "biome"
      "catppuccin"
      "emmet"
      "html"
      "lua"
      "nix"
      "toml"
    ];

    userTasks = [
      {
        label = "Initialize Biome Settings";
        command = "mkdir -p .zed && printf '%s\\n' '{\"lsp\":{\"biome\":{\"settings\":{\"config_path\":\"./biome.json\"}}}}' > .zed/settings.json";
        cwd = "$ZED_WORKTREE_ROOT";
        hide = "on_success";
        reveal = "never";
      }
    ];

    userSettings = {
      cli_default_open_behavior = "new_window";

      icon_theme = "Zed (Default)";

      telemetry = {
        diagnostics = false;
        metrics = false;
        anthropic_retention = false;
      };

      session = {
        trust_all_worktrees = true;
      };

      vim_mode = true;

      ui_font_size = 16;
      buffer_font_size = 15;

      theme = {
        mode = "system";
        light = "One Light";
        dark = "Catppuccin Mocha - No Italics";
      };

      lsp = {
        biome = {
          settings = {
            require_config_file = true;
          };
        };
      };

      languages = {
        JavaScript = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };

          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        TypeScript = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };

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

          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        HTML = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };

          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
      };

      autosave = {
        after_delay = {
          milliseconds = 50;
        };
      };
    };
  };

  home.packages = with pkgs; [
    nil
    nixd
    nixfmt
    lua-language-server
    package-version-server
  ];
}
