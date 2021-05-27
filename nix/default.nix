let sources = import ./sources.nix;

in rec {
  # Args to apply to any nixpkgs to generate a package set
  nixpkgsArgs = { };

  # A pinned version of nixpkgs, widely used and hopefully well cached.
  defaultNixpkgs = import sources.nixpkgs;

  # A package set for the specified system, based on `defaultNixpkgs`, with
  # additional arguments and all overlays applied.
  pkgSetForSystem = system: args:
    defaultNixpkgs (args // nixpkgsArgs // { inherit system; });

  # `pkgSetForSystem` for the current system.
  pkgSet = args: pkgSetForSystem builtins.currentSystem args;

  inherit sources;
}
