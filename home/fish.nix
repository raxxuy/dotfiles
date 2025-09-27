{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      if test -e ~/.cache/wal/colors.fish
        source ~/.cache/wal/colors.fish
      end
    '';
  };
}
