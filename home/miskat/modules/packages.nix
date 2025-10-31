{inputs, pkgs, system, ... }: { 
	home.packages = with pkgs; [ 
    		hello neovim curl wget htop neofetch docker kitty
        inputs.zen-browser.packages."${system}".default
  	];
}
