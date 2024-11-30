{
  description = "my nix-config";

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

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    catppuccin,
    nixvim,
    hyprland,
    ...
  } @ inputs: let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nixos";
      timezone = "Asia/Jakarta";
      locale = "id_ID.UTF-8";
    };
    userSettings = {
      username = "muggle";
      defautlEditor = "";
      term = "";
    };

    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
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
}
