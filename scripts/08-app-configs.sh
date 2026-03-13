#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== App Configurations ==="

echo ""
echo "Meld Studio:"
echo "  Session backup is stored at: configs/meld-session.json"
echo "  Import it via Meld Studio's settings after launching the app."
