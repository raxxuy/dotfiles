{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions =
        (with pkgs.vscode-extensions; [
          tal7aouy.icons
          esbenp.prettier-vscode
          github.copilot
          github.copilot-chat
        ]) ++
        (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "cursor-dark-core";
            publisher = "imzivko";
            version = "0.0.2";
            sha256 = "18hmzn7ibdjyim697sjlnrfqls8hmvqlmmny8pxf5xs1sg685cs7";
          }
        ]);

      userSettings = {
        "files.autoSave" = "afterDelay";
        "editor.fontFamily" = "FiraCode Nerd Font Mono";
        "editor.fontWeight" = 500;
        "editor.fontSize" = 14;
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "workbench.iconTheme" = "icons";
        "workbench.colorTheme" = "Cursor Dark Core";
      };
    };
  };
}
