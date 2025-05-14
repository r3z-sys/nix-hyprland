{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
  { nixpkgs, self, ... } @inputs: 
  let
    username = "tabun";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      nix0s = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
        specialArgs = {
          inherit self inputs;
        };
      };
    };
  };
}
