{ mkDerivation, base, parallel, stdenv }:
mkDerivation {
  pname = "lagrange";
  version = "0.1.0.0";
  src = /home/jannis/prog/lagrange;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ base parallel ];
  homepage = "https://github.com/jlimperg/lagrange";
  description = "Programme which determines the representations of an integer as a sum of four squares";
  license = stdenv.lib.licenses.mit;
}
