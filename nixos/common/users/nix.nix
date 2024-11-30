{
  pkgs,
  inputs,
  ...
}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    package = pkgs.nixVersions.stable;
    settings = {
      auto-optimise-store = true;
      trusted-users = ["root" "muggle"];
      trusted-substituters = [
        "https://nix-community.cachix.org"
        "https://muggle.cachix.org"
        "https://devenv.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "muggle.cachix.org-1:J0PNtvTumj5Cy+t/RlQtWzRJEquJREBIprfNvshUKQw="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
