{

  description = "...";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    #stable.url =  "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "unstable";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #kde2nix = {
    #  url = "github:nix-community/kde2nix";
      #inputs.nixpkgs.follows = "nixpkgs";
    #};
    blackbox = {
      url = "github:mitchmindtree/blackbox.nix";
    };
  };


  outputs = inputs@{ self,
    #stable, kde2nix,
    unstable, nixpkgs, home-manager, nixvim, blackbox, }:

    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./modules
          nixvim.nixosModules.nixvim
          #kde2nix.nixosModules.plasma6
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.dp0sk.imports = [ ./home ];
            };
          }
        ];
      };
    };
}
