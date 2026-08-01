#!/usr/bin/env bash
# Copy shop SOUL + AGENTS into a ZeroClaw agent workspace
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGENT="${1:-caixa}"
WS="${ZEROCLAW_HOME:-$HOME/.zeroclaw}/agents/$AGENT/workspace"

mkdir -p "$WS"
cp "$ROOT/operator/SOUL.md" "$WS/SOUL.md"
cp "$ROOT/operator/AGENTS.md" "$WS/AGENTS.md"
echo "Wrote $WS/SOUL.md and AGENTS.md"
echo "Bind Telegram peer to agent '$AGENT', set recipient pubkey, then: zeroclaw daemon -v"
