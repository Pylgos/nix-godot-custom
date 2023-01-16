{
  inputs = {
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nix-godot/nixpkgs";
    nix-godot.url = "github:Pylgos/nix-godot";
    nixpkgs.follows = "nix-godot/nixpkgs";
    godot-camera-branch.url = "github:Pylgos/godot/camera";
  };

  outputs = { std, self, ... } @ inputs: std.growOn
    {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (installables "packages")
      ];
    }
    {
      packages = std.harvest self [ "godot" "packages" ];
    };
}