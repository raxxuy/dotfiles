{
  programs.nixvim.plugins = {
    lualine.enable = true;
    luasnip.enable = true; # Snippet engine for nvim-cmp
    neo-tree.enable = true;
    web-devicons.enable = true;

    treesitter = {
      enable = true;
      settings.ensure_installed = [ "nix" ];
    };

    lsp = {
      enable = true;
      servers.nixd.enable = true;
    };

    cmp = {
      enable = true;

      # These are completion sources — you can adjust as needed
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];
    };

    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lspFallback = true;
        };

        formatters_by_ft = {
          nix = [ "nixpkgs_fmt" ]; # or "alejandra"
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
