{ system ? builtins.currentSystem or "x86_64-linux", pythonVersion ? "python37"
}:
let
  nix = import ./nix;
  inherit (nix) sources;
  pkgs = nix.pkgSetForSystem system {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
  inherit (pkgs) lib;

  mach-nix = import (sources.mach-nix) { python = pythonVersion; };

  demo-library = mach-nix.buildPythonPackage ./.;

  python-env = mach-nix.mkPython {
    requirements = "ipython";
    packagesExtra = [ demo-library ];
  };

  shell = mach-nix.nixpkgs.mkShell {
    # inherit requirements;

    buildInputs = [ pkgs.git pkgs.which python-env ];
  };

in { inherit shell demo-library pythonVersion; }
