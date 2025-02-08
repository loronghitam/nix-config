{
  description = "my nix-config";

  outputs = {
    nixpkgs,
    home-manager,
    nix-index-database,
    catppuccin,
    nixvim,
    ...
  } @ inputs: let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nixos";
      timezone = "Asia/Jakarta";
      locale = "id_ID.UTF-8";
      version = "";
    };

    userSettings = {
      username = "muggle";
    };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = systemSettings.system;
        specialArgs = {
          inherit
            inputs
            userSettings
            systemSettings
            ;
        };
        modules = [
          ./nixos
          nix-index-database.nixosModules.nix-index
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit
                inputs
                userSettings
                systemSettings
                ;
            };
            home-manager.users.muggle.imports = [
              catppuccin.homeManagerModules.catppuccin
              nixvim.homeManagerModules.nixvim
              ./home
            ];
          }
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database.url = "github:nix-community/nix-index-database";

    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };
}
