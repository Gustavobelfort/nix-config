{ lib, stdenv, pkgs }:

let
in
stdenv.mkDerivation {
  pname = "astronvim";
  version = "v3.36.8";

  src = pkgs.fetchFromGitHub {
    owner = "AstroNvim";
    repo = "AstroNvim";
    rev = "refs/tags/v3.36.8";
    sha256 = "sha256-SWf4lKFgj6oHLKoaUWlTc/LslzeLfKbW/QVxFcZ9FIw=";
  };

  installPhase = ''
    mkdir $out
    cp -r * "$out/"
  '';

  meta = with lib; {
    description = "AstroNvim";
    homepage = "https://github.com/AstroNvim/AstroNvim";
    platforms = platforms.all;
    maintainers = [ maintainers.toutaboc ];
    license = licenses.gpl3;
  };
}
