{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    opts = {
      number = true;
      tabstop = 2;
      shiftwidth = 2;
    };

    extraConfigLua = ''
      vim.cmd("colorscheme habamax")
    '';
  };

  home.packages = with pkgs; [
    nixd
    black
    hadolint
    prettierd
    nixpkgs-fmt
    basedpyright
    yaml-language-server
    dockerfile-language-server
    tailwindcss-language-server
  ];
}
