{ cell, inputs }:

let
  nixpkgs = inputs.nixpkgs;
  l = nixpkgs.lib // builtins;
  inherit (inputs.nix-godot.godot.lib) buildGodot4;
in
{
  godot-camera-branch = buildGodot4 { src = inputs.godot-camera-branch; };
}