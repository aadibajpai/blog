{ nixpkgs ? <nixpkgs>, pkgs ? import nixpkgs { } }:
with pkgs;

mkShell {
  buildInputs = [ coreutils gnumake gnum4 cmark-gfm ]; # packages here
}
