{ mkDerivation, base, containers, convertible, exceptions, HDBC
, HDBC-sqlite3, monad-hdbc, mtl, old-locale, options, stdenv, text
, time, transformers
}:
mkDerivation {
  pname = "scrumgr";
  version = "0.1.0.0";
  src = /home/jannis/prog/scrumgr;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    base containers convertible exceptions HDBC HDBC-sqlite3 monad-hdbc
    mtl old-locale options text time transformers
  ];
  homepage = "https://github.com/JLimperg/scrumgr";
  license = stdenv.lib.licenses.mit;
}
