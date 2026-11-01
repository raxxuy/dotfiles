{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop.override { rocmSupport = true; };

    settings = {
      graph_by_cpu = false;
    };
  };
}
