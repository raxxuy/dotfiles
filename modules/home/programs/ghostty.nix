{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "Vesper";
      font-family = "SF Mono";
      
      background-opacity = 0.9;
      background-blur = true;
      
      window-padding-x = 10;
      window-padding-y = 10;
      gtk-toolbar-style = "flat";

      keybind = [
        "super+a=select_all"
        "super+c=copy_to_clipboard"
        "super+v=paste_from_clipboard"
        "super+f=start_search"
        "super+n=new_window"
        "super+t=new_tab"
      ];
    };
  };
}
