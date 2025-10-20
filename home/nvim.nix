{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  home.packages = with pkgs; [
    gcc
    nixd
    prettierd
    nixpkgs-fmt
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    opts = {
      number = true;
      tabstop = 2;
      shiftwidth = 2;
    };

    plugins = {
      lualine.enable = true;
      luasnip.enable = true;
      neo-tree.enable = true;
      colorizer.enable = true;
      web-devicons.enable = true;

      transparent = {
        enable = true;
        autoLoad = true;
      };

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };

      treesitter = {
        enable = true;
        settings.ensure_installed = [
          "nix"
        ];
      };

      cmp = {
        enable = true;

        settings = {
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = ''
              	            function(fallback)
              	              local luasnip = require("luasnip")
              	              if cmp.visible() then
              	                cmp.select_next_item()
              	              elseif luasnip.expand_or_jumpable() then
              	                luasnip.expand_or_jump()
              	              else
              	                fallback()
              	              end
              	            end
              	          '';
            "<S-Tab>" = ''
              	            function(fallback)
              	              if cmp.visible() then
              	                cmp.select_prev_item()
              	              elseif luasnip.jumpable(-1) then
              	                luasnip.jump(-1)
              	              else
              	                fallback()
              	              end
              	            end
              	          '';
          };

          sources = [
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
            { name = "nvim_lsp"; }
          ];
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
          };

          formatters_by_ft = {
            nix = [ "nixpkgs_fmt" ];
          };
        };
      };

      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add = {
              text = "+";
            };
            change = {
              text = "~";
            };
            delete = {
              text = "_";
            };
            topdelete = {
              text = "‾";
            };
            changedelete = {
              text = "~";
            };
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";

        options = {
          noremap = true;
          silent = true;
        };
      }
    ];

    extraConfigLua = ''
      vim.cmd("colorscheme habamax")
    '';
  };
}
