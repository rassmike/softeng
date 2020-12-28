let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {};
  haskellEnv = pkgs.haskell.packages.ghc865.ghcWithPackages
    (haskellPkgs: with haskellPkgs; [
      yesod
      purescript
      spago
    ]);
in
pkgs.mkShell {
  buildInputs = [
    haskellEnv
    pkgs.cowsay
    pkgs.postgresql
  ];
  PORT = 3000;
}
