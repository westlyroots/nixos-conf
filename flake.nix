{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nixos-xivlauncher-rb = {
      url = "github:drakon64/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz"; # For latest stable version
      #url = "https://flakehub.com/f/Svenum/Solaar-Flake/0.1.1.tar.gz"; # uncomment line for solaar version 1.1.13
      #url = "github:Svenum/Solaar-Flake/main"; # Uncomment line for latest unstable version
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };
    lucem.url = "github:xTrayambak/lucem";
  };

  outputs = { self, nixpkgs, nixos-xivlauncher-rb, chaotic, solaar, home-manager, lucem, ... }@inputs: {
    nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs; };
      #specialArgs.inputs = inputs;
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./hosts/nixie/configuration.nix
        solaar.nixosModules.default
        nixos-xivlauncher-rb.nixosModules.default
        chaotic.nixosModules.default
        home-manager.nixosModules.home-manager
        ./modules/nixie.nix
];

    };

  };
}
