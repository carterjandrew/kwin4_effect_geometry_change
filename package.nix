{
  lib,
  stdenvNoCC,
}:

let
  metadata = builtins.fromJSON (builtins.readFile ./package/metadata.json);
in
stdenvNoCC.mkDerivation {
  pname = "kwin4-effect-geometry-change";
  version = metadata.KPlugin.Version;

  src = ./.;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -d "$out/share/kwin/effects/kwin4_effect_geometry_change"
    cp -r package/. "$out/share/kwin/effects/kwin4_effect_geometry_change/"

    runHook postInstall
  '';

  meta = {
    description = metadata.KPlugin.Description;
    homepage = "https://github.com/carterjandrew/kwin4_effect_geometry_change";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
