{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchFromGitHub,
  pythonOlder,
  bencode-py,
  python-box,
  jinja2,
  python-daemon,
  parsimonious,
  pythonRelaxDepsHook,
  poetry-core,
  prometheus-client,
  prompt-toolkit,
  requests,
  shtab,
  tomli,
  tomli-w,
}:
buildPythonPackage rec {
  pname = "pyrosimple";
  version = "2.7.0";
  format = "pyproject";

  disabled = pythonOlder "3.9";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SMqzvTbWFHwnbMQ+6K0m1v+PybceQK5EHEuN8FB6SaU=";
  };

  propagatedBuildInputs = [
    bencode-py
    python-box
    parsimonious
    jinja2
    python-daemon
    parsimonious
    prometheus-client
    prompt-toolkit
    requests
    shtab
    tomli
    tomli-w
  ];

  pythonRelaxDeps = [
    "prometheus-client"
  ];

  nativeBuildInputs = [
    poetry-core
    pythonRelaxDepsHook
  ];

  meta = with lib; {
    description = "A stripped-down version of the pyrocore tools for working with rTorrent";
    homepage = "https://github.com/kannibalox/pyrosimple";
    changelog = "https://github.com/kannibalox/pyrosimple/v${version}/main/CHANGELOG.md";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [vamega];
  };
}
