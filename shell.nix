let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {};
  haskellEnv = pkgs.haskell.packages.ghc865.ghcWithPackages
    (p: with p; [
      process
      random
      purescript
      spago
    ]);
in
pkgs.mkShell {
  buildInputs = [
    haskellEnv
    pkgs.cowsay
  ];
  PORT = 3000;
}
