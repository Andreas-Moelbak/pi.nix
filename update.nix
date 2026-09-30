{
  pkgs,
  regenerateModels,
  sync,
}:

pkgs.writeShellApplication {
  name = "pi-update";
  runtimeInputs = [
    regenerateModels
    sync
  ];
  text = # bash
    ''
      set -euo pipefail

      pi-sync

      pi-regenerate-models
    '';
}
