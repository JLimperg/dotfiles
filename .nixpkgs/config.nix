{
  # Haskell development environment: GHC with a bunch of useful packages.
  packageOverrides = super: let self = super.pkgs; in
  {
    haskellEnv = self.haskellngPackages.ghcWithPackages (p: with p; [
      xmonad xmonad-contrib cabal-install cabal2nix
      criterion
    ]);
  };

  haskellPackageOverrides = self: super: {
    # Global Cabal overrides for all packages
    mkDerivation = expr: super.mkDerivation (expr // {
      enableLibraryProfiling = true;
      enableSharedExecutables = true;
      enableSharedLibraries = true;
    });

    # Local packages
    monad-hdbc = self.callPackage ./local/monad-hdbc.nix {};
    scrumgr    = self.callPackage ./local/scrumgr.nix {};
    chess      = self.callPackage ./local/chess.nix {};
    lagrange   = self.callPackage ./local/lagrange.nix {};
    libtag     = self.callPackage ./local/libtag.nix {};

    # Modified ghc-mod with removed emacs dependency. Should otherwise be
    # identical to upstream derivation.
    ghc-mod = self.callPackage
      ({ mkDerivation, async, base, Cabal, containers, data-default
       , deepseq, directory, djinn-ghc, doctest, filepath, ghc
       , ghc-paths, ghc-syb-utils, haskell-src-exts, hlint, hspec
       , io-choice, makeWrapper, monad-control, monad-journal, mtl
       , old-time, pretty, process, split, syb, temporary, text, time
       , transformers, transformers-base
       }:
       mkDerivation {
         pname = "ghc-mod";
         version = "5.2.1.2";
         sha256 = "11wnrdb6blw169w6kd49ax9h1r9qkka5329lmdhimvki8amv8riv";
         isLibrary = true;
         isExecutable = true;
         buildDepends = [
           async base Cabal containers data-default deepseq directory
           djinn-ghc filepath ghc ghc-paths ghc-syb-utils haskell-src-exts
           hlint io-choice monad-control monad-journal mtl old-time pretty
           process split syb temporary text time transformers
           transformers-base
         ];
         testDepends = [
           base Cabal containers deepseq directory djinn-ghc doctest filepath
           ghc ghc-paths ghc-syb-utils haskell-src-exts hlint hspec io-choice
           monad-control monad-journal mtl old-time pretty process split syb
           temporary text time transformers transformers-base
         ];
         buildTools = [ ];
         configureFlags = "--datasubdir=ghc-mod-5.2.1.2";
         homepage = "http://www.mew.org/~kazu/proj/ghc-mod/";
         description = "Happy Haskell Programming";
         license = (with import <nixpkgs> {}; stdenv.lib.licenses.bsd3);
         doCheck = false;
       }) {};
  };
}
