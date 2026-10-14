# kwin4_effect_geometry_change
A KWin animation for windows moved or resized by programs or scripts

https://user-images.githubusercontent.com/22796326/234871172-03881400-36f5-40d8-bb5d-1f67960cfe8f.mp4

## Installation
Download the [latest release](https://github.com/peterfajdiga/kwin4_effect_geometry_change/releases/latest) and extract it into _~/.local/share/kwin/effects/_.

Or clone the repo and run `make install`.

### Nix

Install the effect directly into your user profile:

```sh
nix profile install github:carterjandrew/kwin4_effect_geometry_change
```

To use it from a NixOS or Home Manager flake, add this repository as an input:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    geometry-change = {
      url = "github:carterjandrew/kwin4_effect_geometry_change";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

Then install the package system-wide in NixOS:

```nix
{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.geometry-change.packages.${pkgs.system}.default
  ];
}
```

Or install it for one user with Home Manager:

```nix
{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.geometry-change.packages.${pkgs.system}.default
  ];
}
```

The flake also provides an overlay if you prefer to access the package through
`pkgs`:

```nix
{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.geometry-change.overlays.default ];
  environment.systemPackages = [ pkgs.kwin4-effect-geometry-change ];
}
```

After installing and rebuilding your configuration, enable **Geometry Change**
under **System Settings → Window Management → Desktop Effects**. You may need to
log out and back in before KWin discovers a newly installed effect.
