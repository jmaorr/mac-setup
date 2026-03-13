#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ZSHRC="$HOME/.zshrc"
MARKER="# --- Mac Setup managed ---"

echo "=== Shell Configuration ==="

# Create .zshrc if it doesn't exist
touch "$ZSHRC"

# Only append if our marker isn't already present
if ! grep -q "$MARKER" "$ZSHRC" 2>/dev/null; then
  echo "Appending shell config to ~/.zshrc..."
  echo "" >> "$ZSHRC"
  echo "$MARKER" >> "$ZSHRC"
  cat "$SCRIPT_DIR/../configs/zshrc.append" >> "$ZSHRC"
  echo "# --- End Mac Setup ---" >> "$ZSHRC"
  echo "Shell config applied."
else
  echo "Shell config already applied, skipping."
fi
