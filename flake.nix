{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    home-manager.url = github:nix-community/home-manager;
    nur.url = github:nix-community/NUR;
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, nur, home-manager }: {
    nixosConfigurations.virtuoso = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nur.nixosModules.nur
        home-manager.nixosModules.home-manager
        ./hosts/virtuoso
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  nixpkgs.overlays = [
	    nur.overlay
	  ];
        }
      ];
    };
    darwinConfigurations.vitriol = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [
        nur.nixosModules.nur
        home-manager.darwinModules.home-manager
        ./hosts/vitriol
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  nixpkgs.overlays = [
	    nur.overlay
	  ];
        }
      ];
    };
  };
}
