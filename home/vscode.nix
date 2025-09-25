{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        tal7aouy.icons
        esbenp.prettier-vscode
        bradlc.vscode-tailwindcss
        ms-python.python
        ms-python.vscode-pylance
      ];

      userSettings = {
        "files.autoSave" = "afterDelay";
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "editor.fontFamily" = "FiraCode Nerd Font Mono";
        "editor.fontWeight" = 500;
        "editor.fontSize" = 14;
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "workbench.iconTheme" = "icons";
        "workbench.editor.empty.hint" = "hidden";
        "python.analysis.typeCheckingMode" = "strict";
        "[python]" = {
          "editor.tabSize" = 4;
        };
      };
    };
  };
}
