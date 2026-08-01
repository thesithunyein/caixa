#!/usr/bin/env bash
# Install prebuilt .wasm from a GitHub Actions artifact zip (or Release zip).
# Usage: ./scripts/install-from-artifact.sh /path/to/caixa-plugins-wasm.zip
set -euo pipefail

ZIP="${1:-}"
if [[ -z "$ZIP" || ! -f "$ZIP" ]]; then
  echo "Usage: $0 /path/to/caixa-plugins-wasm.zip" >&2
  echo "Download from: https://github.com/thesithunyein/caixa/actions (Artifacts)" >&2
  exit 1
fi

DEST="${ZEROCLAW_PLUGINS_DIR:-$HOME/.zeroclaw/plugins}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

unzip -q "$ZIP" -d "$TMP"
mkdir -p "$DEST/caixa-charge" "$DEST/caixa-watch" "$DEST/caixa-transfer-build"

# Support either flat or nested layout from CI
find "$TMP" -name 'caixa_charge.wasm' -exec cp {} "$DEST/caixa-charge/" \;
find "$TMP" -name 'caixa_watch.wasm' -exec cp {} "$DEST/caixa-watch/" \;
find "$TMP" -name 'caixa_transfer_build.wasm' -exec cp {} "$DEST/caixa-transfer-build/" \;

# Copy manifests from this repo if present (cwd or script root)
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
for name in caixa-charge caixa-watch caixa-transfer-build; do
  if [[ -f "$ROOT/plugins/$name/manifest.toml" ]]; then
    cp "$ROOT/plugins/$name/manifest.toml" "$DEST/$name/"
  fi
done

echo "Installed WASM to $DEST"
ls -la "$DEST"/caixa-*/**.wasm 2>/dev/null || ls -la "$DEST"/caixa-*/*.wasm
