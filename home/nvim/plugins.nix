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
      ];
    };

    cmp = {
      enable = true;

      # These are completion sources — you can adjust as needed
      settings = {
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = ''
            function(fallback)
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
          typescript = [ "prettier" ];
          tsx = [ "prettier" ];
          javascript = [ "prettier" ];
          scss = [ "prettier" ];
          css = [ "prettier" ];
        };
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
