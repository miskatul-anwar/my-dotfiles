{ pkgs, ... }: { 
	home.packages = with pkgs; [ 
    		hello neovim curl wget htop neofetch docker
    # Add more here
  	];
}
