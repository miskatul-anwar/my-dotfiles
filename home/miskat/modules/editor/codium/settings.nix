# VSCodium settings
{ ... }:
{
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
        "workbench.colorTheme": "Catppuccin Mocha",
        "window.commandCenter": false,
        "workbench.layoutControl.enabled": false,
        "editor.fontFamily": "JetBrainsMono Nerd Font",
        "editor.fontSize": 14,
        "editor.fontLigatures": true,
        "code-runner.runInTerminal": true,
        "code-runner.saveFileBeforeRun": true,
        "editor.minimap.enabled": false,
        "workbench.productIconTheme": "Tabler",
        "editor.formatOnSave": true,
        "explorer.confirmDelete": false,
        "workbench.iconTheme": "material-icon-theme",
        "redhat.telemetry.enabled": false
      }
    '';
  };
}
