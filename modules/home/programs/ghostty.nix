{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "Vesper";
      background-opacity = "0.95";
    };
  };
}
