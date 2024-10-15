{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...  }: {

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem { 
      system = "x86_664-linux";
      modules = [
        ./configuration.nix
        ];
      };
    };
    homeConfigurations = {
      "muggle@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
        ./home.nix
        ];
      };
    };
  };
}
