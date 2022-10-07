{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = github:kekrby/nixos-hardware/master;
    nixvim.url = github:pta2002/nixvim;
  };
  outputs = { self, nixpkgs, nixvim, home-manager, nixos-hardware }: {
    nixosConfigurations.vigilante = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./machines/vigilante/configuration.nix
	nixos-hardware.nixosModules.apple-t2
	nixvim.nixosModules.nixvim
	home-manager.nixosModules.home-manager
	{
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	}
      ];
    };
  };
}
