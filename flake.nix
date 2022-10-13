{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    home-manager.url = github:nix-community/home-manager;
    nur.url = github:nix-community/NUR;
  };

  outputs = { self, nixpkgs, nur, home-manager }: {
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
  };
}
