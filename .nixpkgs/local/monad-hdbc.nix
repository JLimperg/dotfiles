{ mkDerivation, base, containers, exceptions, HDBC, mtl, stdenv
, transformers
}:
mkDerivation {
  pname = "monad-hdbc";
  version = "0.1.0.0";
  src = /home/jannis/prog/monad-hdbc;
  buildDepends = [
    base containers exceptions HDBC mtl transformers
  ];
  homepage = "https://github.com/jlimperg/monad-hdbc";
  description = "Monadic convenience wrapper for HDBC connections";
  license = stdenv.lib.licenses.mit;
}
