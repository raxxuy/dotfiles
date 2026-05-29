{ pkgs, ... }:

let
  hyprlandStubs = "${pkgs.hyprland}/share/hypr/stubs";
in
{
  home.packages = with pkgs; [
    nil
    nixd
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
        dark = "Catppuccin Mocha - No Italics";
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
        "lua-language-server" = {
          settings = {
            Lua = {
              workspace = {
                library = [ hyprlandStubs ];
              };
            };
          };
        };
        "tailwindcss-language-server" = {
          settings = {
            classFunctions = [
              "cva"
              "cx"
              "clsx"
            ];
            experimental = {
              classRegex = [ "[cls|class|className]\\s\\:\\=\\s\"([^\"]*)" ];
            };
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
            "source.action.useSortedInterfaceMembers.biome" = true;
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
      "lua"
      "html"
      "toml"
      "scss"
      "biome"
      "pylsp"
      "catppuccin"
      "git-firefly"
      "dockerfile"
      "docker-compose"
    ];
  };
}
