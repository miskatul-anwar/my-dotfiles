{ pkgs, ... }: { 
	home.packages = with pkgs; [ 
    		hello neovim curl wget htop neofetch
    # Add more here
  	];
}
