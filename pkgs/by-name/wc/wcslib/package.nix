{
  lib,
  stdenv,
  fetchurl,
  flex,
}:

stdenv.mkDerivation rec {
  pname = "wcslib";
  version = "8.4";

  src = fetchurl {
    url = "ftp://ftp.atnf.csiro.au/pub/software/wcslib/${pname}-${version}.tar.bz2";
    sha256 = "sha256-lguERCbRSotTze7XgliqkojN7ZmncywGZ8ZPpqUBJtw=";
  };

  nativeBuildInputs = [ flex ];

  enableParallelBuilding = true;

  outputs = [
    "out"
    "man"
  ];

  meta = with lib; {
    homepage = "https://www.atnf.csiro.au/people/mcalabre/WCS/";
    description = "World Coordinate System library for astronomy";
    longDescription = ''
      Library for world coordinate systems for spherical geometries
      and their conversion to image coordinate systems. This is the
      standard library for this purpose in astronomy.
    '';
    maintainers = with maintainers; [ hjones2199 ];
    license = licenses.lgpl3Plus;
    platforms = platforms.unix;
  };
}
