{
  programs.nixvim.plugins = {
    lualine.enable = true;
    luasnip.enable = true; # Snippet engine for nvim-cmp
    neo-tree.enable = true;
    web-devicons.enable = true;

    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        ts_ls.enable = true;
        cssls.enable = true;
        dockerls.enable = true;
        yamlls.enable = true;
      };
    };

    treesitter = {
      enable = true;
      settings.ensure_installed = [
        "nix"
        "typescript"
        "tsx"
        "javascript"
        "html"
        "css"
        "scss"
        "dockerfile"
        "yaml"
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
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
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
          typescript = [ "prettierd" ];
          tsx = [ "prettierd" ];
          javascript = [ "prettierd" ];
          scss = [ "prettierd" ];
          css = [ "prettierd" ];
          yaml = [ "prettierd" ];
          json = [ "prettierd" ];
          markdown = [ "prettierd" ];
        };

        # Optional explicit prettierd formatter config
        # formatters.prettierd = {
        #   command = "prettierd";
        #   args = [ "$FILENAME" ];
        # };
      };
    };

    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = { text = "+"; };
          change = { text = "~"; };
          delete = { text = "_"; };
          topdelete = { text = "‾"; };
          changedelete = { text = "~"; };
        };
      };
    };
  };
}

