{ pkgs }:

# Temporary downstream workarounds, applied in the extracted upstream source
# before generating lockfiles. Remove each block once upstream makes it redundant.
pkgs.writeShellApplication {
  name = "pi-patch";
  runtimeInputs = [ pkgs.nodejs ];
  text = # bash
    ''
      # GHSA-6j4f-fj2g-mc7p, GHSA-qhr7-859c-m2p7, GHSA-q2hr-2g5m-vwhr:
      # upstream locks brace-expansion to 5.0.9; all three are fixed in 5.0.12.
      # npm audit misses these, so refresh within minimatch's allowed range.
      npm update brace-expansion --package-lock-only --ignore-scripts
    '';
}
