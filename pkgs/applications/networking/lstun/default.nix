{
  lib,
  mkDerivation,
  fetchFromGitea,
  libevent,
  openssh
}:
mkDerivation rec {
  pname = "lstun";
  version = "0.5";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "op";
    repo = "lstun";
    rev = version;
    hash = "sha256-bIv+6joGhiK1iZx4Mw/e5J74H3ZXt3rZeRLa5IDrz1E=";
  };

  buildInputs = [
    libevent
    openssh
  ];

  meta = {
    description = "Utility to lazily spawn an SSH tunnel";
    longDescription = ''
      lstun is a simple utility to lazily (on demand) spawn a ssh tunnel
      to a remote machine and optionally kill it after some time of inactivity.
    '';
    homepage = "https://github.com/chaos/pdsh";
    license = lib.licenses.isc;
    changelog = "https://codeberg.org/op/lstun/src/tag/${version}/CHANGES";
    maintainers = [ lib.maintainers.madiath ];
    platforms = lib.platforms.unix;
  };
}
