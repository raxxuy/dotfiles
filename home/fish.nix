{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      	set fish_greeting
        cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
    '';
  };
}
