{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    home-manager.url = github:nix-community/home-manager;
    nur.url = github:nix-community/NUR;
    nixos-hardware.url = github:kekrby/nixos-hardware/master;
  };

  outputs = { self, nixpkgs, nur, home-manager, nixos-hardware }: {
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
    nixosConfigurations.vigilante = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nur.nixosModules.nur
        home-manager.nixosModules.home-manager
        nixos-hardware.nixosModules.apple-t2
        ./hosts/vigilante
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
