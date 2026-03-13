#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=============================="
echo "  Mac Setup"
echo "=============================="
echo ""

for script in "$SCRIPT_DIR"/scripts/*.sh; do
  echo ""
  bash "$script"
done

echo ""
echo "=============================="
echo "  Setup Complete!"
echo "=============================="
echo ""
echo "Manual steps remaining:"
echo "  1. Sign into apps (1Password, Arc, etc.)"
echo "  2. Run 'wrangler login' for Cloudflare auth"
echo "  3. Install Raycast extension: Display Placer"
echo "  4. Import Meld Studio config from configs/meld-session.json"
echo "  5. Install Claude plugins (see output above)"
