{ ... }: { 
  home.file = {
    ".config/VSCodium/User/keybindings.json".text = ''
      [
        {
          "key": "tab",
          "command": "selectNextSuggestion",
          "when": "suggestWidgetVisible"
        },
        {
          "key": "shift+tab",
          "command": "selectPrevSuggestion",
          "when": "suggestWidgetVisible"
        }
      ]
    '';
 
    ".config/VSCodium/User/settings.json".text = ''
      {
        "workbench.colorTheme": "GitHub Dark",
        "window.commandCenter": false,
        "workbench.layoutControl.enabled": false,
        "editor.fontFamily": "JetBrains Mono",
        "editor.fontSize": 16,
        "editor.fontLigatures": true,
        "code-runner.runInTerminal": true,
        "code-runner.saveFileBeforeRun": true,
        "editor.minimap.enabled": false,
        "workbench.productIconTheme": "Tabler",
        "editor.formatOnSave": true,
        "explorer.confirmDelete": false,
        "workbench.iconTheme": "material-icon-theme",
        "extensions.experimental.affinity" : {
          "asvetliakov.vscode-neovim" : 1
        }
    '';
  };
}
