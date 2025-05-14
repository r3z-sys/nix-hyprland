{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.tabun = {
      home.username = "tabun";
      home.homeDirectory = "/home/tabun";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
 
    home.packages = with pkgs; [
      waybar
    ];

    programs.git = {
      enable = true;
      userEmail = "rezky@atmaluhur.ac.id";
      userName = "r3z-sys";
    };

  };
}
