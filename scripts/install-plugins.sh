#!/usr/bin/env bash
# Build + install Caixa WASM plugins into ~/.zeroclaw/plugins
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${ZEROCLAW_PLUGINS_DIR:-$HOME/.zeroclaw/plugins}"

rustup target add wasm32-wasip2 >/dev/null

build_one() {
  local name="$1"
  local dir="$ROOT/plugins/$name"
  local wasm_crate
  wasm_crate="${name//-/_}"
  echo "==> $name"
  (
    cd "$dir"
    cargo test -q
    cargo build --target wasm32-wasip2 --release -q
    cp "target/wasm32-wasip2/release/${wasm_crate}.wasm" "./${wasm_crate}.wasm"
  )
  mkdir -p "$DEST/$name"
  cp -a "$dir/." "$DEST/$name/"
  # drop build tree from install copy if present
  rm -rf "$DEST/$name/target"
}

build_one caixa-charge
build_one caixa-transfer-build
build_one caixa-watch

echo "Installed to $DEST"
echo "Next: merge operator/config.example.toml, copy SOUL (scripts/setup-agent.sh), restart daemon."
