#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BREWFILE="$SCRIPT_DIR/../Brewfile"

echo "=== Brew Bundle ==="
echo "Installing packages from Brewfile..."
brew bundle --file="$BREWFILE" --no-lock

echo "All Homebrew packages installed."
