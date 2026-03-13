#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Claude CLI Setup ==="

# Install Claude CLI
if ! command -v claude &>/dev/null; then
  echo "Installing Claude CLI..."
  curl -fsSL https://claude.ai/install.sh | bash
else
  echo "Claude CLI already installed."
fi

# Write Claude permissions config
echo "Configuring Claude permissions..."
mkdir -p "$HOME/.claude"
cp "$SCRIPT_DIR/../configs/claude-settings.json" "$HOME/.claude/settings.json"

echo "Claude CLI configured."
echo ""
echo "NOTE: Claude plugins must be installed interactively."
echo "Run these commands after setup:"
echo "  claude /plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill"
echo "  claude /plugin install ui-ux-pro-max@ui-ux-pro-max-skill"
echo "  claude /plugin install superpowers@obra-superpowers"
