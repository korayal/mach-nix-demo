# MACH-NIX DEMO

A sample project to demonstrate an issue with mach-nix

# Usage
If you run the command below:

```
nix-shell <project-path>/shell.nix --run ipython
```

you'll be able to import `demo.module`.

But if you run this instead:

```
nix-shell -p 'with import (fetchTarball "https://github.com/korayal/mach-nix-demo/archive/master.tar.gz") {}; python37.withPackages (ps: with ps; [ ipython demo-library ])' --run ipython
```

`demo.module` will not be available
