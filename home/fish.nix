{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      	set fish_greeting
        cat ~/.cache/leta-shell/wal/sequences 2> /dev/null
    '';
  };
}
