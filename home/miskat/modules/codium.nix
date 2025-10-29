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
        "editor.fontLigatures": true,

        "code-runner.executorMap": {
          "c": "cd $dir && nix-shell -p gcc glibc.dev glibc binutils --run 'gcc \"$file\" -o \"$fileNameWithoutExt\" && ./\"$fileNameWithoutExt\"'",
          "cpp": "cd $dir && nix-shell -p gcc glibc.dev glibc binutils --run 'g++ \"$file\" -o \"$fileNameWithoutExt\" && ./\"$fileNameWithoutExt\"'"
        },

        "code-runner.runInTerminal": true,
        "code-runner.saveFileBeforeRun": true,
        "editor.minimap.enabled": false
      }
    '';
  };
}
