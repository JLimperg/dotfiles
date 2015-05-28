{ mkDerivation, async, attoparsec, base, bytestring, foldl
, io-streams, lens-family-core, pipes, pipes-attoparsec
, pipes-bytestring, pipes-group, pipes-parse, stdenv, text
, transformers
}:
mkDerivation {
  pname = "chess";
  version = "0.1.0.0";
  src = /home/jannis/prog/chess;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    async attoparsec base bytestring foldl io-streams lens-family-core
    pipes pipes-attoparsec pipes-bytestring pipes-group pipes-parse
    text transformers
  ];
  homepage = "https://github.com/JLimperg/chess";
  description = "Trivial but high-performance PGN filter";
  license = stdenv.lib.licenses.mit;
}
