{
  description = "Bayle flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
   
    scopebuddy = {
      url = "github:HikariKnight/ScopeBuddy";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      dolphin-overlay,
      stylix,
      scopebuddy,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.bayle = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit self inputs; };
        modules = [
          { nixpkgs.overlays = [ dolphin-overlay.overlays.default ]; }
          stylix.nixosModules.stylix
          ./nix/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.weston.imports = [
              ./home/home.nix
            ];
          }
        ];
      };
    };
}
