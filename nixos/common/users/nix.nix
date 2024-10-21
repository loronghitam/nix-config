{
  pkgs,
  inputs,
  ...
}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    package = pkgs.nixFlakes;
    settings = {
      auto-optimise-store = true;
      trusted-users = ["muggle"];
      trusted-substituters = [
        "https://nix-community.cachix.org"
        "https://muggle.cachix.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "muggle.cachix.org-1:J0PNtvTumj5Cy+t/RlQtWzRJEquJREBIprfNvshUKQw="
      ];
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
