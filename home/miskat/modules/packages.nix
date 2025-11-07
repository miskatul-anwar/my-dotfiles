{inputs, pkgs, system, ... }: { 
	home.packages = with pkgs; [ 
    		hello neovim curl wget htop docker kitty
        inputs.zen-browser.packages."${system}".default
  	];
}
