{ mkDerivation, base, stdenv, taglib }:
mkDerivation {
  pname = "libtag";
  version = "0.1.0.0";
  src = /home/jannis/prog/libtag;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ base ];
  extraLibraries = [ taglib ];
  pkgconfigDepends = [ taglib ];
  homepage = "https://github.com/JLimperg/taglib-hs";
  description = "High-level bindings to Taglib's generic interface";
  license = stdenv.lib.licenses.mit;
}
