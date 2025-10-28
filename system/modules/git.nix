{config, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git git-lfs
  ];
  
  programs.git = {
    enable = true;
    prompt.enable = true;
    config.init.defaultBranch = "main";
  };

  programs.git.lfs.enable = true;
}
