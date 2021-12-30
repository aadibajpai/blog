{ nixpkgs ? <nixpkgs>, pkgs ? import nixpkgs { } }:
with pkgs;

mkShell {
  buildInputs = [ coreutils gnumake gnum4 ]; # packages here
}
