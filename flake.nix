{
  inputs = {
    nur.url = github:nix-community/NUR;
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = github:kekrby/nixos-hardware/master;
  };
  outputs = { self, nixpkgs, nur, home-manager, nixos-hardware }: {
    nixosConfigurations.vigilante = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nur.nixosModules.nur
        ./machines/vigilante/configuration.nix
	    nixos-hardware.nixosModules.apple-t2
	    home-manager.nixosModules.home-manager
	    {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
	    }
      ];
    };
  };
}
